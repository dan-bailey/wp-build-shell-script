# create database, user, and pass
echo "MySQL/MariaDB configuration..."
echo "MySQL/MariaDB Credentials:"
read -p "Database root user: " dbroot
read -p "Database root pass: " dbrootpass
echo "Creating Database for WP..."
read -p "Database name? " dbname
read -p "Database user? " dbuser
read -p "Database password? " dbpass
mysql --user="$dbroot" --password="$dbrootpass" --execute="CREATE DATABASE ${dbname};CREATE USER '${dbuser}'@'localhost' IDENTIFIED BY '$dbpass';GRANT ALL PRIVILEGES ON ${dbname}.* TO '${dbuser}'@'localhost';FLUSH PRIVILEGES;"

echo "Downloading Wordpress core..."
wp core download
wp core config --dbname=${dbname} --dbuser=${dbuser} --dbpass=${dbpass}
read -p "Site URL: " $siteurl
read -p "Blog Title: " $blogtitle
read -p "Admin Username: " $auser
read -p "Admin Password: " $apass
read -p "Admin Email: " $aemail
echo "Completing Wordpress install..."
wp core install --url=${siteurl} --title=${blogtitle} --admin_user=${auser} --admin_password=s${apass} --admin_email=${aemail}