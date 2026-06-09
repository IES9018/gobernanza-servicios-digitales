# Evaluación Técnica de Servicio Digital — IES 9-018

**Versión:** v0.9 — Beta Institucional
**Plantilla imprimible:** `plantillas/evaluacion_tecnica.md`
**Completado por:** Admin técnico del servidor

---

## 1. Datos del proyecto

| Campo | Valor |
|-------|-------|
| Nombre del proyecto | |
| Solicitante | |
| Fecha de evaluación | |

---

## 2. Repositorio y licencia

| Requisito | Cumple | Observaciones |
|-----------|--------|---------------|
| El repositorio es público en GitHub | ☐ Sí ☐ No | |
| Si es privado: está en la org IES9018 como fork | ☐ Sí ☐ No ☐ N/A | |
| El proyecto alojado será un fork del original | ☐ Sí ☐ No | |
| La licencia es compatible con uso educativo institucional | ☐ Sí ☐ No | ¿Cuál?: |
| El archivo LICENSE existe y es válido | ☐ Sí ☐ No ☐ N/A | |

---

## 3. Justificación arquitectónica (para alumnos)

| Aspecto | Verificado | Observaciones |
|---------|------------|---------------|
| La arquitectura declarada es coherente con el proyecto | ☐ Sí ☐ No | |
| Los patrones mencionados se reflejan en el código | ☐ Sí ☐ No ☐ N/A | |
| La justificación técnica es razonable | ☐ Sí ☐ No | |

---

## 4. Checklist de seguridad

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

## 5. Checklist de operación

| Requisito | Cumple | Observaciones |
|-----------|--------|---------------|
| Está dockerizado | ☐ Sí ☐ No | |
| Logs de aplicación accesibles | ☐ Sí ☐ No | |
| Backup de datos definido y documentado | ☐ Sí ☐ No | |
| Responsable de mantenimiento identificado | ☐ Sí ☐ No | |
| Procedimiento de reinicio documentado | ☐ Sí ☐ No | |
| Contacto de emergencia actualizado | ☐ Sí ☐ No | |

---

## 6. Checklist de infraestructura

| Requisito | Cumple | Observaciones |
|-----------|--------|---------------|
| Puertos aprobados sin conflicto con otros servicios | ☐ Sí ☐ No | |
| Recursos asignados (RAM, CPU, disco) documentados | ☐ Sí ☐ No | |
| No interfiere con servicios institucionales críticos | ☐ Sí ☐ No | |
| Subdominio configurado en Cloudflare (si aplica) | ☐ Sí ☐ No ☐ N/A | |

---

## 7. Dictamen técnico

| Aspecto | Resultado |
|---------|-----------|
| ¿El servicio es seguro para desplegar? | ☐ Sí ☐ No ☐ Condicional |
| ¿El repositorio y la licencia cumplen los requisitos? | ☐ Sí ☐ No |
| Condiciones (si aplica) | |
| Nivel recomendado | ☐ 1 — Experimental ☐ 2 — Institucional ☐ 3 — Público |

### Observaciones adicionales

```

```

---

## 8. Firma del evaluador

| | |
|--|--|
| Nombre: | |
| Firma: | |
| Fecha: | |
