#!/bin/bash
# crear-issues-iniciales.sh
# Crear los Issues iniciales del proyecto usando la API de GitHub.
# Requiere: curl, y un token de GitHub con permisos "repo".
#
# Uso:
#   1. Ir a GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
#   2. Crear un token con alcance "repo"
#   3. Ejecutar: GITHUB_TOKEN="ghp_xxx" bash scripts/crear-issues-iniciales.sh

TOKEN="${GITHUB_TOKEN:?Error: GITHUB_TOKEN no está definido}"
REPO="IES9018/gobernanza-servicios-digitales"
API="https://api.github.com/repos/$REPO/issues"

crear_issue() {
  local titulo="$1"
  local cuerpo="$2"
  local labels="$3"

  echo "Creando: $titulo ..."

  curl -s -X POST "$API" \
    -H "Authorization: token $TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    -d "$(cat <<EOF
{
  "title": "$titulo",
  "body": $(echo "$cuerpo" | jq -Rs .),
  "labels": $(echo "$labels" | jq -Rc 'split(",")')
}
EOF
)" | jq -r '.html_url // "Error: \(.message)"'
}

# ────────────────────────────────────────────────────────────────────

crear_issue \
  "Roadmap v1.0 — Digitalización del proceso de gobernanza" \
  "## Meta

Transformar este marco documental en un sistema web funcional que digitalice
todo el proceso de solicitud, evaluación y aprobación de servicios digitales.

## Hitos previstos

- [ ] **v0.9 (actual)** — Marco documental completo, revisado y aprobado por
      el Consejo Directivo.
- [ ] **v1.0-alpha** — Sistema web funcional con carga de solicitudes y
      evaluación técnica.
- [ ] **v1.0-beta** — Evaluación institucional, resolución y SLA integrados.
- [ ] **v1.0** — Sistema completo con dashboard, catálogo público y
      seguimiento de estados.

## Cómo participar

Este roadmap es abierto. Si querés sumarte al diseño o desarrollo, comentá
acá y presentate: qué sabés, qué te gustaría aprender y en qué área querés
contribuir (frontend, backend, UX/UI, DevOps, documentación).

## Discusión

Usá este Issue para centralizar ideas, preguntas y decisiones sobre el
alcance de v1.0. Los Issues específicos por funcionalidad se crearán por
separado con label \`sistema-web\`." \
  "roadmap,documentación,sistema-web"

# ────────────────────────────────────────────────────────────────────

crear_issue \
  "Llamado a colaboradores — Sumate al proyecto" \
  "## ¡Este proyecto necesita estudiantes como vos!

El marco de gobernanza del IES 9-018 es un proyecto **real, institucional y
abierto**. No es un trabajo práctico más: es una herramienta que la institución
va a usar, y que podés mostrar en tu portfolio.

### ¿Qué podés hacer?

| Área | Qué se necesita |
|------|----------------|
| **Documentación** | Redactar, revisar, mejorar plantillas y guías. |
| **Diseño UX/UI** | Pensar cómo debería ser el sistema web. |
| **Frontend** | Maquetar interfaces, conectar con API. |
| **Backend** | Modelar datos, lógica de negocio, autenticación. |
| **DevOps** | Dockerizar, desplegar en el servidor escolar. |
| **Testing** | Escribir tests, probar flujos, reportar bugs. |

### Beneficios

- Experiencia laboral real en un proyecto open source.
- Código público para tu portfolio.
- Trabajo colaborativo con otros estudiantes.
- Posibilidad de usar como proyecto integrador en PP3, ADI o Modelado.

### ¿Cómo arrancar?

1. Lee el [CONTRIBUTING.md](CONTRIBUTING.md).
2. Comentá en este Issue qué área te interesa.
3. Buscá Issues con label \`good-first-issue\` para arrancar con algo sencillo.
4. Si tenés dudas, preguntá acá mismo.

**No hace falta ser experto.** Solo ganas de aprender y contribuir." \
  "colaboración,good-first-issue"

# ────────────────────────────────────────────────────────────────────

crear_issue \
  "Diagramas Mermaid: agregar en documentos clave" \
  "## Problema

Actualmente solo el README y el 00_INDICE tienen diagramas Mermaid. El resto
de los documentos (01 al 12) son texto y tablas, lo que dificulta la
comprensión rápida de los procesos.

## Propuesta

Agregar diagramas Mermaid en los siguientes documentos:

- **01_SOLICITUD_ALOJAMIENTO.md** — Diagrama del flujo que sigue una solicitud
  desde que se completa hasta que se aprueba/rechaza.
- **04_DECLARACION_RESPONSABILIDAD.md** — Diagrama de responsabilidades
  (quién responde por qué).
- **05_POLITICA_USO_ACEPTABLE.md** — Diagrama de consecuencias
  (infracción → consecuencia).
- **07_SOLICITUD_USUARIO.md** — Diagrama del proceso de obtención de acceso.
- **09_AUDITABILIDAD.md** — Diagrama de la arquitectura de monitoreo.

## Criterios

- Diagramas simples, no más de 6-8 nodos.
- Texto en español.
- Cohérentes con el estilo del diagrama en README y 00_INDICE.

## ¿Te gustaría trabajar en esto?

Comentá en este Issue qué documento te interesa y asignamos." \
  "mejora,diagramas,good-first-issue"

# ────────────────────────────────────────────────────────────────────

crear_issue \
  "Sistema web: definición de tecnologías y stack" \
  "## Problema

Para avanzar con la digitalización del marco de gobernanza, necesitamos
definir el stack tecnológico del futuro sistema web. Esta decisión afecta
al desarrollo, al despliegue y al mantenimiento.

## Preguntas a resolver

- **Backend:** ¿Python/Django, Node.js/Express, o Java/Spring? (considerar
  que los estudiantes de la Tecnicatura conocen Python y están viendo
  Django en las materias).
- **Frontend:** ¿React, Vue, Svelte o HTML+JS vanilla? (priorizar que sea
  accesible para estudiantes que recién empiezan con frameworks).
- **Base de datos:** ¿PostgreSQL, SQLite, o MariaDB? (el servidor escolar ya
  tiene PostgreSQL).
- **Autenticación:** ¿JWT, sessions, o Auth externo?
- **Despliegue:** ¿Docker compose igual que los otros servicios escolares?

## Restricciones

- Debe poder correr en el servidor escolar existente (Debian 12, Docker).
- Debe ser mantenible por estudiantes que rotan cada ciclo lectivo.
- Preferir tecnologías que se ven en las materias de la carrera.

## ¿Cómo participo?

Comentá tu opinión sobre las preguntas de arriba. Si tenés experiencia con
alguna tecnología, contalo. Este Issue es para discutir, no para decidir
todavía." \
  "sistema-web,discusión"

# ────────────────────────────────────────────────────────────────────

crear_issue \
  "Sistema web: diseño de modelo de datos (entidades)" \
  "## Descripción

Para digitalizar el proceso de gobernanza, necesitamos un modelo de datos
que represente las entidades involucradas. A partir de los documentos actuales,
propongo las siguientes entidades iniciales:

### Entidades propuestas

1. **Solicitud** — Pedido de alojamiento (doc 01)
   - Datos del proyecto, responsable, nivel, estado, fechas.
2. **EvaluaciónTécnica** — Resultado de la revisión del admin (doc 02)
   - Checklist de seguridad, operación, dictamen.
3. **EvaluaciónInstitucional** — Resultado de la revisión de dirección (doc 03)
   - Alineación educativa, riesgo, dictamen.
4. **Resolución** — Aprobación formal del Consejo Directivo (doc 08)
   - Número, fecha, firmas.
5. **Servicio** — Servicio activo en el servidor
   - URL, tecnología, responsable, SLA, estado.
6. **Usuario** — Persona con acceso al servidor
   - Perfil (desarrollador, docente, auditor, admin), proyectos, fechas.
7. **Incidente** — Evento de seguridad o suspensión
   - Fecha, tipo, acción tomada, responsable.

### Tareas

- [ ] Revisar y ajustar las entidades propuestas.
- [ ] Definir relaciones entre entidades.
- [ ] Crear el diagrama entidad-relación (DER).
- [ ] Identificar campos obligatorios y optativos.

### Links útiles

- [01_SOLICITUD_ALOJAMIENTO.md](docs/01_SOLICITUD_ALOJAMIENTO.md)
- [02_EVALUACION_TECNICA.md](docs/02_EVALUACION_TECNICA.md)
- [03_EVALUACION_INSTITUCIONAL.md](docs/03_EVALUACION_INSTITUCIONAL.md)

¿Te parece que falta alguna entidad? ¿Sobra alguna? Comentá." \
  "sistema-web,modelado,discusión"

# ────────────────────────────────────────────────────────────────────

crear_issue \
  "Mejora: crear plantilla de solicitud para docentes (no alumnos)" \
  "## Problema

Actualmente la plantilla \`solicitud_alu.md\` está orientada a alumnos de la
Tecnicatura (incluye justificación de arquitectura, repo público, licencia).
Un docente que quiera alojar un servicio educativo no necesita esos campos,
y la plantilla actual le queda incómoda o confusa.

## Propuesta

Crear una plantilla alternativa \`solicitud_docente.md\` con una versión
simplificada que omita:

- Justificación de arquitectura.
- Repositorio público y licencia.
- Preguntas sobre materias de la carrera.

Y que en su lugar incluya:

- Justificación pedagógica (¿qué materia/área beneficia?).
- Requisitos de privacidad de datos de estudiantes.
- Acuerdo de confidencialidad si maneja datos institucionales.

## Alternativa considerada

Agregar un campo \"Tipo de solicitante\" al inicio que muestre/oculte
secciones. Pero con plantillas separadas es más claro y evita condicionales." \
  "mejora,plantillas,good-first-issue"

# ────────────────────────────────────────────────────────────────────

echo ""
echo "✅ Todos los Issues fueron creados."
echo "Revisalos en: https://github.com/$REPO/issues"
