# Solicitud de Usuario del Servidor — IES 9-018

**Versión:** 1.0 — Junio 2026
**Plantilla imprimible:** `plantillas/solicitud_usuario.md`
**Instrucciones:** Completar este formulario y enviarlo al administrador técnico
del servidor. El acceso será concedido una vez aprobado por el responsable
institucional y firmada la Política de Uso Aceptable.

---

## 1. ¿Por qué existe este proceso?

El servidor del IES 9-018 es un **recurso educativo compartido**. Dar acceso a
una persona significa que esa persona podrá ejecutar comandos, almacenar datos
y usar recursos que pertenecen a toda la institución.

Este proceso existe para:

- **Proteger al estudiante:** sabrá exactamente qué puede y no puede hacer.
- **Proteger al docente:** no será responsable por lo que haga un estudiante
  con acceso al servidor.
- **Proteger a la institución:** todo acceso queda registrado y auditado.
- **Garantizar transparencia:** cualquier persona autorizada puede auditar
  qué se hizo y quién lo hizo.

> **Todas las acciones realizadas por cualquier usuario en el servidor quedan
> registradas en los sistemas de auditoría (auditd, journald). No existe
> operación sin registro.**

---

## 2. Perfiles de usuario

| Perfil | Acceso SSH | Docker | sudo | ¿Para quién? |
|--------|-----------|--------|------|-------------|
| **Desarrollador** | Solo su home | Solo servicios autorizados vía script | No | Estudiantes que alojan proyectos |
| **Docente** | Solo su home | Docker ps/logs (solo lectura) | No | Docentes que supervisan proyectos |
| **Auditor** | Solo su home | Docker ps/logs (solo lectura) | Comandos de auditoría | Profesionales externos, DGE, autoridades |
| **Admin institucional** | Su home + /opt/escuela | Completo | NOPASSWD | Personal de la institución |
| **Admin técnico** | Completo | Completo | Completo | Operador del servidor |

---

## 3. Perfiles detallados

### 3.1 Desarrollador

Puede alojar sus proyectos en el servidor usando un script blindado que
restringe las acciones posibles.

```bash
# Puede hacer
ssh alumno@&lt;ip-del-servidor&gt;
sudo servicio-alumno up proyecto-ejemplo    # levantar servicio
sudo servicio-alumno down proyecto-ejemplo   # frenar servicio
sudo servicio-alumno logs proyecto-ejemplo   # ver logs
sudo servicio-alumno ps                      # listar servicios

# NO puede hacer
docker run        # crear contenedores nuevos fuera de su proyecto
sudo              # ejecutar comandos como root
acceder a /opt    # ver datos institucionales
modificar server  # cambiar configuración del sistema
```

### 3.2 Docente

Puede acceder a los servicios web alojados, monitorear proyectos de sus
alumnos y verificar el estado general del servidor.

```bash
# Puede hacer
ssh docente@&lt;ip-del-servidor&gt;
docker ps                         # listar servicios activos
docker logs servicio-alumno -n 20 # ver logs de proyectos de sus alumnos
systemctl status cloudflared      # verificar estado del tunnel
cat /var/log/server-bitacora/estado.log  # ver bitácora del servidor
```

### 3.3 Auditor

Acceso exclusivamente de lectura. Documentado en detalle en
[09_AUDITABILIDAD.md](09_AUDITABILIDAD.md).

### 3.4 Admin institucional

Acceso completo a la configuración del servidor, con capacidad de modificar
servicios, usuarios y datos institucionales.

---

## 4. Proceso de solicitud

### Paso 1 — Completar el formulario

El solicitante completa el formulario al final de este documento y lo envía
al administrador técnico.

### Paso 2 — Evaluación

El admin evalúa:

- ¿El perfil solicitado es adecuado para la tarea?
- ¿El proyecto tiene un docente tutor (si aplica)?
- ¿El solicitante leyó y aceptó la Política de Uso Aceptable?

### Paso 3 — Creación del usuario

El admin crea el usuario con los permisos correspondientes a su perfil.

```bash
sudo adduser --shell /bin/bash <username>
# Asignar grupo según perfil
sudo usermod -aG <grupo_perfil> <username>
# Configurar sudoers si aplica
sudo cp /etc/sudoers.d/plantilla-<perfil> /etc/sudoers.d/<username>
```

### Paso 4 — Entrega de credenciales

El admin entrega al solicitante:

- Su nombre de usuario.
- Su clave SSH pública (la que el solicitante haya provisto).
- Los comandos que puede ejecutar.

### Paso 5 — Firma de compromiso

El solicitante firma la Política de Uso Aceptable (documento 05).
Sin esta firma, el acceso no se habilita.

---

## 5. Formulario de solicitud

### Datos del solicitante

| Campo | Respuesta |
|-------|-----------|
| Nombre completo | |
| DNI | |
| Correo electrónico | |
| Teléfono de contacto | |
| Rol (alumno / docente / externo) | |
| Carrera / Curso (si aplica) | |
| Docente tutor (si aplica) | |

### Perfil solicitado

| Perfil | Seleccionar |
|--------|-------------|
| ☐ Desarrollador | Necesito alojar proyectos en el servidor |
| ☐ Docente | Necesito monitorear servicios educativos |
| ☐ Auditor | Necesito auditar el servidor (especificar motivo) |
| ☐ Admin institucional | Autorizado por Consejo Directivo |

### Justificación

**¿Qué tareas específicas necesito realizar en el servidor?**

```

```

**¿Cuánto tiempo necesito acceso?**

☐ Un mes  ☐ Un cuatrimestre  ☐ Un ciclo lectivo  ☐ Permanente

**¿A qué servicios o proyectos necesito acceder?**

```

```

### Declaraciones

Al firmar este formulario declaro:

- [ ] He leído la Política de Uso Aceptable del IES 9-018.
- [ ] Acepto que todas mis acciones en el servidor serán auditadas.
- [ ] Acepto que el servidor es un recurso educativo sin garantía de
      disponibilidad.
- [ ] Acepto no lucrar ni realizar actividades comerciales usando la
      infraestructura institucional.
- [ ] Acepto que el acceso puede ser revocado en cualquier momento sin
      previo aviso si se detectan incumplimientos.
- [ ] Entiendo que mi responsable soy yo mismo y que la institución no se
      hace responsable por mis acciones en el servidor.

### Firmas

| Solicitante | Docente tutor (si aplica) | Admin técnico |
|-------------|--------------------------|---------------|
| Nombre: | Nombre: | Nombre: |
| Firma: | Firma: | Firma: |
| Fecha: | Fecha: | Fecha: |

---

## 6. Ejemplo ilustrativo — Estudiante Desarrollador

**Situación:** Un estudiante del IES 9-018 necesita alojar dos proyectos
(biblioteca digital y prode deportivo) como parte de su formación.
Su docente tutor avala el proyecto.

### Qué se le otorga

| Aspecto | Detalle |
|---------|---------|
| Perfil | Desarrollador |
| Usuario | `estudiante` |
| Acceso SSH | Solo su home (`/home/estudiante/`) |
| Proyectos | `biblioteca`, `prode` en `/home/estudiante/proyectos/` |
| Comandos permitidos | `servicio-estudiante up/down/logs/ps` (solo para sus proyectos) |
| Sin acceso a | `docker`, `sudo`, `/opt/`, `/root/`, otros usuarios |

### Qué NO se le permite

- **Grupo docker** → equivalente a tener acceso root al servidor.
- **Grupo sudo** → podría modificar cualquier archivo del sistema.
- **Acceso a otros directorios** → no puede ver datos de otros proyectos.

### Lecciones para el estudiante

1. El servidor no es una computadora personal: los recursos son compartidos.
2. Todo proyecto debe tener un docente tutor responsable.
3. El acceso se revoca al finalizar el proyecto o ciclo lectivo.
4. Las credenciales débiles o por defecto deben reemplazarse antes de exponer
   cualquier servicio a internet.

---

## 7. Vigencia y renovación

| Perfil | Vigencia máxima | Renovación |
|--------|----------------|------------|
| Desarrollador | Ciclo lectivo | Nuevo formulario cada año |
| Docente | Ciclo lectivo | Automática si sigue a cargo |
| Auditor | Por auditoría | Se revoca al finalizar |
| Admin institucional | Permanente | Mientras cumpla el rol |

El acceso vence automáticamente al finalizar el período. Para renovar,
completar un nuevo formulario.
