@ECHO OFF
setlocal

set PROJECT_HOME=%~dp0
set DEMO=Install Demo
set AUTHORS=Andrew Block, Eric D. Schabell
set PROJECT=git@github.com:jbossdemocentral/brms-install-demo.git
set PRODUCT=JBoss BRMS
set JBOSS_HOME=%PROJECT_HOME%target\jboss-eap-6.1
set SERVER_DIR=%JBOSS_HOME%\standalone\deployments\
set SERVER_CONF=%JBOSS_HOME%\standalone\configuration\
set SERVER_BIN=%JBOSS_HOME%\bin
set SRC_DIR=%PROJECT_HOME%installs
set SUPPORT_DIR=%PROJECT_HOME%\support
set PRJ_DIR=%PROJECT_HOME%\projects
set BRMS=jboss-brms-installer-6.0.3.GA-redhat-1.jar
set VERSION=6.0.3

REM wipe screen.
cls

echo.
echo #################################################################
echo ##                                                             ##   
echo ##  Setting up the %DEMO%                                ##
echo ##                                                             ##   
echo ##                                                             ##   
echo ##     ####  ####   #   #   ###    #####                       ##
echo ##     #   # #   # # # # # #       #                           ##
echo ##     ####  ####  #  #  #  ##     #####                       ##
echo ##     #   # # #   #     #    #    #   #                       ##
echo ##     ####  #  #  #     # ###     #####                       ##
echo ##                                                             ##   
echo ##                                                             ##   
echo ##  brought to you by,                                         ##   
echo ##             %AUTHORS%                  ##
echo ##                                                             ##   
echo ##  %PROJECT%      ##
echo ##                                                             ##   
echo #################################################################
echo.

REM make some checks first before proceeding.	
if exist %SRC_DIR%\%BRMS% (
        echo Product sources are present...
        echo.
) else (
        echo Need to download %BRMS% package from the Customer Support Portal
        echo and place it in the %SRC_DIR% directory to proceed...
        echo.
        GOTO :EOF
)

REM Move the old JBoss instance, if it exists, to the OLD position.
if exist %JBOSS_HOME% (
         echo - existing JBoss product install detected...
         echo.
         echo - moving existing JBoss product install aside...
         echo.
        
        if exist "%JBOSS_HOME%.OLD" (
                rmdir /s /q "%JBOSS_HOME%.OLD"
        )
        
         move "%JBOSS_HOME%" "%JBOSS_HOME%.OLD"
 )

REM Run installer.
echo Product installer running now...
echo.
call java -jar %SRC_DIR%/%BRMS% %SUPPORT_DIR%\installation-brms -variablefile %SUPPORT_DIR%\installation-brms.variables

if not "%ERRORLEVEL%" == "0" (
	echo Error Occurred During %PRODUCT% Installation!
	echo.
	GOTO :EOF
)

echo - enabling demo accounts role setup in application-roles.properties file...
echo.
xcopy /Y /Q "%SUPPORT_DIR%\application-roles.properties" "%SERVER_CONF%"
echo. 

echo - setting up standalone.xml configuration adjustments...
echo.
xcopy /Y /Q "%SUPPORT_DIR%\standalone.xml" "%SERVER_CONF%"
echo.

echo.
echo You can now start the %PRODUCT% with %SERVER_BIN%\standalone.bat
echo.
echo You can open business central in browser at:
echo.
echo  localhost:8080/business-central 
echo.
echo and login as user: erics and password: jbossbrms1!
echo.
echo %PRODUCT% %VERSION% %DEMO% Setup Complete.
echo.
