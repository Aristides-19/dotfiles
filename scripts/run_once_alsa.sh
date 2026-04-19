echo "Adding Alsamixer settings..."

sudo mkdir -p /etc/systemd/system/alsa-restore.service.d/

sudo cp "$HOME/.local/share/chezmoi/scripts/assets/alsa/asound.state" /var/lib/alsa/asound.state
sudo cp "$HOME/.local/share/chezmoi/scripts/assets/alsa/alsa-fix.conf" /etc/systemd/system/alsa-restore.service.d/override.conf

sudo systemctl daemon-reload
sudo systemctl enable --now alsa-restore
sudo systemctl restart alsa-restore

sudo alsactl store
echo "Alsamixer settings applied!"