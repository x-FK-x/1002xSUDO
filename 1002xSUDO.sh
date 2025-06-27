#!/bin/bash

ALIAS_FILE="/etc/profile.d/sudo_aliases.sh"

# Prüfen, ob Benutzer sudo verwenden darf
if ! sudo -v 2>/dev/null; then
    echo "[ERROR] You do not have sudo privileges. Exiting."
    exit 1
fi

# Mit Root-Rechten weitermachen
sudo bash -c "cat > '$ALIAS_FILE'" <<'EOF'
# GLOBAL SUDO ALIASES FOR ALL USERS

# SYSTEM
alias POWEROFF='sudo poweroff'
alias REBOOT='sudo reboot'
alias SHUTDOWN='sudo shutdown now'
alias UPDATE='sudo apt update && sudo apt upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y'
alias UPGRADE='sudo apt full-upgrade'
alias INSTALL='sudo apt install'
alias REMOVE='sudo apt remove --purge'
alias AUTOREMOVE='sudo apt autoremove'
alias APTSEARCH='sudo apt search'
alias ADDUSER='sudo adduser'

# FILESYSTEM / TOOLS
alias SYSTEMCTL='sudo systemctl'
alias JOURNALCTL='sudo journalctl'
alias MOUNT='sudo mount'
alias UMOUNT='sudo umount'
alias NANO='sudo nano'
alias RM='sudo rm -i'
alias CP='sudo cp -i'
alias MV='sudo mv -i'
alias CHMOD='sudo chmod'
alias CHOWN='sudo chown'

# NETWORK / FIREWALL
alias PING='ping -c 4'
alias IP='ip a'
alias IFCONFIG='sudo ifconfig'
alias NETSTAT='sudo netstat -tulpen'

# UFW FIREWALL
alias UFWENABLE='sudo ufw enable'
alias UFWDISABLE='sudo ufw disable'
alias UFWSTATUS='sudo ufw status verbose'
alias UFWALLOW='sudo ufw allow'
alias UFWDENY='sudo ufw deny'
alias UFWDELETE='sudo ufw delete allow'

# APACHE SERVER
alias APACHESTART='sudo systemctl start apache2'
alias APACHESTOP='sudo systemctl stop apache2'
alias APACHERESTART='sudo systemctl restart apache2'
alias APACHESTATUS='sudo systemctl status apache2'

# NGINX SERVER
alias NGINXSTART='sudo systemctl start nginx'
alias NGINXSTOP='sudo systemctl stop nginx'
alias NGINXRESTART='sudo systemctl restart nginx'
alias NGINXSTATUS='sudo systemctl status nginx'


# KALI / SECURITY TOOLS
alias WIRESHARK='sudo wireshark'
alias NMAP='sudo nmap'
alias HYDRA='hydra'
alias JOHN='john'
alias AIRMON='sudo airmon-ng'
alias AIRDUMP='sudo airodump-ng'
alias AIRCRACK='sudo aircrack-ng'
alias SQLMAP='sqlmap'
alias METASPLOIT='sudo msfconsole'
alias BURP='burpsuite'
alias NIKTO='nikto'
alias FEROX='feroxbuster'
alias ENUM4LINUX='enum4linux'
EOF

# Berechtigungen setzen
sudo chmod 644 "$ALIAS_FILE"

echo "[DONE] Global SUDO aliases written to $ALIAS_FILE"
