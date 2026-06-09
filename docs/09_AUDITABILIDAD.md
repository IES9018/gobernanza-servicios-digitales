# Guía Técnica de Auditoría — IES 9-018

**Versión:** 1.0 — Junio 2026
**Documento relacionado:** `12_TRANSPARENCIA_COMUNITARIA.md` (política de transparencia y derecho de auditoría)

---

Este documento describe las **herramientas técnicas** instaladas en el
servidor para garantizar la auditabilidad. La **política institucional**
de transparencia (qué se audita, quién puede solicitarlo, cómo se
publican los resultados) está en el documento `12_TRANSPARENCIA_COMUNITARIA.md`.

---

## 1. Principios

| Principio | Cómo se cumple |
|-----------|---------------|
| **Trazabilidad** | Todo evento relevante queda registrado en logs inalterables |
| **Acceso controlado** | Existe un usuario `auditor` con permisos exclusivamente de lectura |
| **Sin puntos ciegos** | No hay comandos que puedan ejecutarse sin dejar rastro |
| **Disponibilidad** | Los logs se almacenan localmente y rotan automáticamente |
| **Independencia** | El usuario auditor es distinto del admin, no comparte credenciales |

> La política de transparencia (qué información es pública, quién puede
> auditar, cómo solicitar una auditoría) está documentada en
> `12_TRANSPARENCIA_COMUNITARIA.md`. Este documento se limita a la guía
> técnica de implementación.

---

## 2. Usuario auditor (read-only)

El servidor cuenta con un usuario `auditor` que solo puede ejecutar comandos
de inspección y consulta.

### Qué puede hacer

```bash
# Conectarse
ssh -i <clave_auditor> auditor@&lt;ip-del-servidor&gt;

# Ya adentro — comandos disponibles:

  docker ps                    # listar contenedores activos
  docker stats --no-stream     # ver consumo de recursos en vivo
  docker logs <contenedor>     # ver logs de una aplicación
  docker inspect <contenedor>  # ver configuración detallada

  journalctl -u sshd -n 50     # últimos 50 intentos de conexión SSH
  journalctl --since "1 hour ago"  # eventos de la última hora

  auditctl -l                  # listar reglas de auditoría activas
  ausearch -k docker_commands  # buscar eventos de Docker auditados
  aureport --start today       # resumen de actividad del día

  systemctl status --all       # estado de todos los servicios
  systemctl list-dependencies  # dependencias de servicios

  tailscale status             # ver nodos conectados a la red interna
  ss -tlnp                     # ver puertos abiertos en el servidor
  df -h                        # ver uso de disco
  free -h                      # ver uso de memoria
  uptime                       # ver tiempo de actividad
```

### Qué NO puede hacer

| Acción | Bloqueado por |
|--------|---------------|
| Crear/modificar usuarios | sudoers restrictivo |
| Iniciar/detener contenedores | fuera del grupo docker |
| Modificar archivos del sistema | permisos de archivo |
| Ejecutar como root | sudoers restrictivo |
| Acceder a claves privadas | permisos de archivo |
| Eliminar logs de auditoría | solo root |

### Cómo solicitar acceso

1. El solicitante debe enviar su **clave pública SSH** (ed25519 o RSA) al
   administrador técnico del servidor.
2. El admin la agrega a `/home/auditor/.ssh/authorized_keys`.
3. El solicitante se conecta con:
   ```bash
   ssh -i <su_clave_privada> auditor@&lt;ip-del-servidor&gt;
   ```
4. Cada acceso queda registrado en `journalctl` y `auditd` con la huella
   de la llave utilizada (trazabilidad individual).

Para solicitar acceso, contactar al **Consejo Directivo del IES 9-018**,
que derivará la solicitud al administrador técnico.

---

## 3. Herramientas de auditoría instaladas

### 3.1 auditd — Sistema de auditoría del kernel

Registra cada evento del sistema a nivel de kernel: ejecución de comandos,
cambios en archivos, accesos SSH, etc.

```bash
# Comandos útiles
sudo auditctl -l                    # listar reglas activas
sudo ausearch -k user_changes       # buscar cambios de usuarios
sudo ausearch -k docker_commands    # buscar ejecución de Docker
sudo ausearch -k root_commands      # buscar comandos ejecutados como root
sudo aureport --start today --summary  # resumen del día
```

**Reglas configuradas** (archivo: `/etc/audit/rules.d/custom.rules`):

| Regla | Monitorea |
|-------|-----------|
| `sudoers_changes` | Modificaciones a sudoers |
| `root_commands` | Comandos ejecutados como root |
| `docker_commands` | Ejecución de Docker y Docker Compose |
| `user_changes` | Creación/eliminación/modificación de usuarios |
| `ssh_changes` | Cambios en configuración SSH |
| `network_changes` | Cambios en red (interfaces, DNS, hosts) |
| `package_changes` | Instalación/eliminación de paquetes |
| `escuela_config` | Cambios en `/opt/escuela/` |
| `systemd_changes` | Cambios en servicios systemd |
| `cloudflared_config` | Cambios en configuración Cloudflare Tunnel |
| `firewall_changes` | Cambios en reglas de firewall |

### 3.2 journald (systemd-journald) — Registro central del sistema

Almacena logs de todos los servicios, aplicaciones y el kernel en un formato
estructurado y consultable.

```bash
# Consultas útiles
journalctl -u sshd                      # logs del servicio SSH
journalctl -u docker                    # logs del servicio Docker
journalctl -u cloudflared               # logs del tunnel Cloudflare
journalctl --since "2026-06-09 00:00" --until "2026-06-09 23:59"  # rango de fecha
journalctl -p err -b                    # errores desde el último arranque
journalctl -n 100                       # últimos 100 eventos
```

### 3.3 fail2ban — Prevención de intrusiones

Bloquea automáticamente IPs que intenten acceder por SSH con contraseñas
incorrectas repetidas veces.

```bash
# Consultas útiles
sudo fail2ban-client status sshd        # ver IPs bloqueadas actualmente
sudo fail2ban-client status             # ver todas las cárceles activas
sudo zgrep -c "Ban" /var/log/fail2ban.log  # total de bloqueos históricos
```

### 3.4 Docker — Logs de aplicaciones

Cada contenedor genera logs que pueden consultarse sin necesidad de acceder
al interior del contenedor.

```bash
docker logs <nombre_contenedor>          # logs completos
docker logs --tail 50 <contenedor>       # últimas 50 líneas
docker logs --since 5m <contenedor>      # últimos 5 minutos
docker stats --no-stream                 # uso de recursos en vivo
docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'  # todos los contenedores
```

### 3.5 Server Bitácora — Monitoreo operativo automatizado

Script que toma una instantánea del estado del servidor cada 5 minutos y
registra eventos de arranque, apagado y cambios de estado.

```bash
# Ver instantáneas
cat /var/log/server-bitacora/estado.log
cat /var/log/server-bitacora/eventos.log
```

**Qué monitorea:**

- Estado de servicios críticos (SSH, Docker, Tailscale)
- Disponibilidad de internet (DNS, gateway, HTTP)
- Uso de disco en particiones críticas
- Intentos de autenticación fallidos y exitosos
- Eventos de temperatura de CPU
- Arranques y apagados del servidor

### 3.6 Tailscale — Red privada administrada

Registra qué dispositivos están conectados a la red privada del servidor,
qué rutas están anunciadas y permite auditar accesos remotos.

```bash
tailscale status            # ver dispositivos conectados
tailscale ping <host>       # verificar conectividad
```

---

## 4. Ubicación de los logs

| Log | Ruta | Retención |
|-----|------|-----------|
| Auditoría del kernel | `/var/log/audit/audit.log` | Rotación mensual |
| Sistema (journald) | `/var/log/journal/` | 1 GB máx, 2 semanas |
| Servidor bitácora | `/var/log/server-bitacora/` | Rotación semanal |
| Aplicaciones (Docker) | `docker logs <contenedor>` | Depende del contenedor |
| Intentos de acceso SSH | `journalctl -u sshd` | Mismo que journald |
| Temperatura CPU | `/var/log/thermal-monitor.log` | Rotación semanal |
| Fail2ban | `/var/log/fail2ban.log` | Rotación mensual |

---

## 5. Procedimiento para una auditoría externa

### Día 1 — Solicitud

El interesado envía al Consejo Directivo del IES 9-018:
- Nombre y organización
- Motivación de la auditoría
- Clave pública SSH (ed25519)

### Día 2 — Habilitación

El admin técnico:
1. Agrega la clave pública al usuario `auditor`.
2. Envía al interesado la IP y puerto de conexión.
3. Confirma que el acceso está activo.

### Día 3 — Auditoría

El auditor se conecta y ejecuta los comandos de inspección necesarios.
Todos sus comandos quedan registrados en `auditd`.

### Día 4 — Cierre

El admin revoca el acceso eliminando la clave pública del usuario `auditor`.
El auditor recibe un resumen de los accesos realizados.

---

## 6. Preguntas frecuentes

**¿Puede un auditor modificar algo?**
No. El usuario `auditor` no tiene permisos de escritura en ningún directorio
crítico, no está en el grupo `docker` ni en el grupo `sudo`, y su acceso
está restringido por reglas de sudoers que solo permiten comandos de lectura.

**¿Queda registro de lo que hace el auditor?**
Sí. Cada comando ejecutado por el auditor queda registrado en `auditd` con
la etiqueta `auditor_activity` y también en `journalctl`.

**¿Puede el auditor ver logs de otros usuarios?**
Sí, puede leer logs del sistema. Pero no puede modificar logs ni borrarlos.
Los logs de auditoría (`/var/log/audit/`) solo son accesibles por root.

**¿Qué pasa si el auditor intenta ejecutar un comando no permitido?**
El sistema lo rechaza y el intento queda registrado en `auditd` y
`journalctl` como evento de seguridad.

**¿Cuánto duran los logs?**
Los logs de auditoría del kernel rotan mensualmente. Los logs del sistema
(journald) están limitados a 1 GB. Los logs de aplicaciones dependen de
la configuración de cada contenedor.

---

## 9. Documentos relacionados

| Documento | Relación |
|-----------|----------|
| `12_TRANSPARENCIA_COMUNITARIA.md` | Política de transparencia: qué se audita, quién puede solicitarlo, cómo se publican los resultados |
| `07_SOLICITUD_USUARIO.md` | Perfil Auditor: cómo solicitar acceso, alcance de permisos |
| `11_EMERGENCIA_Y_CONTROL.md` | Protección de logs contra eliminación, blindaje del sistema de auditoría |
