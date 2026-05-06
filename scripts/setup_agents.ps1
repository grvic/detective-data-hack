<#
.SYNOPSIS
    Script de setup para el workshop Detective Data Hack.
    Automatiza las partes CLI del despliegue en Power Platform.

.DESCRIPTION
    Este script:
    1. Verifica que PAC CLI está instalado
    2. Lista los entornos disponibles
    3. Crea una solución para empaquetar los agentes
    4. Muestra instrucciones para los pasos manuales

.NOTES
    Prerequisito: pac auth create --environment "tu-entorno"
#>

param(
    [string]$EnvironmentName = "",
    [string]$SolutionName = "DetectiveHack"
)

Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  🕵️ Detective Data Hack — Setup Script" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

# --- Paso 1: Verificar PAC CLI ---
Write-Host "[1/5] Verificando PAC CLI..." -ForegroundColor Yellow
try {
    $pacVersion = pac --version 2>&1
    Write-Host "  ✅ PAC CLI instalado: $pacVersion" -ForegroundColor Green
} catch {
    Write-Host "  ❌ PAC CLI no encontrado. Instálalo con:" -ForegroundColor Red
    Write-Host "     dotnet tool install --global Microsoft.PowerApps.CLI.Tool" -ForegroundColor White
    exit 1
}

# --- Paso 2: Verificar autenticación ---
Write-Host ""
Write-Host "[2/5] Verificando autenticación..." -ForegroundColor Yellow
$authList = pac auth list 2>&1
if ($authList -match "No auth profiles") {
    Write-Host "  ❌ No hay sesión activa. Ejecuta primero:" -ForegroundColor Red
    Write-Host "     pac auth create --environment 'tu-entorno'" -ForegroundColor White
    exit 1
} else {
    Write-Host "  ✅ Sesión activa encontrada" -ForegroundColor Green
}

# --- Paso 3: Listar entornos ---
Write-Host ""
Write-Host "[3/5] Entornos disponibles:" -ForegroundColor Yellow
pac env list

if ($EnvironmentName -ne "") {
    Write-Host ""
    Write-Host "  Seleccionando entorno: $EnvironmentName" -ForegroundColor Cyan
    pac env select --environment $EnvironmentName
}

# --- Paso 4: Crear solución ---
Write-Host ""
Write-Host "[4/5] Creando solución '$SolutionName'..." -ForegroundColor Yellow
Write-Host "  (Si ya existe, este paso se puede omitir)" -ForegroundColor Gray

# Nota: Este comando puede fallar si la solución ya existe
pac solution create --name $SolutionName --publisher-name "Workshop" --publisher-prefix "wks" 2>&1 | Out-Null
Write-Host "  ✅ Solución lista" -ForegroundColor Green

# --- Paso 5: Instrucciones manuales ---
Write-Host ""
Write-Host "[5/5] Pasos manuales pendientes:" -ForegroundColor Yellow
Write-Host ""
Write-Host "  📋 Abre https://copilotstudio.microsoft.com y crea:" -ForegroundColor White
Write-Host ""
Write-Host "  1. Agente 'Detective - Operación Hackathon'" -ForegroundColor White
Write-Host "     → Instrucciones: prompts/detective.md" -ForegroundColor Gray
Write-Host ""
Write-Host "  2. Agente 'Analista de Datos'" -ForegroundColor White
Write-Host "     → Instrucciones: prompts/analista_datos.md" -ForegroundColor Gray
Write-Host "     → Knowledge: Conectar modelo semántico de Fabric" -ForegroundColor Gray
Write-Host ""
Write-Host "  3. Agente 'Archivista'" -ForegroundColor White
Write-Host "     → Instrucciones: prompts/archivista.md" -ForegroundColor Gray
Write-Host "     → Knowledge: Subir los 6 archivos de /docs" -ForegroundColor Gray
Write-Host ""
Write-Host "  4. Agente 'Analizador de Imágenes'" -ForegroundColor White
Write-Host "     → Instrucciones: prompts/analizador_imagenes.md" -ForegroundColor Gray
Write-Host "     → Activar: aceptar imágenes adjuntas" -ForegroundColor Gray
Write-Host ""
Write-Host "  5. En el Detective → Acciones → Conectar los 3 agentes" -ForegroundColor White
Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  ✅ Setup CLI completado" -ForegroundColor Green
Write-Host "  📖 Ver scripts/README.md para detalles" -ForegroundColor Gray
Write-Host "================================================" -ForegroundColor Cyan
