if systemctl status nginx | grep -q "active (running)" 
then
echo Nginx is already running 
else
sudo systemctl start nginx echo "Nginx service started"
fi
