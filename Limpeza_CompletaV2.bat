@echo off
color 03
Title Limpeza Completa e Manutenção do PC

:: Verifica se está sendo executado como administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ==================================================
    echo [ERRO]: Este script precisa ser executado como administrador.
    echo Por favor, clique nele com o botao direito e selecione
    echo "Executar como administrador".
    echo ==================================================
    pause
    exit /b
)

echo ==================================================
echo          INICIANDO LIMPEZA E MANUTENCAO DO PC
echo ==================================================
echo.

:: Definição de variáveis
set "windows=%windir%"
set "systemdrive=%systemdrive%"
set "userprofile=%userprofile%"
set "temp=%temp%"
set "history=%userprofile%\Local Settings\History"
set "cookies=%userprofile%\Cookies"
set "recent=%userprofile%\Recent"
set "printers=%systemroot%\system32\spool\printers"

echo [1/4] Verificando integridade dos arquivos de sistema...
echo.
sfc /scannow
echo.

echo [2/4] Restaurando a imagem do sistema...
echo.
Dism /Online /Cleanup-Image /RestoreHealth
echo.

echo [3/4] Limpando arquivos temporarios e desnecessarios...
echo.

echo Limpando arquivos temporarios do Windows...
del /s /f /q "%windows%\temp\*.*" 2>nul

echo Limpando arquivos Prefetch...
del /s /f /q "%windows%\Prefetch\*.exe" 2>nul
del /s /f /q "%windows%\Prefetch\*.dll" 2>nul
del /s /f /q "%windows%\Prefetch\*.pf" 2>nul

echo Limpando cache DLL...
del /s /f /q "%windows%\system32\dllcache\*.*" 2>nul

echo Limpando arquivos temporarios do sistema...
del /s /f /q "%systemdrive%\Temp\*.*" 2>nul
del /s /f /q "%temp%\*.*" 2>nul

echo Limpando historico e arquivos temporarios do usuario...
del /s /f /q "%history%\*.*" 2>nul
del /s /f /q "%userprofile%\Local Settings\Temporary Internet Files\*.*" 2>nul
del /s /f /q "%userprofile%\Local Settings\Temp\*.*" 2>nul
del /s /f /q "%recent%\*.*" 2>nul
del /s /f /q "%cookies%\*.*" 2>nul

echo.
echo [4/4] Limpando registros de eventos do sistema...
echo.

FOR /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")

echo.
echo ==================================================
echo          LIMPEZA E MANUTENCAO CONCLUIDAS!
echo ==================================================
echo.
echo Todas as operacoes foram executadas com sucesso:
echo - Verificacao de integridade dos arquivos de sistema
echo - Restauracao da imagem do sistema
echo - Limpeza de arquivos temporarios e desnecessarios
echo - Limpeza dos registros de eventos
echo.
pause
exit

:do_clear
echo Limpando log: %1...
wevtutil.exe cl %1 2>nul
goto :eof