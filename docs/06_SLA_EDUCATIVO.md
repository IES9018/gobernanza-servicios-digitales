# Acuerdo de Nivel de Servicio Educativo (SLA Educativo) — IES 9-018

**Versión:** v0.9 — Junio 2026
**Plantilla imprimible:** `plantillas/sla_educativo.md`

---

## 1. Naturaleza del servicio

El servidor del IES 9-018 constituye un **entorno educativo de
experimentación**. No es una plataforma comercial ni un servicio crítico
de infraestructura institucional.

## 2. Lo que NO se garantiza

| Aspecto | Sin garantía |
|---------|--------------|
| Disponibilidad | El servidor puede caer sin previo aviso por mantenimiento, cortes eléctricos, fallas de hardware o actualizaciones |
| Continuidad | No existe acuerdo de tiempo de actividad (uptime) ni de respuesta ante incidentes |
| Recuperación de datos | El backup de datos de aplicación es responsabilidad del desarrollador, no del admin |
| Rendimiento | Los recursos se comparten entre todos los servicios; no hay reserva de CPU, RAM o ancho de banda |
| Soporte | No hay horario de soporte técnico ni tiempo de resolución garantizado |

## 3. Responsabilidades del admin técnico

- Mantener el sistema operativo actualizado.
- Mantener Docker y servicios base operativos.
- Proveer acceso a logs del servidor.
- Notificar cortes programados con al menos 48 horas de anticipación.
- Suspender servicios que representen un riesgo de seguridad.

## 4. Responsabilidades del desarrollador

- Mantener su aplicación actualizada y segura.
- Realizar backup de los datos de su aplicación.
- Responder ante incidentes de seguridad en su servicio.
- Notificar al admin cualquier cambio relevante en el servicio.

## 5. Acuerdo

| Rol | Nombre | Firma | Fecha |
|-----|--------|-------|-------|
| Admin técnico | | | |
| Responsable del proyecto | | | |
