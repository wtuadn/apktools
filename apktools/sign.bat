set oPath=%~d0%~p0
set apk=%1

set keyPath=%oPath%key
set alias=alias1
set storePass=000000
set aliasPass=111111
set buildTool=26.0.2

for /f "delims=" %%i in ('where adb') do cd /d %%~dpi
cd ..\build-tools\%buildTool%
set input=%apk%
set output=%apk%-temp.apk
zipalign 4 %input% %output%
move /y %output% %input%
apksigner sign --v2-signing-enabled true --v1-signing-enabled true --ks %keyPath% --ks-key-alias %alias% --ks-pass pass:%storePass% --key-pass pass:%aliasPass% %apk%
cd /d %oPath%