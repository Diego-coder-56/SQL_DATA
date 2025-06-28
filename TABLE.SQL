CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,  -- identificador único Llave primaria 
    name VARCHAR(100) NOT NULL,                -- nombre obligatorio id 
    email VARCHAR(30) NOT NULL UNIQUE,         -- email único obligatorio
    phone_number VARCHAR(15),                  -- teléfono opcional
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- fecha de creación
    modified_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP   -- fecha de modificación
);
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,   -- identificador único
    name VARCHAR(50) NOT NULL UNIQUE,            -- nombre de producto único
    slug VARCHAR(50) NOT NULL UNIQUE,            -- identificador web único
    description TEXT,                            -- descripción opcional
    price DOUBLE(8,2),                           -- precio con 2 decimales
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- fecha creación
    modified_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP  -- fecha modificación
);
CREATE TABLE bills (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,             -- id factura
    client_id INT NOT NULL,                             -- cliente asociado
    total INT NOT NULL,                                 -- total de la factura
    status ENUM('open', 'partial', 'paid', 'closed') NOT NULL DEFAULT 'open', -- estado de factura
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES clients(client_id) ON DELETE CASCADE  -- relación con clients
);
CREATE TABLE bill_products (
    bill_product_id INT AUTO_INCREMENT PRIMARY KEY,       -- id único
    product_id INT NOT NULL,                              -- referencia a producto
    bill_id INT NOT NULL,                                 -- referencia a factura
    quantity INT,                                         -- cantidad de producto
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE,
    FOREIGN KEY (bill_id) REFERENCES bills(bill_id) ON DELETE CASCADE
);

