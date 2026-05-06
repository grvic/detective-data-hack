# 🕵️ Operación Hackathon — Handout del Alumno

## Tu misión

Alguien ha **robado el código fuente** del proyecto ganador del hackathon. Tu trabajo es descubrir **quién, cuándo y cómo** usando 3 agentes de IA.

---

## Tus herramientas

| Agente | Para qué usarlo | Ejemplo de pregunta |
|--------|-----------------|---------------------|
| 📊 **Analista de Datos** | Números, tablas, logs, WiFi | "¿Quién accedió al Aula 3 de noche?" |
| 📁 **Archivista** | Testimonios, normas, emails | "¿Qué dice el vigilante sobre las 23:00?" |
| 🖼️ **Analizador de Imágenes** | Fotos de evidencia | "¿Qué se ve en la foto del USB?" |

---

## 10 preguntas ejemplo (por agente)

### 📊 Para el Analista de Datos
1. ¿Quién accedió al Aula 3 entre las 22:00 y las 06:00?
2. ¿Cuánto tiempo estuvo cada persona en el Aula 3 de noche?
3. ¿Quién se conectó al WiFi del Aula 3 (AP-AULA3) de noche?
4. ¿Cuántos MB transfirió cada persona conectada al AP-AULA3 en horario nocturno?
5. ¿A qué equipo pertenece cada sospechoso?
6. ¿Cuál fue el resultado del hackathon (qué equipo ganó y cuál perdió)?
7. ¿Hay alguien que accedió al edificio pero NO al Aula 3?
8. ¿A qué hora salió Adrián Campos del Aula 3?
9. ¿Coincide la conexión WiFi de alguien con la hora del borrado (23:52)?
10. ¿Pablo Ortega se conectó al AP-AULA3 o al AP-AULA4?

### 📁 Para el Archivista
1. ¿Qué dice el acta sobre las normas de acceso fuera de horario?
2. ¿Qué observó la profesora sobre el comportamiento de los equipos?
3. ¿Cuál es la coartada de Adrián Campos?
4. ¿A qué hora dice Adrián que se fue del Aula 3?
5. ¿Qué encontró el vigilante por la mañana?
6. ¿A qué hora se ejecutó el git push --force según el email del organizador?
7. ¿Qué dice la profesora sobre la relación entre Pablo y Adrián?
8. ¿El vigilante vio algo raro en su ronda de las 22:00?
9. ¿Qué se necesita para borrar un repositorio Git según el email?
10. ¿Hay alguna contradicción entre lo que dice Adrián y los datos?

### 🖼️ Para el Analizador de Imágenes
1. ¿De qué color es el USB encontrado?
2. ¿Qué pegatina tiene?
3. ¿Qué capacidad tiene el USB?
4. ¿Dónde fue encontrado (según el contexto de la foto)?
5. ¿Hay algún texto visible en el USB o sus alrededores?

---

## ❌ 5 Anti-patrones de preguntas (NO hagas esto)

| # | Anti-patrón | Por qué falla | Mejor alternativa |
|---|-------------|---------------|-------------------|
| 1 | "Dime quién es el culpable" | El agente no es juez — necesita que TÚ formules la hipótesis | "¿Los datos apoyan que X es sospechoso?" |
| 2 | "Analiza todo" | Demasiado amplio, respuesta inútil | "Analiza los accesos al Aula 3 entre las 22:00 y 02:00" |
| 3 | "¿Es verdad que...?" (dato inventado) | Puedes inducir una alucinación | "¿Qué dicen los datos sobre...?" |
| 4 | Preguntar datos al Archivista | El Archivista busca en documentos, no en tablas | Usa el Analista para números |
| 5 | "Cuéntame todo sobre Adrián" | Demasiado vago | "¿A qué hora entró y salió Adrián del Aula 3?" |

---

## 📝 Tu hoja de investigación

Apunta aquí tus descubrimientos:

| Paso | Pregunta que hice | Respuesta clave | Agente usado |
|------|------------------|-----------------|--------------|
| 1 | | | |
| 2 | | | |
| 3 | | | |
| 4 | | | |
| 5 | | | |
| 6 | | | |
| 7 | | | |

---

## 🎯 Para cerrar el caso necesitas

- [ ] Nombre del culpable
- [ ] Al menos 3 evidencias de los datos
- [ ] Una contradicción entre su declaración y los logs
- [ ] Su posible motivo

¡Buena suerte, detective! 🔍
