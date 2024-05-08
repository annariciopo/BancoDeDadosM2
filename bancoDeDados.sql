CREATE TABLE users (
 id BIGSERIAL,
 name VARCHAR(60) NOT NULL DEFAULT 'NULL',
 email VARCHAR(50) NOT NULL DEFAULT 'NULL',
 password VARCHAR(20) NOT NULL DEFAULT 'NULL',
 cpf INTEGER(11) NOT NULL,
 birth DATE NOT NULL DEFAULT 'NULL',
 role VARCHAR(20) NOT NULL DEFAULT 'NULL'
);


ALTER TABLE users ADD CONSTRAINT users_pkey PRIMARY KEY (id);

CREATE TABLE lines (
 id BIGSERIAL,
 id_users INTEGER,
 production_line VARCHAR(20) NOT NULL DEFAULT 'NULL'
);


ALTER TABLE lines ADD CONSTRAINT lines_pkey PRIMARY KEY (id);

CREATE TABLE materials (
 id BIGSERIAL,
 type VARCHAR(20) NOT NULL DEFAULT 'NULL',
 title VARCHAR(60) NOT NULL DEFAULT 'NULL'
);


ALTER TABLE materials ADD CONSTRAINT materials_pkey PRIMARY KEY (id);

CREATE TABLE products (
 id BIGSERIAL,
 name VARCHAR(80) NOT NULL DEFAULT 'NULL',
 type VARCHAR(50) NOT NULL DEFAULT 'NULL',
 registration_number VARCHAR NOT NULL DEFAULT 'NULL'
);


ALTER TABLE products ADD CONSTRAINT products_pkey PRIMARY KEY (id);

CREATE TABLE infos (
 id BIGSERIAL,
 description VARCHAR NOT NULL DEFAULT 'NULL',
 version VARCHAR(10) NOT NULL DEFAULT 'NULL'
);


ALTER TABLE infos ADD CONSTRAINT infos_pkey PRIMARY KEY (id);

CREATE TABLE handbooks (
 id BIGSERIAL,
 id_infos INTEGER,
 id_product INTEGER,
 id_materials INTEGER,
 read BOOLEAN NOT NULL DEFAULT 'NULL'
);


ALTER TABLE handbooks ADD CONSTRAINT handbooks_pkey PRIMARY KEY (id);

CREATE TABLE lines_handbooks (
 id BIGSERIAL,
 id_lines INTEGER,
 id_handbooks INTEGER
);


ALTER TABLE lines_handbooks ADD CONSTRAINT lines_handbooks_pkey PRIMARY KEY (id);

ALTER TABLE lines ADD CONSTRAINT lines_id_users_fkey FOREIGN KEY (id_users) REFERENCES users(id);
ALTER TABLE handbooks ADD CONSTRAINT handbooks_id_infos_fkey FOREIGN KEY (id_infos) REFERENCES infos(id);
ALTER TABLE handbooks ADD CONSTRAINT handbooks_id_product_fkey FOREIGN KEY (id_product) REFERENCES products(id);
ALTER TABLE handbooks ADD CONSTRAINT handbooks_id_materials_fkey FOREIGN KEY (id_materials) REFERENCES materials(id);
ALTER TABLE lines_handbooks ADD CONSTRAINT lines_handbooks_id_lines_fkey FOREIGN KEY (id_lines) REFERENCES lines(id);
ALTER TABLE lines_handbooks ADD CONSTRAINT lines_handbooks_id_handbooks_fkey FOREIGN KEY (id_handbooks) REFERENCES handbooks(id);