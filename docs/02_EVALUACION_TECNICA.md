# Evaluación Técnica de Servicio Digital — IES 9-018

**Versión:** 1.0 — Junio 2026
**Completado por:** Admin técnico del servidor

---

## 1. Datos del proyecto

| Campo | Valor |
|-------|-------|
| Nombre del proyecto | |
| Solicitante | |
| Fecha de evaluación | |

---

## 2. Checklist de seguridad

| Requisito | Cumple | Observaciones |
|-----------|--------|---------------|
| Usa HTTPS (certificado válido o proxy con SSL) | ☐ Sí ☐ No | |
| Contraseñas almacenadas con hash (bcrypt / argon2) | ☐ Sí ☐ No ☐ N/A | |
| Credenciales en variables de entorno (no hardcodeadas) | ☐ Sí ☐ No | |
| Secretos rotados respecto a valores por defecto | ☐ Sí ☐ No ☐ N/A | |
| Puerto bindeado a 127.0.0.1 (nunca 0.0.0.0) | ☐ Sí ☐ No | |
| Sin dependencias con vulnerabilidades conocidas | ☐ Sí ☐ No ☐ Pendiente | |
| Headers de seguridad configurados (CSP, CORS, etc.) | ☐ Sí ☐ No ☐ N/A | |

---

## 3. Checklist de operación

| Requisito | Cumple | Observaciones |
|-----------|--------|---------------|
| Está dockerizado | ☐ Sí ☐ No | |
| Logs de aplicación accesibles | ☐ Sí ☐ No | |
| Backup de datos definido y documentado | ☐ Sí ☐ No | |
| Responsable de mantenimiento identificado | ☐ Sí ☐ No | |
| Procedimiento de reinicio documentado | ☐ Sí ☐ No | |
| Contacto de emergencia actualizado | ☐ Sí ☐ No | |

---

## 4. Checklist de infraestructura

| Requisito | Cumple | Observaciones |
|-----------|--------|---------------|
| Puertos aprobados sin conflicto con otros servicios | ☐ Sí ☐ No | |
| Recursos asignados (RAM, CPU, disco) documentados | ☐ Sí ☐ No | |
| No interfiere con servicios institucionales críticos | ☐ Sí ☐ No | |
| Subdominio configurado en Cloudflare (si aplica) | ☐ Sí ☐ No ☐ N/A | |

---

## 5. Dictamen técnico

| Aspecto | Resultado |
|---------|-----------|
| ¿El servicio es seguro para desplegar? | ☐ Sí ☐ No ☐ Condicional |
| Condiciones (si aplica) | |
| Nivel recomendado | ☐ 1 — Experimental ☐ 2 — Institucional ☐ 3 — Público |

### Observaciones adicionales

```

```

---

## 6. Firma del evaluador

| | |
|--|--|
| Nombre: | |
| Firma: | |
| Fecha: | |
