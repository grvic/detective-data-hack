# 🖼️ Imágenes de Evidencia — Placeholders

Este directorio debe contener las imágenes que usará el **Analizador de Imágenes** durante el workshop.

## Imágenes necesarias (reemplazar placeholders por fotos reales)

### 1. `usb_evidencia.jpg`
**Qué preparar:** Foto de un USB negro con una pegatina de calavera (puedes usar cualquier USB + sticker).  
**Qué debe extraer el agente:**
- Color: negro
- Pegatina: calavera blanca
- Capacidad visible (si la tiene grabada): 32GB
- Estado: buen estado, sin golpes
- Contexto: encontrado en una papelera

### 2. `captura_repo.png`
**Qué preparar:** Captura de pantalla de un repositorio Git vacío (o con un commit forzado de "Initial commit" sobre un repo que tenía historial).  
**Qué debe extraer el agente:**
- Timestamp del último push: 15 marzo 2026, 23:52
- Usuario: "system" o cuenta genérica
- Estado: 0 archivos, historial eliminado
- Rama: main

### 3. `foto_aula.jpg` (opcional)
**Qué preparar:** Foto de un aula de informática con portátiles en mesas.  
**Qué debe extraer el agente:**
- Disposición de equipos
- Si hay cámaras visibles
- Número de puestos
- Estado general (ordenado/desordenado)

## Cómo usar en el workshop

1. Reemplaza estos placeholders con fotos reales antes del taller
2. Súbelas a este directorio manteniendo los nombres
3. En Copilot Studio, configura el Analizador de Imágenes para aceptar adjuntos
4. Durante el workshop, los alumnos "enviarán" estas imágenes al Detective

## Notas

- **NO uses fotos con personas reconocibles** (caras de alumnos, etc.)
- Puedes usar fotos de stock o tomarlas tú mismo
- Lo importante es que contengan los elementos clave descritos arriba
- Si no tienes fotos, el workshop funciona igualmente — el Detective simplemente describirá lo que "se encontró" basándose en los documentos
