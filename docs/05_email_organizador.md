# Email interno — De: Tomás Herrera | Para: Dirección

**Fecha:** 16 de marzo de 2026, 08:15  
**Asunto:** URGENTE — Incidente de seguridad en HackTech 2026

---

Estimada directora:

Le escribo para informar de un incidente grave ocurrido durante la noche del 15 al 16 de marzo en el marco del HackTech 2026.

## Hechos

1. Ayer a las 19:00 volví al Aula 3 para verificar que todo estaba en orden antes del cierre definitivo. Los portátiles estaban en sus mesas, el repositorio Git funcionaba correctamente (lo comprobé desde mi móvil) y cerré el aula con llave.

2. Esta mañana a las 07:30, al abrir el Aula 3 para preparar las presentaciones finales, descubrí que el repositorio del equipo ganador (ByteForce - proyecto EcoTrack) está **completamente vacío**. El historial de commits ha sido eliminado.

3. El vigilante Roberto Funes me entregó un USB negro con pegatina de calavera que encontró en la papelera del pasillo. Al conectarlo en un equipo aislado, contiene una carpeta llamada "ecotrack-stolen" con lo que parece ser una copia completa del código fuente.

## Mi análisis preliminar

- El `git push --force` que borró el repositorio se ejecutó a las **23:52** del 15 de marzo (según el log del servidor Git, que me facilitó Inés de IT).
- Para ejecutar ese push se necesitaban las credenciales Git del equipo ByteForce, que estaban guardadas en el portátil de Marcos (sesión abierta).
- Es decir: **alguien accedió físicamente al portátil de Marcos en el Aula 3 después de las 19:00**.

## Sospecha

No quiero señalar a nadie sin pruebas, pero creo que debemos revisar los registros de acceso con tarjeta y los logs de red para identificar quién estuvo en el Aula 3 esa noche.

## Solicitud

Pido autorización para compartir los logs de acceso y red con el equipo investigador que designe la dirección.

Un saludo,  
**Tomás Herrera**  
Coordinador HackTech 2026
