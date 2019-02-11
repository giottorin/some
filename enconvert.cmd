@echo off
if "%1"=="/?" (
    echo conversion txt files from cp866 to UTF- 8, write file directory
    exit /b
)
if exist text.txt (
    echo Delete temp.txt
    exit /b
)
if exist %1 (
    for /R %1 %%f in (*.txt) do (
        CMD /U /C Type %%f > text.txt
        Type text.txt > %%f
        del text.txt
    )
) else (
    echo ERROR: DIRECTORY NOT FOUND 
)