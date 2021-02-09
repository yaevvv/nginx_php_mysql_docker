# nginx_php_mysql_docker
Testing was on Ubuntu, if necessary for Centos\Red Hat, then you only need 
to change the docker installation line in start.sh For universality, 
you can run the required command depending on the OS For example:
os=$(cat /etc/os-release | grep "^NAME" | awk -F = '{print $2}')
if [$os -eq "Ubuntu"]
then
.....
else
....
fi

Files are copied to any directory
Run start.sh
If docker & docker-compose is not installed - the script will download the data 
and install If everything is set - ignored.
NGinx & MySql installed from the DockerHub repository
PHP was compiled via Dockerfile (php.docker) - better all services
build for the project, compile the image only with the necessary data +
all pre-setting can be done at once
The nginx settings file (default.conf) - the site name did not register, you can test with any name
The www redirection is registered, but besides that, you also need to register a DNS record A (www.domain.name A IP)
Regarding access to MySQL - access is made only from the host
(in docker-compose.yml in port settings "127.0.0.1:3306:3306")
But all this can be adjusted either with local iptables or with SecurityGroup settings in aws (or another Cloud)

При заходе на http://IP/proxypage/wp.jpg - показывает ресурс
