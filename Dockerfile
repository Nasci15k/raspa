FROM php:8.2-cli

RUN apt-get update && apt-get install -y unzip sqlite3 libsqlite3-dev     && docker-php-ext-install pdo_sqlite

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
