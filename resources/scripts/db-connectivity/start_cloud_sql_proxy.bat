# Update USER_NAME placeholder with your Linux username
@echo off
echo Starting Cloud SQL Proxy...

set CLOUD_SQL_INSTANCE=geospatial-grimoire:europe-west8:geogrimoire-sql
set CLOUD_SQL_PROXY_PATH="C:\Users\USER_NAME\Apps\cloud-sql-proxy.exe"

if not exist %CLOUD_SQL_PROXY_PATH% (
    echo ERROR: cloud-sql-proxy.exe not found at %CLOUD_SQL_PROXY_PATH%
    pause
    exit /b
)

echo Connecting to Cloud SQL instance: %CLOUD_SQL_INSTANCE%
%CLOUD_SQL_PROXY_PATH% --address 127.0.0.1 --port 5433 %CLOUD_SQL_INSTANCE%

echo Cloud SQL Proxy started. Press any key to exit...
pause
