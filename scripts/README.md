# Scripts CLI — Setup de Agentes en Copilot Studio

## Contexto

Este directorio contiene scripts para configurar los agentes del workshop usando la **Power Platform CLI (pac)**.

> ⚠️ **Estado actual de la CLI**: A fecha de 2026, no todas las operaciones de Copilot Studio son automatizables al 100% desde CLI. Abajo se indica qué es CLI y qué requiere UI.

## Prerequisitos

```powershell
# Instalar PAC CLI (si no está instalado)
dotnet tool install --global Microsoft.PowerApps.CLI.Tool

# Verificar instalación
pac --version

# Autenticarse
pac auth create --environment "https://tuorg.crm4.dynamics.com"
```

## Operaciones automatizables (CLI)

| Operación | Comando | Estado |
|-----------|---------|--------|
| Listar entornos | `pac env list` | ✅ CLI |
| Seleccionar entorno | `pac env select --environment "nombre"` | ✅ CLI |
| Crear solución | `pac solution create --name "DetectiveHack" --publisher-name "Workshop"` | ✅ CLI |
| Exportar agente (backup) | `pac solution export --name "DetectiveHack" --path ./backup/` | ✅ CLI |
| Importar agente | `pac solution import --path ./solution.zip` | ✅ CLI |

## Operaciones manuales (requieren UI de Copilot Studio)

| Operación | Por qué no es CLI | Pasos manuales |
|-----------|-------------------|----------------|
| Crear agente nuevo | La API de creación requiere UI | Ver paso a paso abajo |
| Configurar Knowledge (RAG) | No hay endpoint CLI | Subir docs en UI |
| Configurar Data Agent (Fabric) | Integración via UI | Conectar modelo semántico |
| Configurar Vision | Capacidad integrada | Activar en settings |
| Probar agente | Panel de pruebas en UI | Click "Test" |

## Paso a paso: Crear agentes manualmente

### Agente 1: Detective (Orquestador)

1. Ve a [copilotstudio.microsoft.com](https://copilotstudio.microsoft.com)
2. Click **"+ Crear"** → **"Nuevo agente"**
3. Nombre: `Detective - Operación Hackathon`
4. Descripción: `Agente orquestador que guía la investigación del robo de código`
5. En **"Instrucciones"** → Pega el contenido de `/prompts/detective.md`
6. En **"Conocimiento"** → No añadir (este orquesta a los otros)
7. En **"Acciones"** → Añadir conexiones a los otros 3 agentes cuando estén creados

### Agente 2: Analista de Datos

1. Click **"+ Crear"** → **"Nuevo agente"**
2. Nombre: `Analista de Datos`
3. Instrucciones: contenido de `/prompts/analista_datos.md`
4. **Conocimiento** → Conectar al modelo semántico de Fabric:
   - Click "Agregar conocimiento" → "Microsoft Fabric"
   - Selecciona tu workspace → Selecciona el modelo semántico
   - Activa "Permitir consultas en lenguaje natural"

### Agente 3: Archivista (RAG)

1. Click **"+ Crear"** → **"Nuevo agente"**
2. Nombre: `Archivista`
3. Instrucciones: contenido de `/prompts/archivista.md`
4. **Conocimiento** → Subir documentos:
   - Click "Agregar conocimiento" → "Archivos"
   - Sube los 6 archivos de `/docs`

### Agente 4: Analizador de Imágenes

1. Click **"+ Crear"** → **"Nuevo agente"**
2. Nombre: `Analizador de Imágenes`
3. Instrucciones: contenido de `/prompts/analizador_imagenes.md`
4. En **Configuración** → Activar "Aceptar imágenes adjuntas"

### Conectar al Orquestador

1. Vuelve al agente **Detective**
2. En **Acciones** → Agregar los 3 agentes como "agentes conectados"
3. El Detective podrá delegar preguntas a cada uno según contexto
