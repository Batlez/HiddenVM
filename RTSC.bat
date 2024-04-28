@echo off
TaskKill /IM "VirtualBox.exe"
TaskKill /IM "VBoxSVC.exe"
set /P n1="Enter Virtual Machine Name: "
set /P vboxpath="Enter the full path to vboxmanage.exe (C:\Program Files\Vektor T13\VirtualBox\vboxmanage.exe): "
set "vboxman=%vboxpath%"
"%vboxman%" setextradata "%n1%" VBoxInternal/TM/UseRealTSC
if %errorlevel% == 0 (
    echo Successfully set UseRealTSC for "%n1%".
) else (
    echo Failed to set UseRealTSC for "%n1%".
)
"%vboxman%" setextradata "%n1%" VBoxInternal/TM/TSCMode RealTSCOffset
if %errorlevel% == 0 (
    echo Successfully set TSCMode for "%n1%".
) else (
    echo Failed to set TSCMode for "%n1%".
)
"%vboxman%" setextradata "%n1%" VBoxInternal/CPUM/SSE4.1 1
if %errorlevel% == 0 (
    echo Successfully enabled SSE4.1 for "%n1%".
) else (
    echo Failed to enable SSE4.1 for "%n1%".
)
"%vboxman%" setextradata "%n1%" VBoxInternal/CPUM/SSE4.2 1
if %errorlevel% == 0 (
    echo Successfully enabled SSE4.2 for "%n1%".
) else (
    echo Failed to enable SSE4.2 for "%n1%".
)
@pause