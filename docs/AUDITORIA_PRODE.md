# Auditoría de Conformidad — prode-mundial

**Proyecto:** Prode Mundial 2026 (predicciones deportivas)
**Imagen Docker:** `prode-mundial:latest`
**Framework:** Django 6.0.6 + PostgreSQL 16
**Puerto:** 8010 → 8000 (bind a `0.0.0.0`)
**Subdominio previsto:** `prode.ies9018malargue.edu.ar`
**Fecha de auditoría:** Junio 2026

---

## Resumen

| Métrica | Valor |
|---------|-------|
| Conformidades | 10/24 |
| No conformidades | 14 |
| Críticas | 7 (solicitud, evaluación técnica, resolución directiva, declaración, AUP, bind 0.0.0.0, sin LICENSE) |
| Riesgos | 5 |

---

## 1. Requisitos administrativos

### 1.1 Solicitud de Alojamiento (Doc 01)

| Requisito | Estado | Evidencia |
|-----------|--------|-----------|
| Formulario de solicitud completado | ❌ | No existe ningún formulario 01 firmado |
| Subdominio justificado | ❌ | No hay justificación del nombre |
| Responsable identificado | ❌ | No hay responsable principal declarado |
| Docente tutor identificado | ❌ | No hay docente tutor asignado en el formulario |
| Arquitectura justificada | ❌ | No hay justificación arquitectónica |
| Licencia declarada | ❌ | No hay licencia |

### 1.2 Evaluación Técnica (Doc 02)

| Requisito | Estado | Evidencia |
|-----------|--------|-----------|
| Checklist de seguridad completado | ❌ | No existe evaluación técnica |
| Checklist de operación completado | ❌ | No existe |
| Checklist de infraestructura completado | ❌ | No existe |
| Dictamen técnico emitido | ❌ | No existe |

### 1.3 Resolución Directiva (Doc 08)

| Requisito | Estado | Evidencia |
|-----------|--------|-----------|
| Resolución del Consejo Directivo | ❌ | No existe resolución aprobatoria |
| Nivel de servicio asignado | ❌ | No hay nivel definido |

### 1.4 Declaración de Responsabilidad (Doc 04)

| Requisito | Estado | Evidencia |
|-----------|--------|-----------|
| Declaración firmada | ❌ | No existe |
| Liberación de responsabilidad institucional | ❌ | No firmada |

### 1.5 Política de Uso Aceptable (Doc 05)

| Requisito | Estado | Evidencia |
|-----------|--------|-----------|
| AUP firmada por desarrollador(es) | ❌ | No existe |
| AUP firmada por docente tutor | ❌ | No existe |

---

## 2. Requisitos técnicos de seguridad

### 2.1 Bind de puerto

| Requisito | Estado | Evidencia |
|-----------|--------|-----------|
| Puerto bindeado a 127.0.0.1 (nunca 0.0.0.0) | ❌ | `gunicorn ... --bind 0.0.0.0:8000` en Dockerfile y docker-compose |

**Riesgo:** El contenedor expone su puerto a todas las interfaces de red. Esto significa que si no hay un firewall o reverse proxy bloqueando, el servicio es accesible directamente desde cualquier IP en la red.

**Corrección necesaria:** Cambiar a `--bind 127.0.0.1:8000` y que el reverse proxy (Cloudflare Tunnel o nginx) se conecte a `127.0.0.1:8000`.

### 2.2 Secretos y credenciales

| Requisito | Estado | Evidencia |
|-----------|--------|-----------|
| Contraseñas con hash (bcrypt/argon2) | ✅ | Django usa PBKDF2 por defecto (configurable a bcrypt/argon2) |
| Credenciales en variables de entorno | ✅ | `DJANGO_SECRET_KEY`, `POSTGRES_PASSWORD`, `RAPIDAPI_KEY` vía env vars |
| Secretos rotados respecto a valores por defecto | ⚠️ | `settings.py` tiene un fallback `SECRET_KEY` hardcodeado para desarrollo |
| Sin secretos en código | ⚠️ | Fallback key en settings.py no debería existir ni en dev |

**Riesgo:** Si alguien levanta el contenedor sin definir `DJANGO_SECRET_KEY`, el sistema usa la key default hardcodeada, que es pública (está en el código de la imagen).

### 2.3 HTTPS

| Requisito | Estado | Evidencia |
|-----------|--------|-----------|
| HTTPS (certificado válido o proxy con SSL) | ⚠️ | Previsto vía Cloudflare Tunnel en puerto 8010, pero no configurado actualmente |

### 2.4 Headers de seguridad

| Requisito | Estado | Evidencia |
|-----------|--------|-----------|
| Security Headers (CSP, CORS, etc.) | ❌ | No se encontró configuración de `SECURE_*` headers en settings.py |

---

## 3. Requisitos de operación

| Requisito | Estado | Evidencia |
|-----------|--------|-----------|
| Dockerizado | ✅ | Dockerfile + docker-compose.yml completos |
| Logs de aplicación accesibles | ✅ | `docker logs prode-web` funciona |
| Backup de datos definido y documentado | ❌ | No hay procedimiento de backup para `prode_pgdata` |
| Responsable de mantenimiento identificado | ❌ | No hay responsable |
| Procedimiento de reinicio documentado | ❌ | No documentado |
| Contacto de emergencia actualizado | ❌ | No hay contacto |
| Recursos asignados documentados (RAM/CPU/disco) | ❌ | No documentado |

---

## 4. Repositorio y licencia

| Requisito | Estado | Evidencia |
|-----------|--------|-----------|
| Repositorio público en GitHub | ❌ | El código no está en un repositorio público (solo existe como imagen Docker) |
| Licencia compatible con uso educativo institucional | ❌ | No existe archivo LICENSE → "todos los derechos reservados" |
| README.md | ❌ | No existe documentación del proyecto |
| Tests | ❌ | `tests.py` es un stub vacío |

---

## 5. Conformidades encontradas

| # | Requisito | Detalle |
|---|-----------|---------|
| 1 | Variables de entorno para secrets | ✅ `DJANGO_SECRET_KEY`, `POSTGRES_PASSWORD`, `RAPIDAPI_KEY` vía env vars (con `.env.example`) |
| 2 | CSRF Protection | ✅ Django CSRF middleware activo, `CSRF_TRUSTED_ORIGINS` configurable |
| 3 | Base de datos separada | ✅ PostgreSQL en contenedor propio, healthcheck configurado |
| 4 | Dockerizado | ✅ Dockerfile multi-etapa, docker-compose con volúmenes |
| 5 | Logs accesibles | ✅ `docker logs prode-web` disponible |
| 6 | WhiteNoise (static) | ✅ Sirve archivos estáticos sin nginx |
| 7 | Auth con sesiones | ✅ Login/logout con Django auth, passwords hasheados |
| 8 | Migraciones | ✅ 5 migraciones, maneja esquemas legacy |
| 9 | .env.example | ✅ Incluido en el código |
| 10 | Contenedor aislado | ✅ Stack con red propia, no comparte con otros servicios |

---

## 6. Riesgos identificados

| Riesgo | Descripción | Severidad |
|--------|-------------|-----------|
| **API externa SofaScore** | El servicio depende de una API de terceros (RapidAPI o directa). Sin fallback offline, si la API cambia o se cae, el prode deja de actualizar resultados. | Media |
| **Prode como juego de azar** | El nombre "prode" y la mecánica de predicción de resultados puede interpretarse como juego/apuesta. La AUP prohíbe apuestas con dinero real; como no tiene dinero real no viola la AUP, pero necesita evaluación institucional explícita. | Baja |
| **Sin moderación de contenido** | Los usuarios pueden elegir cualquier username. No hay control sobre nombres ofensivos o inapropiados en el ranking. | Media |
| **Contenedor corre como root** | El Dockerfile no define un `USER`, el contenedor ejecuta procesos como root. | Alta |
| **Sin límite de rate** | No hay rate limiting en login, exponiendo a ataques de fuerza bruta. | Media |

---

## 7. Análisis de procedencia

### 7.1 ¿Es un clon o fork de otro repositorio público?

**No.** Se realizaron búsquedas en GitHub de:

- `ComunidadSoft` (nombre del proyecto Django)
- `panel_prode`, `ranking_institucional`, `fases_a_mostrar` (nombres de funciones)
- `calcular_puntos_prode` (función única)
- `SOFASCORE_FASE_FECHAS`, `SOFASCORE_GRUPOS_DESDE` (variables de configuración)
- `prode.ies9018malargue.edu.ar` (subdominio institucional)

**Ninguna de estas búsquedas encontró coincidencias en GitHub.** No existe evidencia de que el código haya sido copiado de un repositorio público existente.

Existen otros proyectos "prode" en GitHub, pero todos usan tecnologías diferentes:
- `pmartelletti/prode-mundial`: Symfony/PHP (2014)
- `romeroyonatan/prode`: Django pero código diferente (2018)
- `r3back/prode-fifa-world-cup`: Python pero implementación diferente (2022)
- `JuanAgusAlej/prode`: Node.js/PWA (2022)

### 7.2 ¿Fue generado por IA o desarrollado por una persona?

**Evidencia de generación asistida por IA:**

| Indicador | Presente |
|-----------|----------|
| Comentarios extremadamente detallados y consistentes | ✅ |
| Documentación en inglés (el contexto del proyecto es argentino/español) | ✅ |
| Sin modismos personales ni estilos inconsistentes | ✅ |
| Adherencia perfecta a buenas prácticas de Django en todos los archivos | ✅ |
| Docstrings completos y consistentes en todas las funciones | ✅ |
| Manejo de edge cases y errores muy completo | ✅ |

**Evidencia de intervención humana:**

| Indicador | Presente |
|-----------|----------|
| Datos del fixture del Mundial 2026 compilados manualmente | ✅ |
| Configuración específica del IES (subdominio, puerto 8010, Cloudflare) | ✅ |
| Emojis y lenguaje informal en templates ("Hola, usuario") | ✅ |
| Script `crear-admin.sh` con flujo de deploy institucional | ✅ |

**Conclusión:** El código fue **generado con asistencia de IA** (ChatGPT, Claude o similar) pero con dirección humana significativa. Una persona con conocimiento del contexto institucional:
1. Dictó los requerimientos y la arquitectura a la IA
2. Configuró los archivos de despliegue para el servidor del IES
3. Compiló los datos reales del fixture del Mundial 2026
4. Personalizó la interfaz con nombres y estilos institucionales

**No hay fraude ni apropiación indebida.** El uso de IA como herramienta de desarrollo es una práctica estándar en la industria. El código es original, no copiado de otro proyecto.

### 7.3 ¿A nombre de quién está el desarrollo?

El proyecto no tiene autoría declarada:
- No hay README ni LICENSE
- No hay `AUTHORS` ni `CONTRIBUTORS`
- La imagen Docker no tiene labels de autor
- El `.env.example` referencia `admin@ies9018malargue.edu.ar` como email genérico

Esto es otra no conformidad: el marco de gobernanza exige que cada proyecto tenga un responsable identificado.

---

## 8. Plan de regularización

Para que `prode-mundial` cumpla con el marco de gobernanza:

| Prioridad | Acción | Documento |
|-----------|--------|-----------|
| 🔴 Crítica | Identificar responsable(s) del proyecto | Doc 01 |
| 🔴 Crítica | Completar solicitud de alojamiento retroactiva | Doc 01 |
| 🔴 Crítica | Firmar Declaración de Responsabilidad | Doc 04 |
| 🔴 Crítica | Firmar Política de Uso Aceptable | Doc 05 |
| 🔴 Crítica | Cambiar bind de `0.0.0.0` a `127.0.0.1` | Dockerfile |
| 🟡 Alta | Agregar archivo LICENSE | Repositorio |
| 🟡 Alta | Agregar README con documentación del proyecto | Repositorio |
| 🟡 Alta | Definir nivel de servicio (Nivel 2 o 3) y obtener resolución | Doc 08 |
| 🟡 Alta | Agregar usuario no-root en Dockerfile | Dockerfile |
| 🟢 Media | Realizar evaluación técnica | Doc 02 |
| 🟢 Media | Realizar evaluación institucional | Doc 03 |
| 🟢 Media | Documentar backup de la base de datos | Doc 06 |
| 🟢 Media | Documentar recursos asignados | Doc 06 |
| 🟢 Media | Agregar tests | `tests.py` |
