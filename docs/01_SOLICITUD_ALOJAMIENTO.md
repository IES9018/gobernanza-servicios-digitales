# Solicitud de Alojamiento de Servicio Digital — IES 9-018

**Versión:** 1.0 — Junio 2026
**Plantilla imprimible:** `plantillas/solicitud_alu.md`
**Instrucciones:** Completar este formulario y enviarlo al admin técnico del
servidor junto con los documentos 02, 03 y 04 según corresponda al nivel del
servicio.

---

## 1. Identificación del proyecto

| Campo | Respuesta |
|-------|-----------|
| Nombre del proyecto | |
| Fecha de solicitud | |
| Nivel solicitado (1/2/3) | |
| URL o subdominio propuesto | |

### Responsable principal

| Campo | Respuesta |
|-------|-----------|
| Nombre completo | |
| Rol (docente / alumno / externo) | |
| Carrera / Área | |
| Correo electrónico | |
| Teléfono de contacto | |

### Corresponsables

| Nombre | Rol |
|--------|-----|
| | |
| | |

### Docente tutor (si aplica)

| Campo | Respuesta |
|-------|-----------|
| Nombre | |
| Correo | |

---

## 2. Descripción del servicio

### ¿Qué hace el sistema?

> Describir en no más de 10 líneas la funcionalidad principal.

**Ejemplo:**
> Sistema de gestión bibliotecaria que permite catalogar materiales de estudio,
> gestionar préstamos y proporcionar un catálogo público en línea (OPAC) para
> que estudiantes y docentes consulten el material disponible.

### ¿Cuál es el objetivo educativo?

**Ejemplo:**
> Facilitar el acceso a materiales de estudio para los estudiantes de las
> carreras del IES 9-018, promoviendo la autonomía en la búsqueda de
> bibliografía y reduciendo los tiempos de consulta.

### ¿Quiénes serán los usuarios?

| Tipo de usuario | Cantidad estimada | ¿Requiere registro? |
|-----------------|-------------------|---------------------|
| Ej: Alumnos de 2do año | 60 | No (solo consulta) |
| Ej: Docentes del área | 15 | Sí |
| Ej: Público general | — | No |

---

## 3. Tecnología

| Aspecto | Detalle |
|---------|---------|
| Lenguaje(s) | |
| Framework(s) | |
| Base de datos | |
| Puertos necesarios (internos y externos) | |
| Almacenamiento requerido | |
| ¿Usa APIs externas? (cuáles) | |
| Repositorio de código (URL) | |

**Ejemplo:**
| Aspecto | Detalle |
|---------|---------|
| Lenguaje(s) | Python, TypeScript |
| Framework(s) | Django REST + React |
| Base de datos | PostgreSQL 16 |
| Puertos | 8000 (API), 3000 (frontend) |
| Almacenamiento | 10 GB |
| APIs externas | Google Gemini API (embedding + chat) |
| Repositorio | https://github.com/IES9018/biblioteca-digital |

---

## 4. Acceso

| Pregunta | Respuesta |
|----------|-----------|
| ¿Será público desde internet? | Sí / No |
| ¿Solo interno (LAN / Tailscale)? | Sí / No |
| ¿Requiere autenticación? | Sí / No |
| ¿Qué método de autenticación? | |
| ¿Tiene distintos roles de usuario? | Sí / No — Cuáles: |

---

## 5. Datos

| Pregunta | Respuesta |
|----------|-----------|
| ¿Almacena datos personales? | Sí / No |
| ¿Qué datos específicamente? | |
| ¿Por cuánto tiempo se conservan? | |
| ¿Quién puede acceder a los datos? | |
| ¿Los datos se comparten con terceros? | Sí / No — Con quién: |
| ¿Existe política de privacidad? | Sí / No |

---

## 6. Contenido generado por usuarios

| Pregunta | Respuesta |
|----------|-----------|
| ¿Permite subir archivos? | Sí / No — Formatos y tamaño máx: |
| ¿Permite comentarios? | Sí / No — ¿Con moderación? |
| ¿Permite mensajería entre usuarios? | Sí / No |
| ¿Permite compartir material entre usuarios? | Sí / No |

---

## 7. Declaración de riesgos

El responsable debe responder las siguientes preguntas:

| Pregunta | Respuesta | Mitigación propuesta |
|----------|-----------|---------------------|
| ¿Existe riesgo de infracción de derechos de autor? | Sí / No | |
| ¿Existe riesgo de publicación de contenido inapropiado? | Sí / No | |
| ¿Existe riesgo de tratamiento indebido de datos personales? | Sí / No | |
| ¿Existe riesgo de uso del servicio para actividades ilegales? | Sí / No | |

---

## 8. Firma del responsable

| | |
|--|--|
| Nombre: | |
| Firma: | |
| Fecha: | |
