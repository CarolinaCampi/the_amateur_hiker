@echo off
setlocal enabledelayedexpansion

:: Loop through all JPG files in the current directory
for %%F in (*.jpg *.jpeg) do (
    echo Processing %%F...

    set "basename=%%~nF"

    :: Convert JPG to PNG with auto-orientation and clean metadata
    magick "%%F" -auto-orient -strip "!basename!.png"

    :: Convert PNG to WEBP
    cwebp "!basename!.png" -o "!basename!.webp"

    :: Delete intermediate PNG
    del "!basename!.png"

    echo Done with %%F
)

echo All conversions completed.
pause