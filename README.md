# Gobernanza de Servicios Digitales — IES 9-018

**Versión:** v0.9 — Beta Institucional
**Repositorio:** [IES9018/gobernanza-servicios-digitales](https://github.com/IES9018/gobernanza-servicios-digitales)

Marco institucional para solicitar, evaluar, aprobar, alojar y suspender servicios digitales en el servidor del IES 9-018.

> El alojamiento en infraestructura institucional **no implica aprobación, supervisión ni responsabilidad** del IES 9-018.

### Propiedad del dominio institucional

El dominio **ies9018malargue.edu.ar** y **todos sus subdominios** son propiedad
exclusiva del IES 9-018. Ningún servicio podrá publicarse bajo este dominio o
subdominios sin la aprobación formal del proceso de gobernanza
(documentos 01 al 08).

El administrador técnico es la única persona autorizada para realizar cambios
de DNS y asignación de subdominios.

---

## Flujo de aprobación

```mermaid
graph TD
    A["Solicitud 01"] --> B["Evaluación Técnica 02"]
    B --> C["Evaluación Institucional 03"]
    C --> D["Declaración 04 + Resolución 08"]
    D --> E[Consejo Directivo]
    E -->|Aprueba| F["Despliegue + SLA 06"]
    E -->|Rechaza| G["Notificación con fundamentos"]
    subgraph Estudiantes Tecnicatura
    A
    end
```

## Documentos

| # | Documento |
|---|-----------|
| 00 | [Índice general](docs/00_INDICE.md) (empezar aquí) |
| 01 | [Solicitud de Alojamiento](docs/01_SOLICITUD_ALOJAMIENTO.md) |
| 02 | [Evaluación Técnica](docs/02_EVALUACION_TECNICA.md) |
| 03 | [Evaluación Institucional](docs/03_EVALUACION_INSTITUCIONAL.md) |
| 04 | [Declaración de Responsabilidad](docs/04_DECLARACION_RESPONSABILIDAD.md) |
| 05 | [Política de Uso Aceptable](docs/05_POLITICA_USO_ACEPTABLE.md) |
| 06 | [SLA Educativo](docs/06_SLA_EDUCATIVO.md) |
| 07 | [Solicitud de Usuario](docs/07_SOLICITUD_USUARIO.md) |
| 08 | [Resolución Directiva](docs/08_RESOLUCION_DIRECTIVA.md) |
| 09 | [Guía Técnica de Auditoría](docs/09_AUDITABILIDAD.md) |
| 10 | [Glosario](docs/10_GLOSARIO.md) |
| 11 | [Emergencia y Control](docs/11_EMERGENCIA_Y_CONTROL.md) |
| 12 | [Transparencia y Auditoría Comunitaria](docs/12_TRANSPARENCIA_COMUNITARIA.md) |

---

## Este es un proyecto vivo

Esta documentación **está en desarrollo, no está cerrada ni terminada**.
Es un marco abierto, dinámico y en evolución constante, construido colectivamente
por la comunidad del IES 9-018.

Toda sugerencia, crítica o propuesta es bienvenida y queda registrada
formalmente a través de los [Issues](https://github.com/IES9018/gobernanza-servicios-digitales/issues)
de este repositorio.

---

## Abierto a toda la comunidad educativa

Este proyecto nace desde la **Tecnicatura Superior en Desarrollo de Software**
pero está abierto a **toda la comunidad del IES 9-018**:

- **Estudiantes** — de cualquier carrera y año.
- **Docentes** — de todas las áreas.
- **Directivos** — coordinadores, consejo directivo, dirección.
- **Personal institucional** — administrativo, preceptores, biblioteca.

No hace falta saber programar para participar. La gobernanza digital nos
involucra a todos.

---

## Dejá tu sugerencia formal (Issues)

Los [Issues de GitHub](https://github.com/IES9018/gobernanza-servicios-digitales/issues)
son el canal oficial para dejar sugerencias formales sobre la gobernanza digital
de la institución. Cada Issue queda documentado con autor, fecha, contenido
y seguimiento.

Podés sugerir sobre:

- **Documentación** — corregir, ampliar o mejorar los documentos existentes.
- **Procesos** — cambios en el flujo de aprobación, roles o responsabilidades.
- **Políticas** — nuevas reglas de uso, privacidad, transparencia.
- **Sistema web** — ideas para la futura plataforma de gestión digital.
- **Cualquier tema** que consideres relevante para la gobernanza digital.

> Usá las plantillas disponibles al crear un Issue. Si tu sugerencia no
> encaja en ninguna, elegí "Sugerencia de gobernanza" y completala libremente.

[→ Abrir un Issue](https://github.com/IES9018/gobernanza-servicios-digitales/issues/new/choose)

---

## ¿Por qué participar?

- **Dejás huella** — tu sugerencia queda documentada y forma parte de la
  política institucional.
- **Formás parte** — la gobernanza digital la construimos entre todos.
- **Experiencia real** — si sos estudiante, trabajás sobre un sistema que la
  institución necesita, con revisión y despliegue real.
- **Portfolio** — tu nombre queda asociado a contribuciones públicas.

---

## ¿Qué viene después? — Sistema web de gestión

Este marco documental es el **paso 1**. El **paso 2** es desarrollar un
**sistema web liviano** para digitalizar todo el proceso: carga de solicitudes,
evaluaciones técnicas e institucionales, seguimiento de estados, catálogo de
servicios activos y dashboard para el Consejo Directivo.

Ese sistema web será **desarrollado íntegramente por estudiantes** de la
Tecnicatura, como proyecto integrador. Este repositorio solo contiene la
documentación y las reglas de negocio — el desarrollo corre por cuenta
de los alumnos, guiados por sus docentes, sin recibir el código resuelto.

Si querés participar del diseño o desarrollo, seguí los Issues con la
etiqueta `sistema-web` y sumate al equipo.

---

[Plantillas](plantillas/) · [CHANGELOG](CHANGELOG.md) · [Índice completo](docs/00_INDICE.md) · [Cómo contribuir](CONTRIBUTING.md)
