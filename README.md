# Política de Gobernanza de Servicios Digitales — IES 9-018

Este repositorio contiene la documentación oficial de la política de gobernanza
tecnológica del **Instituto de Educación Superior N° 9-018 (IES 9-018)** de
Malargüe, Mendoza, Argentina.

## Propósito

Establecer un marco institucional para la solicitud, evaluación, aprobación,
alojamiento y suspensión de servicios digitales en la infraestructura del
IES 9-018. Define roles, responsabilidades, niveles de servicio y
procedimientos para proteger a la institución, sus autoridades, docentes,
administradores técnicos, estudiantes desarrolladores y los datos de terceros.

## Descargo de responsabilidad fundamental

> El hecho de que una aplicación esté alojada en infraestructura institucional
> no implica aprobación, supervisión editorial ni responsabilidad institucional
> sobre los contenidos, datos o actividades desarrolladas por sus responsables.

## Documentos

| # | Documento | Quién lo completa | Propósito |
|---|-----------|-------------------|-----------|
| 01 | [Solicitud de Alojamiento](docs/01_SOLICITUD_ALOJAMIENTO.md) | Responsable del proyecto | Pedir formalmente el servicio |
| 02 | [Evaluación Técnica](docs/02_EVALUACION_TECNICA.md) | Admin del servidor | Verificar seguridad y operabilidad |
| 03 | [Evaluación Institucional](docs/03_EVALUACION_INSTITUCIONAL.md) | Dirección / Coordinación | Evaluar alineación educativa y riesgo |
| 04 | [Declaración de Responsabilidad](docs/04_DECLARACION_RESPONSABILIDAD.md) | Responsable del proyecto | Liberar de responsabilidad a la institución |
| 05 | [Política de Uso Aceptable](docs/05_POLITICA_USO_ACEPTABLE.md) | Todos los desarrolladores | Reglas de convivencia digital |
| 06 | [SLA Educativo](docs/06_SLA_EDUCATIVO.md) | Admin + Responsable | Nivel de servicio esperado |
| 07 | [Glosario](docs/GLOSARIO.md) | — | Términos técnicos explicados |

### Archivos complementarios

- [Solicitud de usuario del servidor](docs/07_SOLICITUD_USUARIO.md) — para pedir una cuenta con perfiles definidos
- [Resolución Directiva](docs/08_RESOLUCION_DIRECTIVA.md) — modelo para formalizar la aprobación
- [Índice completo de gobernanza](docs/00_INDICE.md) — con modelo de responsabilidades y niveles

### Plantillas editables

- [Solicitud de alojamiento (versión alumnos)](plantillas/solicitud_alu.md)
- [Declaración de responsabilidad (versión imprimible)](plantillas/declaracion_responsabilidad.md)
- [Evaluación técnica](plantillas/evaluacion_tecnica.md)
- [Evaluación institucional](plantillas/evaluacion_institucional.md)
- [Política de uso aceptable](plantillas/politica_uso_aceptable.md)
- [SLA educativo](plantillas/sla_educativo.md)
- [Solicitud de usuario del servidor](plantillas/solicitud_usuario.md)

## Ejemplos incluidos

Los documentos contienen ejemplos basados en casos reales sanitizados:

- **Biblioteca Digital Educativa** — sistema de gestión de materiales de estudio
- **Prode Deportivo** — quiniela educativa de predicciones deportivas

Estos ejemplos muestran cómo completar cada formulario y qué consideraciones
técnicas, legales e institucionales aplicar.

## Niveles de servicio

| Nivel | Tipo | Aprobación | SLA |
|-------|------|------------|-----|
| 1 — Experimental | Proyectos de alumnos, sin datos reales | Docente tutor | Sin garantías |
| 2 — Institucional | Uso con datos reales, acceso interno | Consejo Directivo | Backup periódico |
| 3 — Público | Acceso desde internet, datos personales | Consejo Directivo + Declaración firmada | Sin garantía de disponibilidad |

## Auditoría y transparencia

El servidor del IES 9-018 es **totalmente auditable** por cualquier persona
autorizada con capacidad técnica. Existe un usuario `auditor` con permisos
exclusivamente de lectura.

→ [Documentación completa de auditoría](docs/09_AUDITABILIDAD.md)
→ [Emergencia, blindaje y control de acceso](docs/11_EMERGENCIA_Y_CONTROL.md)

### Herramientas instaladas

| Herramienta | Propósito |
|-------------|-----------|
| **auditd** | Registro de eventos a nivel kernel (comandos, cambios, accesos) |
| **journald** | Log central del sistema y servicios |
| **fail2ban** | Bloqueo automático de intentos de intrusión |
| **Docker logs** | Logs de cada aplicación en contenedor |
| **Server Bitácora** | Instantáneas automáticas cada 5 minutos del estado del servidor |
| **Tailscale** | Red privada con registro de dispositivos conectados |

## Licencia

Este material se comparte como referencia institucional y puede ser adaptado
por otras instituciones educativas. Atribución requerida al IES 9-018.

---

**IES 9-018 — Malargüe, Mendoza, Argentina**
**Contacto:** [Consejo Directivo IES 9-018](https://ies9018malargue.edu.ar)
