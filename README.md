### APT
apt update  
apt upgrade  
apt full-upgrade -y  
apt install  

nano /etc/apt/sources.list.d/debian.sources  

```
Types: deb deb-src
URIs: https://deb.debian.org/debian
Suites: trixie trixie-updates
## If you want access to contrib and non-free components,
## add " contrib non-free" after "non-free-firmware"
Components: main non-free-firmware
Enabled: yes
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg

Types: deb deb-src
URIs: https://security.debian.org/debian-security
Suites: trixie-security
Components: main non-free-firmware
Enabled: yes
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
```

### SUDO
apt install sudo  
addusers sbeldjao sudo  

### Open SSH
apt install ssh  
sshd_config  
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.d/sshd_config_vm42.conf  
nano /etc/ssh/sshd_config.d/sshd_config_vm42.conf  

```
Port 4242
PermitRootLogin no
```
systemctl restart ssh  

### IP
ip address  

### UFW (Uncomplicated Firewall)
apt install ufw  
ufw status  
ufw status numbered  
sudo ufw enable  
ufw default deny incoming  
ufw default allow outgoing  
ufw allow 4242  
ufw deny 22  
ufw delete 2 4  

### SELinux
apt install selinux-basics selinux-policy-default auditd   *Installer SELinux*  
selinux-activate   *configure SELinux, modifie le boot, prépare les labels*  
sestatus   *Vérifier le statut*  
**Modes SELinux**  
 - enforcing   *bloque selon les règles*  
 - permissive   *log seulement*  
 - disabled   *désactivé*  

**Changer le mode temporairement**  
 - setenforce 0   *permissive*  
 - setenforce 1   *enforcing*  

nano /etc/selinux/config  
*Options possibles*  
 - SELINUX=enforcing  
 - SELINUX=permissive  
 - SELINUX=disabled  
```
SELINUX=enforcing
```
ls -Z   *Vérifier les contextes*  
restorecon -Rv /   *Réparer les contextes*  

### Groups
groupadd user42 --users sbeldjao  
newgrp user42  
groups  

### Reboot / Shutdown
reboot  
shutdown --poweroff

### Script
nano monitoring.sh
chmod +x monitoring.sh

```
#!/usr/bin/env bash

echo "Operating sytem :\n"
echo "Architecture : "
uname -m
echo "   Kernel : "
uname -s
echo "   Version : "
uname -r
echo "\n"

```


chage -l sbeldjao

which bash
