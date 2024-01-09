# Initialise Vars
$Uri = "https://github.com/WestspringIT-Implementation/Internal_scripts/raw/main/DotNET_Clean-Uninstall/dotnet-core-uninstall-1.6.0.msi"0
$FilePath =  "C:\IT\dotnet-core-uninstall\"
$MSIName = "1.6.0.msi"
$MSIPath = "$FilePath$MSIName"

# Create detination directory if it doesn't already exist
If (!(Test-Path $FilePath)) {
    New-Item -ItemType Directory -Path $FilePath -Force
}

# Download the donnet-core-uninstall .msi
Invoke-WebRequest -Uri $Uri -OutFile $MSIPath

# Install donnet-core-uninstall .msi
msiexec.exe /i $MSIPath /quiet /norestart

# Clean up
Remove-Item -Path $FilePath -Recurse -ErrorAction SilentlyContinue
