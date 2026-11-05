# NFR-2: .exe не должен зависеть от динамического CRT (MSVCP*, VCRUNTIME*, ucrtbase*, api-ms-win-crt-*).
# Запуск: pwsh .github/scripts/check-static-crt.ps1 build/release/bin/Release/cube_snake.exe
param([Parameter(Mandatory)][string]$ExePath)
$ErrorActionPreference = 'Stop'

$vswhere = Join-Path ${env:ProgramFiles(x86)} 'Microsoft Visual Studio\Installer\vswhere.exe'
$dumpbin = & $vswhere -latest -products * -find 'VC\Tools\MSVC\*\bin\Hostx64\x64\dumpbin.exe' |
    Select-Object -First 1
if (-not $dumpbin) { throw 'dumpbin.exe не найден через vswhere' }

$output = & $dumpbin /nologo /dependents $ExePath
if ($LASTEXITCODE -ne 0) { throw "dumpbin завершился с кодом $LASTEXITCODE" }
$output

$dynamicCrt = $output | Select-String -Pattern '(?i)\b(msvcp|vcruntime|ucrtbase|api-ms-win-crt)'
if ($dynamicCrt) {
    Write-Error "Найдена зависимость от динамического CRT: $($dynamicCrt -join ', ')"
    exit 1
}
Write-Host 'OK: динамического CRT нет'
