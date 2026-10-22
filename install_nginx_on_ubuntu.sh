 #!/bin/bash

sudo apt install nginx -y 

if [ $? -eq 0 ]
then
echo "Nginx installed successfully!"
else
echo "Error: Nginx Installation failed." 
exit 1 
fi
