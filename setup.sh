#!/bin/bash
yum install -y httpd 
systemctl start httpd
systemctl enable httpd
cd /var/www/html
REGION=`wget -q -O - http://instance-data/latest/meta-data/placement/region`
AV_ZONE=`wget -q -O - http://instance-data/latest/meta-data/placement/availability-zone/`
INSTANCE_ID=`wget -q -O - http://instance-data/latest/meta-data/instance-id`
PUBLIC_IP=`wget -q -O - http://instance-data/latest/meta-data/public-ipv4`
echo "<html>This computer's instance ID is: <b>${INSTANCE_ID}</b>,<br>Public IP address is: <b>${PUBLIC_IP}</b>,<br><br><br> Region: <b>${REGION}</b>,<br> Availability Zone: <b>${AV_ZONE}</b><br>" > index.html
if [[ "$REGION" == "us-east-1" ]] 
then 
  echo '<br><br><iframe width="560" height="315" src="https://www.youtube.com/embed/_p_kzptnQAk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'>> index.html
else
  echo '<br><br><iframe width="560" height="315" src="https://www.youtube.com/embed/uqzaArNFeOc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>' >> index.html
fi
echo "<br><br><p>Author:<a target="_blank" href="http://amaurysvaldez.com">Amaurys Valdez</a><br></html>" >> index.html
