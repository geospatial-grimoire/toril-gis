# This Powershell script stops the Cloud SQL instance for Geospatial Grimoire
# Update USER_NAME placeholder with your Windows username
# Ensure google-cloud-sdk is installed

# 🔔 Function for system notification
function Notify-Success {
    param([string]$message)

    # Try using BurntToast for better notifications
    if (Get-Module -ListAvailable -Name BurntToast) {
        New-BurntToastNotification -Text "✅ Success!", $message
    } else {
        Add-Type -AssemblyName System.Windows.Forms
        [System.Windows.Forms.MessageBox]::Show($message, "Success", "OK", "Information")
    }
}

function Notify-Error {
    param([string]$message)

    if (Get-Module -ListAvailable -Name BurntToast) {
        New-BurntToastNotification -Text "❌ Error!", $message
    } else {
        Add-Type -AssemblyName System.Windows.Forms
        [System.Windows.Forms.MessageBox]::Show($message, "Error", "OK", "Error")
    }
}

# Set variables
$PROJECT_ID = "geospatial-grimoire"
$INSTANCE_NAME = "geogrimoire-sql"
$GCLOUD_PATH = "C:\Users\USER_NAME\AppData\Local\Google\Cloud SDK\google-cloud-sdk\bin\gcloud.cmd"

# Ensure gcloud is in PATH
$env:Path += ";C:\Users\USER_NAME\AppData\Local\Google\Cloud SDK\google-cloud-sdk\bin"

# Check Cloud SQL instance status
Write-Host "🔍 Checking Cloud SQL instance status..."
$status = & $GCLOUD_PATH sql instances describe $INSTANCE_NAME --project=$PROJECT_ID --format="value(state)"
$status = $status.Trim()

Write-Host "🔍 Current status: $status"

# If the instance is already stopped, exit
if ($status -eq "STOPPED") {
    Write-Host "✅ Cloud SQL instance '$INSTANCE_NAME' is already STOPPED!"
    Notify-Success "Cloud SQL instance is already stopped."
    exit 0
}

# If the instance is RUNNABLE, stop it
if ($status -eq "RUNNABLE") {
    Write-Host "🛑 Stopping Cloud SQL instance '$INSTANCE_NAME'..."
    $startTime = Get-Date  # Start time measurement
    & $GCLOUD_PATH sql instances patch $INSTANCE_NAME --activation-policy=NEVER --project=$PROJECT_ID
} else {
    Write-Host "⚠️ Cloud SQL instance is in an unknown state: $status"
    Notify-Error "Cloud SQL stop failed. Unknown state: $status"
    exit 1
}

# Wait until the instance is STOPPED (NO TIME CONSTRAINT)
Write-Host "⏳ Waiting indefinitely for Cloud SQL to become STOPPED..."

do {
    Start-Sleep -Seconds 10

    # Get current status again
    $status = & $GCLOUD_PATH sql instances describe $INSTANCE_NAME --project=$PROJECT_ID --format="value(state)"
    $status = $status.Trim()

    Write-Host "⏳ Checking Cloud SQL status: $status"

} until ($status -eq "STOPPED")

$endTime = Get-Date
$timeTakenSeconds = [math]::Round(($endTime - $startTime).TotalSeconds)  # Round seconds to integer
$timeTakenMinutes = [math]::Floor($timeTakenSeconds / 60)  # Convert to minutes
$remainingSeconds = $timeTakenSeconds % 60  # Remaining seconds

Write-Host "✅ Cloud SQL instance '$INSTANCE_NAME' is now STOPPED!"
Write-Host "⏱️ Time taken: $timeTakenMinutes minutes and $remainingSeconds seconds"

Notify-Success "Cloud SQL is now stopped! Time taken: $timeTakenMinutes min $remainingSeconds sec."
exit 0
