FROM php:8.1-apache 

# Use the default production configuration
# RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

#curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -L -o "awscliv2.zip"; && \

# COPY src/ /var/www/html
RUN apt update && \
    apt install -y curl nano zip git && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer && \
    composer require aws/aws-sdk-php && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -L -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm awscliv2.zip