@echo off

set /a counter=0

for %%f in (*.png) do (
	cwebp -q 80 %%f -o %%~nf.webp
	set /A counter=counter+1
)

echo ************************************
echo %counter% files have been processed.
echo ************************************