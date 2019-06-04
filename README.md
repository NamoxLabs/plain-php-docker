# Commands

## To Run Unit tests
code/vendor/bin/phpunit --bootstrap code/vendor/autoload.php --testdox ./tests

### Download compose phar
curl -s https://getcomposer.org/installer | php --

## Run docker build for automation testing
docker-compose -f docker-compose.test.yml -p ci build

## Run docker for automation testing
docker-compose -f docker-compose.test.yml -p ci up

## Run docker compose start and logs tail
docker-compose start && docker-compose logs -f

## Modify mysql users
docker-compose exec mysql bash
mysql -u root -p

### Modify user credentials
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';
ALTER USER 'default'@'%' IDENTIFIED WITH mysql_native_password BY 'secret';