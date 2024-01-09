# Initialise Vars
$Uri = "https://raw.githubusercontent.com/WestspringIT-Implementation/Internal_scripts/main/DotNET_Clean-Uninstall/dotnet-core-uninstall-1.6.0.msi"
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

# Reload powershell window to make the dotnet-core-uninstall* commands availabel for use
Invoke-Command { & "powershell.exe" } -NoNewScope

# Remove all donet componants
dotnet-core-uninstall remove --all --aspnet-runtime  --force --yes
dotnet-core-uninstall remove --all --hosting-bundle  --force --yes
dotnet-core-uninstall remove --all --runtime  --force --yes
dotnet-core-uninstall remove --all --sdk  --force --yes
