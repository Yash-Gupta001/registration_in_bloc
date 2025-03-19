@echo off
set FLAVORS=hits pu

for %%F in (%FLAVORS%) do (
    echo Building Debug APK for flavor: %%F
    flutter build apk --debug --flavor %%F --dart-define=FLAVOR=%%F
    if %ERRORLEVEL% NEQ 0 (
        echo Failed to build Debug APK for flavor: %%F
        exit /b 1
    )

    echo Building Release APK for flavor: %%F
    flutter build apk --release --flavor %%F --dart-define=FLAVOR=%%F
    if %ERRORLEVEL% NEQ 0 (
        echo Failed to build Release APK for flavor: %%F
        exit /b 1
    )
)
