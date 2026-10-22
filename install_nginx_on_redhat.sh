 #!/bin/bash

sudo yum install nginx -y 

if [ $? -eq 0 ]
then
echo "Nginx installed successfully!"
else
echo "Nginx not installed successfully!"
fi
