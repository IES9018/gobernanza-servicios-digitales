# Transparencia y Auditoría Comunitaria — IES 9-018

**Versión:** v0.9 — Junio 2026
**Relacionado:** `09_AUDITABILIDAD.md` (guía técnica de herramientas de auditoría)

---

## 1. Principio general

> El servidor institucional del IES 9-018 es un recurso educativo y comunitario.
> Su seguridad no se basa en el secreto sino en buenas prácticas, controles
> técnicos, documentación abierta y trazabilidad.

La institución promueve la transparencia en la gestión de la infraestructura
tecnológica, permitiendo auditorías y revisiones técnicas dentro de los
límites establecidos por la normativa vigente y la protección de datos
personales.

---

## 2. Objetivos

| Objetivo | Descripción |
|----------|-------------|
| **Confianza institucional** | La comunidad educativa puede verificar cómo se administra el servidor |
| **Aprendizaje práctico** | Estudiantes pueden aprender observando configuraciones reales |
| **Revisiones independientes** | Profesionales externos pueden validar la seguridad |
| **Mejora continua** | Las revisiones generan recomendaciones documentadas |
| **Formación en administración** | Formar estudiantes en buenas prácticas desde el ejemplo |

---

## 3. Información pública

La siguiente información puede ser consultada por cualquier miembro de la
comunidad educativa:

- Política de Gobernanza de Servicios Digitales.
- Inventario general de servicios autorizados.
- Procedimiento de solicitud de nuevos servicios y usuarios.
- Procedimiento de auditoría técnica.
- Historial de cambios institucionales relevantes.
- Documentación técnica aprobada para difusión.

**Dónde consultarla:**

| Recurso | Ubicación |
|---------|-----------|
| Documentación de gobernanza | `https://github.com/IES9018/gobernanza-servicios-digitales` |
| Estado del servidor | A solicitud del Consejo Directivo |
| Informes de auditoría | A solicitud del Consejo Directivo |

---

## 4. Información restringida

**No es pública** bajo ninguna circunstancia:

- Contraseñas de cualquier usuario.
- Llaves privadas SSH.
- Tokens de API (Cloudflare, Gemini, etc.).
- Datos personales de estudiantes, docentes o personal.
- Configuraciones sensibles (puertos internos, IPs de administración).
- Logs sin anonimizar.
- Información protegida por la Ley 25.326 (Protección de Datos Personales).
- Información protegida por la Ley 11.723 (Propiedad Intelectual).

---

## 5. Derecho de auditoría

Pueden solicitar una auditoría:

- Equipo directivo del IES 9-018.
- Docentes de la institución.
- Estudiantes regulares.
- Personal administrativo.
- Responsables de proyectos alojados en el servidor.
- Autoridades de la DGE (Dirección General de Escuelas).

### Tipos de auditoría

| Tipo | Qué se revisa | Quién puede hacerla |
|------|--------------|---------------------|
| **Documental** | Políticas, procedimientos, formularios completados | Cualquier solicitante |
| **Técnica** | Configuración del servidor, logs, contenedores | Persona con capacidad técnica acreditada |
| **De cumplimiento** | ¿Se están cumpliendo las políticas? | Directivos, DGE |
| **De seguridad** | Vulnerabilidades, hardening, accesos | Profesional de seguridad designado |

> **Importante:** La auditoría puede realizarse sobre documentación, diagramas,
> logs anonimizados, configuraciones revisadas o reuniones técnicas.
> El acceso técnico directo al servidor se otorga solo cuando existe
> justificación educativa, técnica o institucional respaldada por el
> Consejo Directivo.

---

## 6. Procedimiento de solicitud de auditoría

### Paso 1 — Solicitud formal

El interesado envía al Consejo Directivo (o al admin técnico si el Consejo
delegó) una solicitud que incluya:

| Campo | Detalle |
|-------|---------|
| Nombre del solicitante | |
| Rol (docente / estudiante / externo) | |
| Objetivo de la auditoría | ¿Qué se quiere verificar? |
| Alcance solicitado | ¿Documentación, técnico, cumplimiento, seguridad? |
| Fecha estimada | ¿Cuándo se realizaría? |

### Paso 2 — Evaluación

La institución evalúa la solicitud y puede:
- Aceptarla sin condiciones.
- Aceptarla con alcance limitado (si hay riesgos para seguridad o privacidad).
- Rechazarla con fundamentos.

### Paso 3 — Ejecución

Se coordina la auditoría según su tipo:
- **Documental:** se comparte la carpeta de documentación.
- **Técnica:** se habilita el usuario `auditor` con acceso supervisado.
- **De cumplimiento:** se presentan informes y registros.
- **De seguridad:** se coordina con el admin técnico.

### Paso 4 — Publicación de resultados

Siempre que sea posible:
- Los informes de auditoría se publican (anonimizados si corresponde).
- Las recomendaciones quedan documentadas.
- Las acciones correctivas se registran y fechan.

---

## 7. Registro de cambios

Las modificaciones significativas en la infraestructura se documentan en un
registro accesible para la comunidad educativa:

| Fecha | Cambio | Autorizado por | Documento asociado |
|-------|--------|---------------|-------------------|
| | | | |

**Ejemplos de cambios que se registran:**
- Nuevos servicios alojados.
- Eliminación de servicios.
- Cambios de privilegios de usuarios.
- Cambios en políticas de gobernanza.
- Incidentes de seguridad relevantes.
- Auditorías realizadas y sus resultados.

---

## 8. Programa de colaboración comunitaria

La comunidad educativa puede informar de manera responsable y ética:

- Vulnerabilidades de seguridad detectadas.
- Errores de configuración.
- Riesgos legales potenciales.
- Riesgos de seguridad.
- Oportunidades de mejora.

### Cómo informar

1. Enviar un correo al administrador técnico describiendo el hallazgo.
2. No explotar la vulnerabilidad ni compartirla con terceros.
3. Esperar la confirmación de recepción y la corrección.

### Reglas

| Permitido | Prohibido |
|-----------|-----------|
| Reportar vulnerabilidades de forma responsable | Explotar activamente vulnerabilidades |
| Sugerir mejoras de configuración | Acceder a datos de otros usuarios |
| Revisar documentación pública | Compartir hallazgos antes de la corrección |
| Solicitar auditorías formales | Realizar ataques de denegación de servicio |

---

## 9. Transparencia activa vs. acceso técnico directo

Es importante distinguir:

| Concepto | ¿Qué significa? | ¿Aplica a todos? |
|----------|---------------|-------------------|
| **Transparencia activa** | Las políticas, procesos y documentación son públicos | Sí, toda la comunidad educativa |
| **Acceso técnico directo** | Obtener una shell SSH o acceso al servidor | Solo si hay justificación educativa/técnica |

> Que la documentación sea pública no implica que cualquier persona deba
> obtener acceso al servidor. La transparencia se logra publicando las
> reglas y los registros; el acceso operativo se otorga según necesidad
> y responsabilidad.

---

## 10. Relación con otros documentos

| Documento | Relación |
|-----------|----------|
| `09_AUDITABILIDAD.md` | Guía técnica: herramientas, comandos, usuario auditor |
| `07_SOLICITUD_USUARIO.md` | Cómo pedir acceso al servidor según perfil |
| `05_POLITICA_USO_ACEPTABLE.md` | Reglas de convivencia que todo usuario acepta |
| `11_EMERGENCIA_Y_CONTROL.md` | Blindaje de logs, protección contra admins maliciosos |
