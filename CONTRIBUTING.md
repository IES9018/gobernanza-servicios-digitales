# Cómo contribuir — Gobernanza de Servicios Digitales IES 9-018

**¡Gracias por tu interés en contribuir!** Este proyecto es abierto, educativo
y está impulsado desde la **Tecnicatura Superior en Desarrollo de Software**
del IES 9-018, pero abierto a **toda la comunidad educativa**: estudiantes de
cualquier carrera, docentes de todas las áreas, directivos y personal institucional.

No hace falta saber programar para participar. La gobernanza digital nos
involucra a todos.

---

## Formas de contribuir

### 1. Dejar una sugerencia formal (Issues)

Cualquier persona puede abrir un Issue para:

- Sugerir cambios en la gobernanza digital de la institución.
- Proponer mejoras en la documentación, procesos o políticas.
- Reportar errores, inconsistencias o información desactualizada.
- Proponer nuevas plantillas o procedimientos.
- Discutir ideas para el futuro sistema web.
- Pedir aclaraciones sobre algún documento.

[→ Abrir un Issue](https://github.com/IES9018/gobernanza-servicios-digitales/issues/new/choose)

### 2. Contribuir con código o documentación (Pull Requests)

Si querés escribir o modificar documentos, plantillas, diagramas o código:

1. **Forkeá** el repositorio a tu cuenta de GitHub.
2. **Cloná** tu fork: `git clone https://github.com/tu-usuario/gobernanza-servicios-digitales`
3. **Creá una rama** para tu cambio: `git checkout -b feat/mi-mejora`
4. **Hacé tus cambios** siguiendo las convenciones del proyecto.
5. **Commité** con mensajes claros en español: `git commit -m "feat: nueva plantilla para X"`
6. **Push** a tu fork: `git push origin feat/mi-mejora`
7. **Abrí un Pull Request** desde tu rama hacia `main` de este repositorio.

### 3. Participar en el diseño del sistema web

El marco documental actual es el punto de partida. El objetivo es desarrollar
un sistema web que digitalice todo el proceso. Si te interesa participar:

- Seguí los Issues con la etiqueta `sistema-web`.
- Seguí los Issues con la etiqueta `sistema-web`.
- Comentá en el [Roadmap v1.0](https://github.com/IES9018/gobernanza-servicios-digitales/issues/1)
  para sumarte al equipo de diseño o desarrollo.
- Abrí un Issue con la plantilla "Sistema web" para proponer funcionalidades nuevas.

---

## ¿Qué necesito saber?

| Tema | ¿Es necesario? |
|------|---------------|
| Markdown | Para editar documentación |
| Git y GitHub | Para abrir Issues y PRs |
| Docker / Linux | Solo si participás del despliegue |
| Django / React / base de datos | Solo si participás del sistema web |
| Ganas de aprender | **Lo más importante** |

---

## Convenciones del proyecto

### Mensajes de commit

Usamos [Conventional Commits](https://www.conventionalcommits.org/):

| Prefijo | Cuándo usarlo |
|---------|---------------|
| `feat:` | Nueva funcionalidad, documento o sección |
| `fix:` | Corrección de error o inconsistencia |
| `docs:` | Cambios solo en documentación |
| `refactor:` | Reorganización sin cambiar contenido |
| `style:` | Formato Markdown, tipeo, ortografía |
| `chore:` | Configuración, CI, plantillas |

### Archivos modificados

- Un archivo por documento, numerado (`01_SOLICITUD_ALOJAMIENTO.md`).
- Las plantillas van en `/plantillas/` con nombre en minúscula y guión bajo.
- Documentación complementaria en `/docs/`.

### Estilo

- Tono neutro, institucional pero accesible.
- Sin jerga técnica innecesaria (glosario en doc 10).
- Tablas Markdown limpias, sin celdas fusionadas.
- Ejemplos sanitizados (sin datos reales de personas ni IPs).

---

## Próximos pasos: el sistema web

Este marco es la base. El paso siguiente es construir un sistema web que
permita:

- Cargar solicitudes de alojamiento digitalmente.
- Realizar evaluaciones técnicas e institucionales desde el navegador.
- Hacer seguimiento del estado de cada solicitud.
- Mantener un catálogo público de servicios activos.
- Dashboard para el Consejo Directivo.

**Tecnologías tentativas:** Python/Django o Node.js, PostgreSQL, frontend
moderno (React, Vue o Svelte), Docker, despliegue en el servidor escolar.

Si te interesa participar del diseño o desarrollo, seguí los Issues con
etiqueta `sistema-web` y sumate al equipo.

---

## Código de conducta

Este proyecto sigue el espíritu del IES 9-018: colaboración, respeto y
aprendizaje mutuo. No se tolera discriminación, acoso ni uso del proyecto
para fines ajenos a la educación.

---

**¿Dudas?** Abrí un Issue o hablá con tu docente tutor.
