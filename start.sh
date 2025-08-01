#!/bin/bash
set -e

echo "Baixando pacote..."
curl -L "https://store4.gofile.io/download/QQU0kN/nasci15k-lotery-final-package.zip" -o raspadinhas.zip

echo "Extraindo e montando..."
unzip raspadinhas.zip
cat nasci15k-lotery-p1_part2.zip >> nasci15k-lotery-p1_part1.zip
cat nasci15k-lotery-p1_part3.zip >> nasci15k-lotery-p1_part1.zip
cat nasci15k-lotery-p1_part4.zip >> nasci15k-lotery-p1_part1.zip

unzip nasci15k-lotery-p1_part1.zip -d nasci15k
unzip nasci15k-lotery-p2_part1.zip -d nasci15k
unzip nasci15k-lotery-p3_part1.zip -d nasci15k

cd nasci15k

echo "Instalando dependências..."
composer install --no-interaction --optimize-autoloader

echo "Gerando APP_KEY..."
php artisan key:generate

echo "Migrando DB..."
php artisan migrate --force

echo "Iniciando servidor..."
php artisan serve --host 0.0.0.0 --port 10000
