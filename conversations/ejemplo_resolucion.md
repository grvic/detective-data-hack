# 💬 Ejemplo de Resolución — Conversaciones de Prueba

A continuación se muestran 5 conversaciones ejemplo que demuestran cómo resolver el caso paso a paso.

---

## Conversación 1: Planteamiento y contexto

**Alumno:** Hola Detective, ¿qué ha pasado?

**Detective:** 🕵️ ¡Bienvenido al caso, detective! Esto es lo que sabemos:

Anoche, durante el HackTech 2026, alguien borró el código fuente del proyecto ganador "EcoTrack" del equipo ByteForce. El repositorio Git está vacío y ha aparecido un USB con una copia del código en la papelera del pasillo.

Tenemos registros de acceso con tarjeta, logs de WiFi y testimonios de testigos. ¿Por dónde quieres empezar?

Te sugiero:
1. "¿Quién participó en el hackathon y en qué aula estaba?"
2. "¿Qué dice el acta oficial del evento?"

**Alumno:** Pregunta al Archivista: ¿Qué dice el acta sobre los participantes y las aulas?

**Detective → Archivista:**

📁 INFORMACIÓN ENCONTRADA
Fuente: Acta del HackTech 2026

"Se inscribieron 4 equipos: ByteForce (Marcos y Lucía, Aula 3), NullPointers (Pablo y Sara, Aula 3), PixelDrift (Diego y Elena, Aula 4) y CodeBreakers (Adrián y Nuria, Aula 4). El cierre oficial fue a las 18:00."

📌 Nota: ByteForce y NullPointers compartían el Aula 3, donde estaba el portátil con el código.

---

## Conversación 2: Análisis de accesos nocturnos

**Alumno:** ¿Quién accedió al Aula 3 después de las 22:00?

**Detective → Analista de Datos:**

📊 RESULTADO DE CONSULTA

| Tarjeta | Nombre | Entrada | Salida | Duración |
|---------|--------|---------|--------|----------|
| TAR-301 | Roberto Funes (vigilante) | 22:15 | 22:20 | 5 min |
| TAR-103 | Pablo Ortega | 22:55 | 23:40 | 45 min |
| TAR-107 | Adrián Campos | 23:33 | 00:15 | 42 min |

💡 Observación: 3 personas accedieron de noche. El vigilante solo estuvo 5 minutos (ronda normal). Pablo y Adrián tuvieron accesos prolongados.

**Detective:** ¡Interesante! Dos estudiantes estuvieron en el Aula 3 de noche. El git push que borró el código fue a las 23:52... ¿Quién estaba dentro a esa hora? 🤔

---

## Conversación 3: Cruce con datos de red

**Alumno:** ¿Cuántos datos transfirió cada uno por WiFi en el Aula 3 de noche?

**Detective → Analista de Datos:**

📊 RESULTADO DE CONSULTA

| MAC | Nombre | Access Point | Inicio | Fin | Datos (MB) |
|-----|--------|-------------|--------|-----|------------|
| AA:BB:CC:11:22:03 | Pablo Ortega | AP-AULA3 | 22:55 | 23:38 | 67.4 |
| AA:BB:CC:11:22:07 | Adrián Campos | AP-AULA3 | 23:34 | 00:12 | 128.7 |

💡 Observación: Adrián transfirió casi el doble de datos que Pablo. 128.7 MB es consistente con clonar un repositorio completo.

**Detective:** 128.7 MB transfiridos... eso es MUCHO para alguien que dice que "solo echó un vistazo de 5 minutos". ¿Quieres contrastar esto con su declaración? 📁

---

## Conversación 4: Contradicción en testimonio

**Alumno:** ¿Qué dice Adrián sobre cuánto tiempo estuvo en el Aula 3?

**Detective → Archivista:**

📁 INFORMACIÓN ENCONTRADA
Fuente: Declaración de Adrián Campos

"Entré a mirar y estaba todo normal. Como mucho 5 minutos. Entré, vi que estaba todo normal y me fui. Serían las 23:35 o así."

📌 Nota: CONTRADICCIÓN DETECTADA — Adrián declara haber estado 5 minutos (salida ~23:35), pero el registro de acceso muestra su salida a las 00:15. Estuvo 42 minutos, no 5.

**Detective:** 🚨 ¡CONTRADICCIÓN CLARA! Adrián dice 5 minutos, los datos dicen 42 minutos. Y durante esos 42 minutos transfirió 128.7 MB... justo cuando se ejecutó el borrado del repo a las 23:52. Las piezas encajan.

¿Quieres buscar su motivo? Pista: pregunta qué puesto quedó su equipo. 🏆

---

## Conversación 5: Informe final

**Alumno:** Creo que fue Adrián Campos. ¿Puedes generar el informe final?

**Detective:**

## 📋 INFORME DE CASO CERRADO
### Operación Hackathon — HackTech 2026

**CULPABLE:** Adrián Campos (equipo CodeBreakers)

**EVIDENCIAS:**

| # | Evidencia | Fuente |
|---|-----------|--------|
| 1 | Acceso al Aula 3 de 23:33 a 00:15 (42 min) | Log de accesos |
| 2 | Transferencia de 128.7 MB por WiFi del Aula 3 | Log de red |
| 3 | Presente durante el git push --force (23:52) | Email organizador + log acceso |
| 4 | Mintió sobre duración: dijo 5 min, fueron 42 | Declaración vs logs |
| 5 | Su equipo quedó último → motivo de resentimiento | Tabla equipos |

**MODUS OPERANDI:**
Adrián volvió al instituto con la excusa de recoger su cargador. Accedió al Aula 3 (cuya puerta probablemente dejó abierta Pablo, que salió antes). Usó el portátil de Marcos (sesión abierta) para clonar el repo en un USB y luego ejecutó un `git push --force` con un branch vacío para borrar el historial. Tiró el USB en la papelera del pasillo al salir (posiblemente por pánico).

**DESCARTADO:** Pablo Ortega — Estuvo presente pero sus 67.4 MB de tráfico son consistentes con compilación de su propio proyecto (GameBuddy). Su tarjeta sale del aula antes del borrado.

**RECOMENDACIÓN PREVENTIVA:**
1. Bloquear acceso con tarjeta fuera de horario autorizado (no solo registrar)
2. Activar autenticación 2FA en los repositorios Git del hackathon
3. Configurar protección de rama (branch protection) para impedir force-push
4. Instalar cierre automático de sesión en portátiles tras 15 min de inactividad

---

🎉 **¡CASO CERRADO!** Buen trabajo, detective.
