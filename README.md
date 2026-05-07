# 🕵️ Detective Data Hack — Operación Hackathon

> **Workshop educativo** para demostrar cómo montar y orquestar agentes con Microsoft Copilot Studio desde CLI.  
> Duración: 60-90 minutos

---

## 🎯 Objetivo

Enseñar a pensar como el **"nuevo Data Analyst"**: saber **qué preguntar**, **a qué agente** y **en qué orden** para resolver un misterio usando datos estructurados, documentos y pistas visuales.

---

## 📖 El Caso: Operación Hackathon

Es la final del **HackTech 2026**, el hackathon anual del instituto. El equipo ganador —"EcoTrack"— descubre al día siguiente que **su código fuente ha sido borrado del repositorio** y alguien lo ha copiado en un USB que ha aparecido abandonado en el pasillo.

Hay **6 sospechosos** que tuvieron acceso al aula durante la noche. Los alumnos deben:
- Cruzar **logs de acceso** (quién entró y cuándo con su tarjeta)
- Analizar **conexiones de red** (quién usó el WiFi del aula)
- Revisar **testimonios** y documentos contradictorios
- Examinar una **foto del USB** abandonado para extraer pistas

¿Quién robó el código? ¿Tenía cómplice? ¿Cuál era su motivo?

---

## 🏗️ Arquitectura de Agentes

```
┌──────────────────────────────────────────────────────┐
│               🕵️ DETECTIVE (Orquestador)              │
│    Guía la investigación y decide a quién preguntar   │
└──────────┬───────────────┬───────────────┬───────────┘
           │               │               │
    ┌──────▼───────┐ ┌────▼──────┐ ┌──────▼───────┐
    │ 📊 Analista  │ │ 📁 Archi- │ │ 🖼️ Analizador│
    │  de Datos    │ │  vista    │ │  de Imagen   │
    │ (Fabric DA)  │ │  (RAG)    │ │  (Vision)    │
    └──────────────┘ └───────────┘ └──────────────┘
```

| Agente | Función | Fuente de datos |
|--------|---------|-----------------|
| **Analista de Datos** | Consultas sobre logs de acceso, conexiones WiFi, equipos, participantes | Modelo semántico en Fabric |
| **Archivista** | Buscar en testimonios, normativa, emails, actas | Corpus en `/docs` (RAG) |
| **Analizador de Imágenes** | Examinar fotos: USB, capturas de pantalla, pizarra | Imágenes en `/images` |

---

## 📂 Estructura del Repositorio

```
detective-data-hack/
├── README.md                 ← Este archivo
├── data/                     ← Dataset CSV + esquema
│   ├── participantes.csv
│   ├── equipos.csv
│   ├── accesos.csv
│   ├── conexiones_red.csv
│   ├── eventos.csv
│   └── schema.md             ← ERD Mermaid + medidas
├── docs/                     ← Corpus documental (RAG)
│   ├── 01_acta_hackathon.md
│   ├── 02_normativa_aulas.md
│   ├── 03_testimonio_profesora.md
│   ├── 04_testimonio_vigilante.md
│   ├── 05_email_organizador.md
│   └── 06_declaracion_sospechoso.md
├── images/                   ← Placeholders + guía visual
│   └── README.md
├── prompts/                  ← System prompts de agentes
│   ├── detective.md
│   ├── analista_datos.md
│   ├── archivista.md
│   └── analizador_imagenes.md
├── scripts/                  ← Scripts CLI para setup
│   ├── setup_agents.ps1
│   └── README.md
├── facilitator/              ← Material del profesor
│   ├── guia_facilitador.md
│   └── handout_alumno.md
└── conversations/            ← Ejemplos de resolución
    └── ejemplo_resolucion.md
```

---

## 🚀 Prerequisitos

| Herramienta | Para qué | Enlace |
|-------------|----------|--------|
| Cuenta Microsoft 365 | Acceso a Copilot Studio | [portal.office.com](https://portal.office.com) |
| Microsoft Fabric (trial OK) | Alojar datos + Data Agent | [fabric.microsoft.com](https://fabric.microsoft.com) |
| Power Platform CLI (`pac`) | Crear agentes desde terminal | [Instalar PAC CLI](https://learn.microsoft.com/en-us/power-platform/developer/cli/introduction) |
| Git | Clonar este repo | [git-scm.com](https://git-scm.com) |

---

## ⚡ Setup Rápido (15 min)

### Paso 1 — Clonar el repositorio
```bash
git clone https://github.com/tu-org/detective-data-hack.git
cd detective-data-hack
```

### Paso 2 — Subir datos a Fabric
1. Crea un **Lakehouse** en tu workspace de Fabric
2. Sube los 5 CSV de `/data` como tablas
3. Crea un **modelo semántico** con las relaciones descritas en `data/schema.md`
4. Activa el **Data Agent** sobre el modelo semántico

### Paso 3 — Crear agentes en Copilot Studio (CLI)
```powershell
# Autenticarse
pac auth create --environment "tu-entorno"

# Ejecutar script de creación
./scripts/setup_agents.ps1
```
> ⚠️ Ver `scripts/README.md` para detalles sobre qué pasos son CLI y cuáles requieren UI.

### Paso 4 — Configurar el Archivista (RAG)
1. En Copilot Studio → Agente "Archivista" → **Knowledge**
2. Añadir fuente → Subir los 6 archivos de `/docs`

### Paso 5 — Probar el caso
Abre el agente "Detective" en el panel de prueba y sigue `conversations/ejemplo_resolucion.md`.

---

## 📚 Teoría Express (12-15 min)

### 👥 Roles en el mundo de los datos

| Rol | ¿Qué hace? | Analogía |
|-----|-------------|----------|
| **Data Engineer** | Construye tuberías de datos | El fontanero: instala cañerías |
| **Data Analyst** | Pregunta y visualiza datos | El detective: busca pistas |
| **Data Scientist** | Predice con modelos | El adivino: ve el futuro con matemáticas |

### 📦 Datos estructurados vs no estructurados

| Estructurados | No estructurados |
|---------------|------------------|
| Tablas con filas y columnas | PDFs, fotos, emails, Word |
| Se consultan con SQL | Se buscan con RAG / IA |
| Ejemplo: log de accesos con tarjeta | Ejemplo: declaración de un testigo |

### 🤖 ¿Qué es un Agente?
Un programa de IA con **instrucciones concretas** y **acceso a herramientas**. Como un compañero de trabajo especializado al que le pides ayuda por chat.

### 📚 ¿Qué es RAG?
**R**etrieval **A**ugmented **G**eneration: antes de responder, el agente **busca** en documentos reales. Así no se inventa cosas: cita sus fuentes.

### 💬 Cómo preguntar bien (Prompt Engineering básico)

| ❌ Pregunta mala | ✅ Pregunta buena | ¿Por qué? |
|------------------|-------------------|------------|
| "Dime todo" | "¿Quién accedió al Aula 3 entre las 22:00 y las 02:00?" | Concreta lugar y hora |
| "¿Quién fue?" | "¿Qué participante tiene conexiones WiFi en el aula después de medianoche?" | Indica la tabla y filtro |
| "Analiza esto" | "En el testimonio del vigilante, ¿a qué hora dice que vio luz en el aula?" | Especifica documento y dato |
| "¿Es culpable?" | "¿La coartada de Marcos coincide con los logs de acceso?" | Cruza dos fuentes |

---

## 🏆 Créditos e Inspiración

Este workshop se inspira en el formato de investigación con datos del [SQL Murder Mystery de Knight Lab](https://mystery.knightlab.com/). La historia, personajes y datos son **completamente originales**, creados para este taller educativo.

---

## 📄 Licencia

MIT — Libre para uso educativo y modificación.
