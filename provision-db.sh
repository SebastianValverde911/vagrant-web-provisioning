#debes completar este archivo con los comandos necesarios para provisionar la base de datos
#!/usr/bin/env bash

# Actualizar paquetes
sudo apt-get update -y

# Instalar PostgreSQL
sudo apt-get install -y postgresql postgresql-contrib

# Iniciar el servicio
sudo systemctl enable postgresql
sudo systemctl start postgresql

# Crear base de datos, usuario y tabla
sudo -u postgres psql <<EOF
-- Crear base de datos
CREATE DATABASE empresa;

-- Crear usuario con contraseña
CREATE USER vagrant WITH PASSWORD 'vagrant';

-- Dar permisos al usuario sobre la base de datos
GRANT ALL PRIVILEGES ON DATABASE empresa TO vagrant;
EOF

# Crear una tabla de ejemplo
sudo -u postgres psql -d empresa <<EOF
CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    cargo VARCHAR(100),
    salario NUMERIC(10,2)
);

INSERT INTO empleados (nombre, cargo, salario) VALUES
('Juan Pérez', 'Desarrollador', 2500.00),
('María Gómez', 'Diseñadora', 2200.00),
('Carlos Ruiz', 'Administrador', 2700.00);
EOF
