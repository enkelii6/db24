CREATE DATABASE lab1;

CREATE TABLE clients(
    client_id SERIAL,
    first_name VARCHAR(60),
    last_name VARCHAR(60),
    email VARCHAR(100),
    date_joined TIMESTAMP default current_timestamp
);

ALTER TABLE clients ADD COLUMN status INTEGER CHECK ( status = 1 OR status = 0 );

ALTER TABLE clients DROP CONSTRAINT clients_status_check,
ALTER COLUMN status TYPE boolean USING CASE WHEN status = 0 then FALSE WHEN status = 1 then TRUE
    else FALSE END;

ALTER TABLE clients ALTER column status SET DEFAULT TRUE;

ALTER TABLE clients ADD primary key (client_id);

CREATE TABLE orders(
    order_id serial,
    order_name varchar(100),
    client_id integer,
    foreign key (client_id) REFERENCES clients(client_id)
);

DROP TABLE orders;

DROP database lab1;
