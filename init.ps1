
# wipe screen
Clear-Host

$PROJECT_HOME = $PSScriptRoot
$DEMO="Install Demo"
$AUTHORS="Andrew Block, Eric D. Schabell"
$PROJECT="git@github.com:jbossdemocentral/brms-install-demo.git"
$PRODUCT="JBoss BRMS"
$TARGET="$PROJECT_HOME\target"
$JBOSS_HOME="$TARGET\jboss-eap-7.0"
$SERVER_DIR="$JBOSS_HOME\standalone\deployments\"
$SERVER_CONF="$JBOSS_HOME\standalone\configuration\"
$SERVER_BIN="$JBOSS_HOME\bin"
$SRC_DIR="$PROJECT_HOME\installs"
$SUPPORT_DIR="$PROJECT_HOME\support"
$PRJ_DIR="$PROJECT_HOME\projects"
$BRMS="jboss-brms-6.4.0.GA-deployable-eap7.x.zip"
$EAP="jboss-eap-7.0.0-installer.jar"
#$EAP_PATCH="jboss-eap-6.4.7-patch.zip"
$VERSION="6.4"

set NOPAUSE=true

Write-Host "#################################################################"
Write-Host "##                                                             ##"
Write-Host "##  Setting up the %DEMO%                          ##"
Write-Host "##                                                             ##"
Write-Host "##                                                             ##"
Write-Host "##     ####  ####   #   #   ###    #####                       ##"
Write-Host "##     #   # #   # # # # # #       #                           ##"
Write-Host "##     ####  ####  #  #  #  ##     #####                       ##"
Write-Host "##     #   # # #   #     #    #    #   #                       ##"
Write-Host "##     ####  #  #  #     # ###     #####                       ##"
Write-Host "##                                                             ##"
Write-Host "##                                                             ##"
Write-Host "##  brought to you by,                                         ##"
Write-Host "##                     %AUTHORS%           ##"
Write-Host "##                                                             ##"
Write-Host "##  %PROJECT%##"
Write-Host "##                                                             ##"
Write-Host "#################################################################`n"


If (Test-Path "$SRC_DIR\$EAP") {
	Write-Host "Product sources are present...`n"
} Else {
	Write-Host "Need to download $EAP package from the Customer Support Portal"
	Write-Host "and place it in the $SRC_DIR directory to proceed...`n"
	exit
}

#If (Test-Path "$SRC_DIR\$EAP_PATCH") {
#	Write-Host "Product patches are present...`n"
#} Else {
#	Write-Host "Need to download $EAP_PATCH package from the Customer Support Portal"
#	Write-Host "and place it in the $SRC_DIR directory to proceed...`n"
#	exit
#}

If (Test-Path "$SRC_DIR\$BRMS") {
	Write-Host "Product sources are present...`n"
} Else {
	Write-Host "Need to download $BRMS package from the Customer Support Portal"
	Write-Host "and place it in the $SRC_DIR directory to proceed...`n"
	exit
}

#Test whether Java is available.
if ((Get-Command "java.exe" -ErrorAction SilentlyContinue) -eq $null)
{
   Write-Host "The 'java' command is required but not available. Please install Java and add it to your PATH.`n"
   exit
}

if ((Get-Command "javac.exe" -ErrorAction SilentlyContinue) -eq $null)
{
   Write-Host "The 'javac' command is required but not available. Please install Java and add it to your PATH.`n"
   exit
}

# Test whether 7Zip is available.
# We use 7Zip because it seems to be one of the few ways to extract the BRMS zip file without hitting the 260 character limit problem of the Windows API.
# This is definitely not ideal, but I can't unzip without problems when using the default Powershell unzip utilities.
# 7-Zip can be downloaded here: http://www.7-zip.org/download.html
if ((Get-Command "7z.exe" -ErrorAction SilentlyContinue) -eq $null)
{
   Write-Host "The '7z.exe' command is required but not available. Please install 7-Zip.`n"
	 Write-Host "7-Zip is used to overcome the Windows 260 character limit on paths while extracting the JBoss BRMS ZIP file.`n"
	 Write-Host "7-Zip can be donwloaded here: http://www.7-zip.org/download.html`n"
	 Write-Host "Please make sure to add '7z.exe' to your 'PATH' after installation.`n"
   exit
}

# Remove the old installation if it exists
If (Test-Path "$JBOSS_HOME") {
	Write-Host "Removing existing installation.`n"
	# The "\\?\" prefix is a trick to get around the 256 path-length limit in Windows.
	# If we don't do this, the Remove-Item command fails when it tries to delete files with a name longer than 256 characters.
	Remove-Item "\\?\$JBOSS_HOME" -Force -Recurse
}

#Run installers.
Write-Host "EAP installer running now...`n"
$argList = "-jar $SRC_DIR\$EAP $SUPPORT_DIR\installation-eap -variablefile $SUPPORT_DIR\installation-eap.variables"
$process = (Start-Process -FilePath java.exe -ArgumentList $argList -Wait -PassThru)
Write-Host "Process finished with return code: " $process.ExitCode
Write-Host "`n"

If ($process.ExitCode -ne 0) {
	Write-Error "Error installing JBoss EAP."
	exit
}

<#
Write-Host "Applying JBoss EAP patch now...`n"
Write-Host "The patch process will run in a separate window. Please wait for the 'Press any key to continue ...' message...`n"
$argList = '--command="patch apply ' + "$SRC_DIR\$EAP_PATCH" + ' --override-all"'
$patchProcess = (Start-Process -FilePath "$JBOSS_HOME\bin\jboss-cli.bat" -ArgumentList $argList -Wait -PassThru)
Write-Host "Process finished with return code: " $patchProcess.ExitCode
Write-Host ""

If ($patchProcess.ExitCode -ne 0) {
	Write-Error "Error occurred during JBoss EAP patch installation."
	exit
}

Write-Host "JBoss EAP patch applied succesfully!`n"
#>

Write-Host "Deploying JBoss BRMS now..."
# Using 7-Zip. This currently seems to be the only way to overcome the Windows 260 character path limit.
$argList = "x -o$TARGET -y $SRC_DIR\$BRMS"
$unzipProcess = (Start-Process -FilePath 7z.exe -ArgumentList $argList -Wait -PassThru -NoNewWindow)

If ($unzipProcess.ExitCode -ne 0) {
	Write-Error "Error occurred during JBoss BRMS installation."
	exit
}

Write-Host ""

Write-Host "- enabling demo accounts setup ...`n"
$argList1 = "-a -r ApplicationRealm -u brmsAdmin -p 'jbossbrms1!' -ro 'analyst,admin,manager,user,kie-server,kiemgmt,rest-all' --silent"
$argList2 = "-a -r ApplicationRealm -u erics -p 'jbossbrms1!' -ro 'analyst,admin,manager,user,kie-server,kiemgmt,rest-all' --silent"
try {
	Invoke-Expression "$JBOSS_HOME\bin\add-user.ps1 $argList1"
  Invoke-Expression "$JBOSS_HOME\bin\add-user.ps1 $argList2"
} catch {
	Write-Error "Error occurred during user account setup."
	exit
}

Write-Host "- setting up standalone.xml configuration adjustments...`n"
Copy-Item "$SUPPORT_DIR\standalone.xml" "$SERVER_CONF" -force

Write-Host "- setup email task notification user...`n"
Copy-Item "$SUPPORT_DIR\userinfo.properties" "$SERVER_DIR\business-central.war\WEB-INF\classes\" -force

Write-Host "============================================================================"
Write-Host "=                                                                          ="
Write-Host "=  You can now start the $PRODUCT with:                             ="
Write-Host "=                                                                          ="
Write-Host "=   $SERVER_BIN\standalone.ps1                          ="
Write-Host "=       or                                                                   ="
Write-Host "=   $SERVER_BIN\standalone.bat                          ="
Write-Host "=                                                                          ="
Write-Host "=  Login into business central at:                                         ="
Write-Host "=                                                                          ="
Write-Host "=    http://localhost:8080/business-central  (u:brmsAdmin / p:jbossbrms1!)  ="
Write-Host "=                                                                          ="
Write-Host "=  See README.md for general details to run the various demo cases.        ="
Write-Host "=                                                                          ="
Write-Host "=  $PRODUCT $VERSION $DEMO Setup Complete.                  ="
Write-Host "=                                                                          ="
Write-Host "============================================================================"
