# Define the path to your custom "Temp Files" folder
$tempFolder = "C:\Temp Files"

# Check if the folder exists
if (Test-Path $tempFolder) {
    # Get all files in the folder, filtering for files older than 2 weeks
    $files = Get-ChildItem -Path $tempFolder -Recurse -Force | Where-Object {
        $_.LastWriteTime -lt (Get-Date).AddDays(-14)  # Files older than 14 days
    }

    # Delete each file
    foreach ($file in $files) {
        Write-Host "Deleting file: $($file.FullName)"
        Remove-Item -Path $file.FullName -Force
    }

    Write-Host "Temporary files older than 2 weeks have been deleted."
}
else {
    Write-Host "The folder '$tempFolder' does not exist."
}
