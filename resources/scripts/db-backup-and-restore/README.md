# ⚠️ Internal Database Utilities: Read Before Use

**NOTICE: These scripts are intended for the Project Author/Database Administrator ONLY.**

This guide provides the necessary steps to create and restore backups of the Toril GIS database. Following these instructions ensures data integrity, especially when moving the database between different environments (e.g., local Windows machine and cloud).

---

## 1. Creating a Backup

Creating a portable backup is handled by the `backup.py` Python script. This script uses `pg_dump` to create a compressed SQL file that is optimized for restoration on different systems.

### Prerequisites

- **Python:** A working Python installation.
- **python-dotenv:** The required Python library. Install it via pip:
    ```bash
    pip install python-dotenv
    ```
- **Configuration:** A `.env` file must be present in the same directory as the script, containing the database connection details and backup path.

### How to Run the Backup Script

1. **Configure `.env`:** Ensure your `.env` file is correctly filled out with your database credentials and the desired `BACKUP_DIR` path.
2. **Open a terminal** (e.g., PowerShell, cmd.exe, or your configured VS Code terminal).
3. **Navigate** to the directory containing the `backup.py` script and the `.env` file.
4. **Execute the script**:
    ```bash
    python backup.py
    ```

The script will create a compressed archive (e.g., `toril_backup_YYYYMMDD_HHMMSS.sql.gz`) in the directory specified by `BACKUP_DIR`. This backup is created with the `--no-owner` and `--no-acl` flags, making it highly portable.

---

## 2. Restoring a Backup

This process ensures a clean restore by correctly setting up the database, handling custom Coordinate Reference Systems (CRS), and managing character encoding.

### Prerequisites

- **PostgreSQL:** A local PostgreSQL server must be installed.
- **PostGIS:** The PostGIS extension must be available on the server.
- **psql:** The `psql` command-line tool should be in your system's PATH.
- **Dump File:** You must have a `.sql` database dump file. (If your backup is a `.gz` file, you must first decompress it).

### Step 1: Create a Clean Database

Connect to your default `postgres` database using a client like DBeaver or `psql`. Run the following SQL to drop any existing `toril` database and create a new one with the required `UTF-8` encoding.

```sql
-- This ensures a completely clean slate for the restore
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'toril';
DROP DATABASE IF EXISTS toril;
CREATE DATABASE toril WITH ENCODING = 'UTF8' TEMPLATE = template0;
```

### Step 2: Initialize PostGIS

Connect to your newly created, empty `toril` database and run the following command to enable all PostGIS functions and tables.

```sql
-- This enables PostGIS functionality, creating the spatial_ref_sys table
CREATE EXTENSION postgis;
```

### Step 3: Pre-load Custom CRS Definitions

The dump file requires custom CRS definitions to exist _before_ tables are created. Run the following `INSERT` statement in the `toril` database.

```sql
-- Pre-loads custom Coordinate Reference Systems (SRID 900000 and 900001)
INSERT INTO public.spatial_ref_sys (srid, auth_name, auth_srid, srtext) VALUES
(900000, 'TORIL', 1, 'GEOGCRS["Toril GCS",DATUM["Toril",ELLIPSOID["Toril",6410000,160.25,LENGTHUNIT["metre",1]]],PRIMEM["FRIA",0,ANGLEUNIT["degree",0.0174532925199433]],CS[ellipsoidal,2],AXIS["latitude (Lat)",north,ORDER[1],ANGLEUNIT["degree",0.0174532925199433]],AXIS["longitude (Lon)",east,ORDER[2],ANGLEUNIT["degree",0.0174532925199433]],USAGE[SCOPE["Web mapping and visualisation of Toril."],AREA["World."],BBOX[-90,-180,90,180]]]'),
(900001, 'TORIL', 2, 'PROJCRS["Toril PCS / Patterson",BASEGEOGCRS["Toril GCS",DATUM["Toril",ELLIPSOID["Toril",6410000,160.25,LENGTHUNIT["metre",1]]],PRIMEM["FRIA",0,ANGLEUNIT["degree",0.0174532925199433]]],CONVERSION["World_Patterson",METHOD["Patterson"],PARAMETER["Longitude of natural origin",0,ANGLEUNIT["Degree",0.0174532925199433],ID["EPSG",8802]],PARAMETER["False easting",0,LENGTHUNIT["metre",1],ID["EPSG",8806]],PARAMETER["False northing",0,LENGTHUNIT["metre",1],ID["EPSG",8807]]],CS[Cartesian,2],AXIS["(E)",east,ORDER[1],LENGTHUNIT["metre",1]],AXIS["(N)",north,ORDER[2],LENGTHUNIT["metre",1]],USAGE[SCOPE["Global map visualisation."],AREA["World."],BBOX[-90,-180,90,180]]]');
```

### Step 4: Run the Restore Command

Open the Windows Command Prompt (`cmd.exe`) for this step, as it reliably handles character encoding.

1. Navigate to the directory containing your dump file.

    ```powershell
    cd C:\path\to\your\dumps
    ```

2. Run the following two commands. The first sets the client encoding for the session, and the second runs the restore.

    ```powershell
    :: Set the client encoding to prevent character corruption
    set PGCLIENTENCODING=UTF8

    :: Run the restore. Replace 'your_dump_file.sql' with the actual filename.
    & "C:\Program Files\PostgreSQL\18\bin\psql.exe" -U postgres -d toril -f ".\toril_backup_20260320_122539.sql"
    ```

    **Note:** It's normal to see a "duplicate key" error for SRID `900000` at the end of the process. This can be safely ignored.


### Step 5: Finalize and Verify

After the restore command finishes, connect to the `toril` database one last time and run this command to update the PostGIS extension.

```sql
ALTER EXTENSION postgis UPDATE;
```

Your database is now fully restored.