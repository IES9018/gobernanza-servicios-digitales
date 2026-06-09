# Política de Gobernanza de Servicios Digitales — IES 9-018

**Versión:** 1.0 — Junio 2026
**Aprobación:** Pendiente de Consejo Directivo
**Ubicación:** `/opt/escuela/docs/gobernanza/`

---

## 1. Propósito

Establecer un marco institucional para la solicitud, evaluación, aprobación,
alojamiento y suspensión de servicios digitales en la infraestructura del
IES 9-018.

Este documento define roles, responsabilidades, niveles de servicio y
procedimientos para proteger a la institución, sus autoridades, docentes,
administradores técnicos, estudiantes desarrolladores y los datos de terceros.

---

## 2. Descargo de responsabilidad institucional

> **El hecho de que una aplicación esté alojada en infraestructura institucional
> no implica aprobación, supervisión editorial ni responsabilidad institucional
> sobre los contenidos, datos o actividades desarrolladas por sus responsables.**

El IES 9-018 provee infraestructura con fines educativos. Cada proyecto es
responsabilidad exclusiva de quien lo solicita y lo mantiene.

---

## 3. Modelo de responsabilidades

| Rol | Responsable | Alcance |
|-----|-------------|---------|
| Infraestructura | IES 9-018 (admin técnico) | Servidor, red, DNS, seguridad base, disponibilidad del hardware |
| Aplicación | Equipo desarrollador | Código, dependencias, contenedores, configuración de la app |
| Datos | Responsable funcional del proyecto | Contenido almacenado, privacidad, backup de datos de la app |
| Contenido | Responsable del proyecto | Lo que los usuarios suben, comparten o generan |

---

## 4. Niveles de servicio

### Nivel 1 — Experimental

| Aspecto | Regla |
|---------|-------|
| Tipo | Proyectos de alumnos en desarrollo |
| Datos | Sin datos reales de terceros |
| Acceso | Solo interno (LAN o Tailscale) |
| Aprobación | Docente tutor |
| SLA | Sin garantías |

### Nivel 2 — Institucional

| Aspecto | Regla |
|---------|-------|
| Tipo | Uso por docentes o alumnos con datos reales |
| Datos | Datos institucionales no sensibles |
| Acceso | Interno o con autenticación |
| Aprobación | Consejo Directivo |
| SLA | Sin garantía de disponibilidad, backup periódico |

### Nivel 3 — Público

| Aspecto | Regla |
|---------|-------|
| Tipo | Acceso desde internet |
| Datos | Datos personales o de terceros |
| Acceso | Público con o sin autenticación |
| Aprobación | Consejo Directivo + Declaración de Responsabilidad firmada + Revisión técnica |
| SLA | Sin garantía de disponibilidad, sin responsabilidad institucional |

---

## 5. Índice de documentos

| # | Documento | Quién lo completa | Propósito |
|---|-----------|-------------------|-----------|
| 01 | Solicitud de Alojamiento | Responsable del proyecto | Pedir formalmente el servicio |
| 02 | Evaluación Técnica | Admin del servidor | Verificar seguridad y operabilidad |
| 03 | Evaluación Institucional | Dirección / Coordinación | Evaluar alineación educativa y riesgo |
| 04 | Declaración de Responsabilidad | Responsable del proyecto | Liberar de responsabilidad a la institución |
| 05 | Política de Uso Aceptable | Todos los desarrolladores | Establecer reglas de convivencia digital |
| 06 | SLA Educativo | Admin + Responsable | Definir nivel de servicio esperado |
| 07 | Glosario | — | Términos técnicos explicados |
| 09 | Auditoría y Transparencia | Auditor / Público | Cómo auditar el servidor, herramientas instaladas, acceso read-only |

---

## 6. Proceso de aprobación (flujo)

```
Solicitante completa 01_SOLICITUD
        │
        ▼
Admin completa 02_EVALUACION_TECNICA
        │
        ▼
Dirección completa 03_EVALUACION_INSTITUCIONAL
        │
        ▼
Consejo Directivo evalúa documentos
        │
        ├── Aprueba → Firma 04_DECLARACION + RESOLUCION
        │               → Admin despliega servicio
        │               → Desarrollador firma 05_POLITICA
        │
        └── Rechaza → Se notifica al solicitante con fundamentos
```

---

## 7. Suspensión de servicios

El admin técnico puede suspender un servicio de inmediato si:

- Se detecta contenido ilegal o que viola derechos de autor.
- Se detectan vulnerabilidades de seguridad críticas.
- El servicio afecta la estabilidad del servidor.
- El responsable no responde ante incidentes.

La suspensión no requiere aprobación previa del Consejo Directivo,
pero debe notificarse dentro de las 24 horas.
