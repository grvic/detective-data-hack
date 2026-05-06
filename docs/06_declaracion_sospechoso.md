# Declaración — Adrián Campos (Sospechoso)

**Fecha de declaración:** 16 de marzo de 2026, 10:30  
**Recogido por:** Dirección del centro  
**Contexto:** Adrián fue citado porque su tarjeta registra acceso al Aula 3 a las 23:33

---

## Su versión

Vale, sí, estuve en el instituto por la noche. Pero puedo explicarlo.

Resulta que dejé mi cargador en el Aula 4. Mi portátil estaba al 5% y lo necesitaba para preparar la presentación del día siguiente en casa. Volví sobre las 23:00, entré con mi tarjeta, fui al Aula 4, cogí mi cargador... y luego pasé por el Aula 3 porque vi la puerta abierta y me pareció raro. Entré a mirar y estaba todo normal — bueno, había un portátil encendido con la pantalla en el escritorio, pero no lo toqué.

## Preguntas y respuestas

**P: ¿Por qué no llamó al vigilante si vio la puerta abierta?**  
R: No pensé que fuera importante. Pensé que alguien se había dejado la puerta sin cerrar.

**P: ¿Cuánto tiempo estuvo en el Aula 3?**  
R: Como mucho 5 minutos. Entré, vi que estaba todo normal y me fui. Serían las 23:35 o así.

**P: ¿Vio a alguien más en el edificio?**  
R: No... bueno, me pareció ver una sombra en el pasillo cuando salía, pero no estoy seguro. Podría haber sido el reflejo de las luces de emergencia.

**P: ¿Conoce a Pablo Ortega fuera del instituto?**  
R: Sí, somos vecinos. A veces coincidimos en el parking. Pero no quedamos ni nada especial.

**P: ¿Tenía acceso a las credenciales Git de ByteForce?**  
R: No. Cada equipo tenía sus propias credenciales. Solo podrías acceder si usabas su portátil directamente.

## Observaciones del entrevistador

- Adrián parece nervioso pero coherente
- Sus tiempos encajan parcialmente con los logs (entró a Aula 4 a las 23:05, al Aula 3 a las 23:33)
- **Sin embargo**, su salida del Aula 3 está registrada a las 00:15, no a las "23:35" como declara. Estuvo **42 minutos**, no 5.
- Su conexión WiFi al AP-AULA3 muestra 128.7 MB transferidos — demasiado para "solo echar un vistazo"

## ⚡ CLAVE PARA LA RESOLUCIÓN

Adrián es el **culpable principal**. Las evidencias:
1. Estuvo 42 min en el Aula 3 (dice que 5)
2. Transfirió 128.7 MB por WiFi (copió el código)
3. El git push --force fue a las 23:52 (él estaba dentro)
4. Mintió sobre la duración de su estancia
5. Motivo: su proyecto SmartNotes quedó último; quería el código de EcoTrack para presentarlo como propio en otro concurso

Pablo Ortega (TAR-103) es un **RED HERRING parcial**: sí estuvo en el edificio (su coartada es falsa), pero los datos muestran que estuvo solo 43 minutos (22:55-23:38) y transfirió 67.4 MB. En realidad volvió a arreglar el bug de su propio proyecto GameBuddy — su actividad de red es solo uso de Git y compilación. No accedió al portátil de ByteForce.
