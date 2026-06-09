# Solicitud de Alojamiento de Servicio Digital — IES 9-018

**Versión:** v0.9 — Beta Institucional
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

## 3. Justificación de arquitectura de software

> Esta sección es obligatoria para solicitudes de estudiantes de la
> Tecnicatura Superior en Desarrollo de Software.

### ¿Qué arquitectura utiliza el proyecto?

☐ Monolítica  ☐ Microservicios  ☐ Capas  ☐ Hexagonal  ☐ Otra (especificar)

### ¿Por qué eligió esta arquitectura?

> Explicar brevemente qué problema resuelve esta elección arquitectónica
> (escalabilidad, mantenibilidad, separación de responsabilidades, etc.).

### ¿Qué patrón de diseño principal implementa?

> Ej: MVC, Repository, Observer, etc.

### ¿Cómo se relaciona esta arquitectura con el dominio del problema?

> Describir cómo la estructura del código refleja el negocio o la
> funcionalidad del sistema.

**Ejemplo:**
> Se eligió una arquitectura de microservicios porque el sistema tiene tres
> módulos con requisitos distintos: catálogo (altas lecturas/escrituras),
> préstamos (transaccional con estado) y usuarios (gestión de identidad).
> Separarlos permite escalar cada uno independientemente y modificar el
> módulo de préstamos sin afectar al catálogo. Se implementó el patrón
> Repository para abstraer el acceso a datos y facilitar pruebas unitarias.

---

## 4. Repositorio y licencia

### Repositorio de código

| Campo | Respuesta |
|-------|-----------|
| URL del repositorio | |

**Reglas:**
- Solo se aceptan repositorios en **GitHub**.
- El repositorio debe ser **público**.
- Si el alumno necesita mantener el código privado, debe subir el repositorio
  a la **organización oficial del IES 9-018** (`github.com/IES9018/`) como
  fork interno. El proyecto alojado en el servidor escolar será siempre un
  fork del repositorio original del alumno.

### Licencia del desarrollo

| Pregunta | Respuesta |
|----------|-----------|
| ¿Qué licencia tiene el desarrollo? | |
| ¿Es compatible con uso institucional educativo? | Sí / No |
| URL del archivo LICENSE (si aplica) | |

> La licencia debe ser compatible con uso educativo institucional
> (ej: MIT, Apache 2.0, GPL v3, Creative Commons). Si el proyecto no
> tiene licencia, se asume "todos los derechos reservados", lo que puede
> limitar su uso institucional.

---

## 5. Tecnología

| Aspecto | Detalle |
|---------|---------|
| Lenguaje(s) | |
| Framework(s) | |
| Base de datos | |
| Puertos necesarios (internos y externos) | |
| Almacenamiento requerido | |
| ¿Usa APIs externas? (cuáles) | |

**Ejemplo:**
| Aspecto | Detalle |
|---------|---------|
| Lenguaje(s) | Python, TypeScript |
| Framework(s) | Django REST + React |
| Base de datos | PostgreSQL 16 |
| Puertos | 8000 (API), 3000 (frontend) |
| Almacenamiento | 10 GB |
| APIs externas | Google Gemini API (embedding + chat) |

---

## 6. Acceso

| Pregunta | Respuesta |
|----------|-----------|
| ¿Será público desde internet? | Sí / No |
| ¿Solo interno (LAN / Tailscale)? | Sí / No |
| ¿Requiere autenticación? | Sí / No |
| ¿Qué método de autenticación? | |
| ¿Tiene distintos roles de usuario? | Sí / No — Cuáles: |

---

## 7. Datos

| Pregunta | Respuesta |
|----------|-----------|
| ¿Almacena datos personales? | Sí / No |
| ¿Qué datos específicamente? | |
| ¿Por cuánto tiempo se conservan? | |
| ¿Quién puede acceder a los datos? | |
| ¿Los datos se comparten con terceros? | Sí / No — Con quién: |
| ¿Existe política de privacidad? | Sí / No |

---

## 8. Contenido generado por usuarios

| Pregunta | Respuesta |
|----------|-----------|
| ¿Permite subir archivos? | Sí / No — Formatos y tamaño máx: |
| ¿Permite comentarios? | Sí / No — ¿Con moderación? |
| ¿Permite mensajería entre usuarios? | Sí / No |
| ¿Permite compartir material entre usuarios? | Sí / No |

---

## 9. Declaración de riesgos

El responsable debe responder las siguientes preguntas:

| Pregunta | Respuesta | Mitigación propuesta |
|----------|-----------|---------------------|
| ¿Existe riesgo de infracción de derechos de autor? | Sí / No | |
| ¿Existe riesgo de publicación de contenido inapropiado? | Sí / No | |
| ¿Existe riesgo de tratamiento indebido de datos personales? | Sí / No | |
| ¿Existe riesgo de uso del servicio para actividades ilegales? | Sí / No | |

---

## 10. Firma del responsable

| | |
|--|--|
| Nombre: | |
| Firma: | |
| Fecha: | |
