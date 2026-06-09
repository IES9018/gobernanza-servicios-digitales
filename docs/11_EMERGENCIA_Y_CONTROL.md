# Emergencia, Control y Blindaje Operativo — IES 9-018

**Versión:** v0.9 — Junio 2026
**Relacionado:** `09_AUDITABILIDAD.md`, `07_SOLICITUD_USUARIO.md`, `12_TRANSPARENCIA_COMUNITARIA.md`

---

## 1. Credenciales de emergencia (break-glass)

### El problema

Si el administrador técnico pierde acceso al servidor (renuncia, enfermedad,
accidente, viaje sin conectividad), la institución debe poder recuperar el
control sin depender de una sola persona.

### La solución

La contraseña del usuario **root** se genera, se imprime en papel y se guarda
dentro de un **sobre de manila cerrado y firmado** que custodia el Consejo
Directivo.

### Procedimiento de creación

```bash
# 1. Generar contraseña robusta (24 caracteres)
openssl rand -base64 18

# 2. Asignarla a root (como root)
echo "root:<contraseña>" | chpasswd

# 3. Imprimir en UNA sola hoja
echo "CONTRASEÑA DE EMERGENCIA — IES 9-018"
echo "Usuario: root"
echo "Contraseña: <contraseña>"
echo ""
echo "NO USAR esta contraseña para operación diaria."
echo "Solo para emergencia si el admin técnico no responde."
echo ""
echo "Después de usar: avisar al admin técnico y generar una nueva."

# 4. Guardar en sobre, firmar el cierre y entregar a dirección
```

### Reglas del sobre

| Regla | Detalle |
|-------|---------|
| **Cantidad** | 1 único sobre, 1 única copia |
| **Ubicación** | Caja fuerte / armario cerrado de dirección |
| **Firmas** | El cierre del sobre debe estar firmado por 2 directivos |
| **Apertura** | Solo si el admin técnico no responde por más de 72 horas |
| **Post-apertura** | Se genera nueva contraseña, nuevo sobre, nuevas firmas |
| **Registro** | Cada apertura queda registrada en el libro de actas |
| **Root NO se usa** | Esta contraseña no se usa para trabajar, solo para emergencia |

> **Importante:** El usuario root con esta contraseña solo debe usarse para
> restablecer el acceso del admin principal. Luego se vuelve a bloquear.
> No se debe trabajar como root en el día a día.

---

## 2. Administradores delegados: cómo dar acceso sin perder control

### El problema

Un "admin" con acceso completo puede:
- Leer los datos de cualquier usuario.
- Modificar o eliminar servicios críticos.
- Desactivar la auditoría y borrar evidencias.
- Suplantar al responsable (admin-responsable) o al usuario institucional (admin-institucional).

### La solución

**Ningún admin delegado debe tener acceso a admin-responsable ni admin-institucional.**
Nunca. Bajo ninguna circunstancia.

En lugar de compartir usuarios, se crean cuentas separadas con permisos
estrictamente delimitados:

```bash
# usuarios del sistema (intocables)
admin-responsable      → admin responsable (solo él conoce su clave)
admin-institucional    → admin institucional (uso exclusivo de la institución)
auditor        → solo lectura

# usuarios delegados (cada uno con su espacio)
operador-red   → puede reiniciar servicios de red
operador-nextcloud → puede administrar Nextcloud
desarrollador-1 → puede operar sus proyectos via script blindado
```

### Cómo evitar que un delegado tome el control

#### Regla 1: no compartir cuentas

Cada persona tiene su propio usuario y su propia clave SSH.
Si alguien necesita acceso administrativo, se crea un perfil específico
con los comandos que necesita y nada más.

#### Regla 2: sudoers restrictivo (el corazón de la seguridad)

Un usuario delegado NUNCA debe tener `sudo ALL`.
En su lugar, se le permite ejecutar **solo los comandos que necesita**:

```bash
# /etc/sudoers.d/operador-red
operador-red ALL=(root) NOPASSWD: /usr/bin/systemctl restart networking
operador-red ALL=(root) NOPASSWD: /usr/bin/systemctl status networking
operador-red ALL=(root) NOPASSWD: /usr/bin/journalctl -u networking*
```

```bash
# /etc/sudoers.d/desarrollador-1
# Solo puede ejecutar el script blindado
desarrollador-1 ALL=(root) NOPASSWD: /usr/local/bin/servicio-desarrollador-1 *
```

#### Regla 3: el script blindado

Ningún desarrollador ejecuta Docker directamente. Ejecuta un script
que valida estrictamente qué puede hacer:

```bash
#!/bin/bash
# /usr/local/bin/servicio-desarrollador-1
set -e
case "$1" in
  up)     cd /home/desarrollador-1/proyecto && docker compose up -d ;;
  down)   cd /home/desarrollador-1/proyecto && docker compose down ;;
  logs)   cd /home/desarrollador-1/proyecto && docker compose logs "$2" ;;
  ps)     cd /home/desarrollador-1/proyecto && docker compose ps ;;
  status) docker ps --filter name=desarrollador-1* ;;
  *)      echo "Acción no permitida"; exit 1 ;;
esac
```

El script es propiedad de `root:root 755` — el desarrollador no puede
modificarlo ni reemplazarlo.

#### Regla 4: proteger las cuentas críticas con `chattr +i`

```bash
# Las claves SSH de admin-responsable y root son inmutables
sudo chattr +i /home/admin-responsable/.ssh/authorized_keys
sudo chattr +i /root/.ssh/authorized_keys

# Los archivos de sudoers son inmutables
sudo chattr +i /etc/sudoers
sudo chattr +i /etc/sudoers.d/

# Los archivos de configuración de auditoría son inmutables
sudo chattr +i /etc/audit/rules.d/custom.rules
sudo chattr +i /etc/audit/auditd.conf
```

Para modificarlos: `sudo chattr -i <archivo>`, modificarlo, y luego
`sudo chattr +i <archivo>`. Cualquier modificación queda registrada en
`auditd` con la clave `escuela_config`.

#### Regla 5: el delegado no sabe las claves de nadie más

| Usuario | Clave | Quién la conoce |
|---------|-------|-----------------|
| `admin-responsable` | Su contraseña personal | Solo admin-responsable |
| `admin-institucional` | Contraseña institucional | Directivos + admin |
| `root` | En sobre cerrado | Nadie (salvo emergencia) |
| `auditor` | Clave SSH | Quien la solicite |
| `desarrollador-1` | Su propia clave | Solo el desarrollador |

---

## 3. Protección de logs de auditoría

### El problema

Si alguien con acceso root decide borrar los logs de auditoría
(`/var/log/audit/audit.log`), desaparecen las evidencias de lo que hizo.
Sin logs, no hay forma de probar nada.

### La solución

Se aplican **tres capas** de protección:

#### Capa 1: Archivos inmutables (acceso directo)

Los archivos de log se marcan como **append-only** (solo agregar, no
borrar ni modificar):

```bash
# El archivo de auditoría solo permite agregar líneas
sudo chattr +a /var/log/audit/audit.log

# El directorio no permite eliminar archivos
sudo chattr +a /var/log/audit/
```

Con `chattr +a`:
- Los logs se pueden **seguir escribiendo** (append).
- Los logs **no se pueden borrar** ni truncar.
- Los logs **no se pueden renombrar**.
- Solo `root` puede deshacer esto con `chattr -a`.

Cualquier intento de desactivar `chattr +a` queda registrado en el
**propio audit.log** (porque auditd registra todos los comandos).

#### Capa 2: Envío remoto de logs

Los eventos de auditoría se reenvían a un destino externo para que,
incluso si alguien borra los logs locales, exista una copia fuera del
servidor.

```bash
# Configurar reenvío syslog a un servidor externo
# /etc/audit/audisp-remote.conf

remote_server = logs.escuela.edu.ar
port = 60
transport = tcp
```

**Opciones concretas para IES 9-018 (orden de prioridad):**

| Opción | Descripción | Costo |
|--------|-------------|-------|
| **Otro servidor institucional** | Si hay otro server en la escuela, enviar logs allí | $0 |
| **Servidor de la DGE** | Si la DGE provee un syslog centralizado | $0 |
| **rsyslog + Dropbox/Nextcloud** | Rotar logs y subir cifrados a la nube institucional | $0 |
| **Servicio cloud gratuito** | Papertrail (10 MB/mes gratis), Logtail (gratis 1 GB/mes) | $0 |
| **AWS CloudWatch / GCP** | Logging en la nube (costo mínimo) | ~$1/mes |

**Configuración mínima: enviar por correo electrónico los eventos críticos:**

```bash
# /etc/audit/plugins.d/au-mta.conf (si existe)
# Alternativa: script que envía eventos FAIL por email
# Ver server_bitacora.sh que ya implementa esto
```

#### Capa 3: Verificación periódica de integridad

Un script diario verifica que los logs de auditoría no hayan sido
alterados:

```bash
#!/bin/bash
# /usr/local/sbin/verificar_auditoria.sh
# Se ejecuta diariamente desde cron

LOG="/var/log/audit/audit.log"
BACKUP="/backup/auditoria/integridad.log"

# Verificar que el archivo existe y no está vacío
if [ ! -s "$LOG" ]; then
  echo "ALERTA: audit.log vacío o inexistente" | mail -s "ALERTA AUDITORIA" directivos@escuela.edu.ar
fi

# Verificar que chattr +a sigue activo
if ! lsattr "$LOG" | grep -q "a"; then
  echo "ALERTA: audit.log perdió el atributo append-only" | mail -s "ALERTA AUDITORIA" directivos@escuela.edu.ar
fi

# Registrar verificación
echo "$(date -Is) VERIFICACION_OK $(wc -l < "$LOG") lineas" >> "$BACKUP"
```

### Diferencias entre `chattr +i` y `chattr +a`

| Atributo | Efecto | Se usa en |
|----------|--------|-----------|
| `+i` (immutable) | Nadie puede modificar, renombrar ni eliminar el archivo, ni siquiera root | Claves SSH, sudoers, reglas de auditoría |
| `+a` (append-only) | Solo se puede agregar contenido al final; no se puede borrar ni truncar | Archivos de log |

---

## 4. ¿Qué hace un administrador delegado que quiera borrar evidencias?

### Escenario 1: intenta borrar audit.log

```bash
# Intenta borrar
rm /var/log/audit/audit.log
# Resultado: rm: cannot remove '/var/log/audit/audit.log': Operation not permitted
# (porque tiene chattr +a)

# Intenta truncar
> /var/log/audit/audit.log
# Resultado: bash: /var/log/audit/audit.log: Operation not permitted

# Intenta desactivar chattr
chattr -a /var/log/audit/audit.log
# Resultado: queda registrado en el propio audit.log
# Además, el script de verificación diaria detecta la pérdida de +a y envía alerta
```

### Escenario 2: intenta acceder a la cuenta admin-responsable

```bash
# Intenta hacer sudo a admin-responsable
sudo -u admin-responsable -i
# Resultado: requiere contraseña de admin-responsable (solo él la sabe)

# Intenta leer la clave privada de admin-responsable
cat /home/admin-responsable/.ssh/id_ed25519
# Resultado: permission denied (atributo +i o permisos 600)

# Intenta agregar su propia clave SSH a admin-responsable
echo "clave-enemiga" >> /home/admin-responsable/.ssh/authorized_keys
# Resultado: bash: /home/admin-responsable/.ssh/authorized_keys: Operation not permitted (chattr +i)
```

### Escenario 3: intenta modificar las reglas de auditoría

```bash
# Intenta desactivar auditd
systemctl stop auditd
# Resultado: queda registrado en journalctl y audit.log
# Además, los logs remotos ya se enviaron

# Intenta modificar reglas
auditctl -D  # eliminar todas las reglas
# Resultado: queda registrado en audit.log (si auditd seguía corriendo)
```

---

## 5. Resumen de responsabilidades

| Rol | Qué puede hacer | Qué NO puede hacer |
|-----|----------------|-------------------|
| **admin-responsable** (admin responsable) | Todo. Root, sudo, docker, logs, auditoría | Delegar su cuenta |
| **admin-institucional** (admin institucional) | Todo en `/opt/escuela/`, sudo NOPASSWD | Prestarse, compartirse |
| **root** (emergencia) | Solo acceder en sobre cerrado | Usarse para trabajar |
| **auditor** (externo) | Leer logs, estado, contenedores | Modificar cualquier cosa |
| **desarrollador** | Script blindado para sus proyectos | Docker directo, sudo, otros usuarios |
| **operador delegado** | Comandos específicos según su rol | Escalar privilegios |

---

## 6. Preguntas frecuentes

**¿Puedo darle acceso root a alguien de confianza?**
No. Si esa persona se equivoca o actúa de mala fe, usted es responsable
solidario. En su lugar, créale un perfil específico con sudoers
restringido.

**¿Puedo compartir la clave de admin-institucional con varias personas?**
No. Cada persona debe tener su propio usuario. Si comparte la clave y
alguien comete un error, no sabrá quién fue.

**¿Qué pasa si el admin delegado borra los logs remotos?**
Los logs locales tienen `chattr +a` y no se pueden borrar. Además, el
envío remoto puede configurarse a un destino que el delegado no controle
(como un servicio en la nube o el servidor de la DGE).

**¿El sobre de emergencia es seguro?**
Sí, siempre que:
- El sobre esté firmado en el cierre por 2 directivos.
- Se guarde en un lugar seguro (caja fuerte, armario con llave).
- Se registre cada apertura en el libro de actas.
- Después de abrir, se genere una nueva contraseña y un nuevo sobre.
