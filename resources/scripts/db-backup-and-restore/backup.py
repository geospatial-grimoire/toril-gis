#
# PostgreSQL Backup Script (using .env for configuration)
#
# This script performs a backup of a specified PostgreSQL database using pg_dump.
# It uses the python-dotenv library to load configuration from a .env file.
# The dump is compressed into a .gz archive and moved to a designated backup directory.
#

import os
import subprocess
import tempfile
import shutil
import gzip
from datetime import datetime
from dotenv import load_dotenv


def run_backup():
    """
    Loads environment variables, performs the backup, compresses it, and cleans up.
    """
    # --- 1. Load Configuration from .env file ---
    load_dotenv()
    print("Configuration loaded from .env file.")

    # --- 2. Get Variables from Environment ---
    db_name = os.getenv("DB_DATABASE")
    db_user = os.getenv("DB_USER")
    db_password = os.getenv("DB_PASSWORD")
    db_host = os.getenv("DB_HOST")
    db_port = os.getenv("DB_PORT")
    final_backup_dir = os.getenv("BACKUP_DIR")
    pg_dump_path = os.getenv("PG_DUMP_PATH", "pg_dump")  # Defaults to 'pg_dump'

    # Basic validation
    if not all([db_name, db_user, db_host, db_port, final_backup_dir]):
        print(
            "ERROR: One or more required environment variables are missing in .env file."
        )
        print("Please check DB_DATABASE, DB_USER, DB_HOST, DB_PORT, BACKUP_DIR.")
        return

    # --- 3. Set PGPASSWORD Environment Variable (more secure) ---
    if db_password:
        os.environ["PGPASSWORD"] = db_password

    # --- 4. Define Filenames and Paths ---
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    backup_filename_sql = f"{db_name}_backup_{timestamp}.sql"
    backup_filename_gz = f"{backup_filename_sql}.gz"

    with tempfile.TemporaryDirectory() as temp_dir:
        temp_sql_path = os.path.join(temp_dir, backup_filename_sql)
        temp_gz_path = os.path.join(temp_dir, backup_filename_gz)

        # --- 5. Construct and Run pg_dump Command ---
        print(f"Starting backup for database '{db_name}'...")

        command = [
            pg_dump_path,
            "--host",
            db_host,
            "--port",
            db_port,
            "--username",
            db_user,
            "--dbname",
            db_name,
            "--file",
            temp_sql_path,
            "--format",
            "plain",
            "--no-owner",
            "--no-acl"
        ]

        try:
            subprocess.run(
                command, check=True, capture_output=True, text=True, encoding="utf-8"
            )
            print(" -> Dump created successfully.")
        except FileNotFoundError:
            print(f"ERROR: The command '{command[0]}' was not found.")
            print(
                "Ensure PostgreSQL bin directory is in your PATH or set PG_DUMP_PATH in .env"
            )
            return
        except subprocess.CalledProcessError as e:
            print(f"ERROR: pg_dump failed with return code {e.returncode}.")
            print(f" -> Error output:\n{e.stderr}")
            return

        # --- 6. Compress the SQL Dump ---
        print(f"Compressing dump file to '{backup_filename_gz}'...")
        try:
            with (
                open(temp_sql_path, "rb") as f_in,
                gzip.open(temp_gz_path, "wb") as f_out,
            ):
                shutil.copyfileobj(f_in, f_out)
            print(" -> Compression successful.")
        except Exception as e:
            print(f"ERROR: Failed to compress file: {e}")
            return

        # --- 7. Move to Final Destination ---
        os.makedirs(final_backup_dir, exist_ok=True)
        final_path = os.path.join(final_backup_dir, backup_filename_gz)
        try:
            shutil.move(temp_gz_path, final_path)
            print(f" -> Backup moved to '{final_path}'")
        except Exception as e:
            print(f"ERROR: Failed to move backup file: {e}")
            return

    # --- 8. Clean up password from environment ---
    if "PGPASSWORD" in os.environ:
        del os.environ["PGPASSWORD"]

    print("\nBackup process completed successfully! ✨")


if __name__ == "__main__":
    run_backup()
