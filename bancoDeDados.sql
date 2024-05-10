CREATE TABLE users (
 id BIGSERIAL,
 names VARCHAR(70) NOT NULL DEFAULT 'NULL',
 emails VARCHAR(50) NOT NULL DEFAULT 'NULL',
 passwords VARCHAR(30) NOT NULL DEFAULT 'NULL',
 cpf INTEGER(11) NOT NULL,
 births DATE NOT NULL DEFAULT 'NULL',
 role TEXT(15) NOT NULL DEFAULT 'NULL'
);


ALTER TABLE users ADD CONSTRAINT users_pkey PRIMARY KEY (id);

CREATE TABLE production_lines (
 id BIGSERIAL,
 lines VARCHAR(20) NOT NULL DEFAULT 'NULL',
 id_users INTEGER
);


ALTER TABLE production_lines ADD CONSTRAINT production_lines_pkey PRIMARY KEY (id);

CREATE TABLE handbooks (
 id BIGSERIAL,
 titles VARCHAR NOT NULL DEFAULT 'NULL',
 read BOOLEAN NOT NULL DEFAULT 'NULL',
 versions BIGINT(10) NOT NULL,
 important BOOLEAN NOT NULL DEFAULT 'NULL',
 descriptions VARCHAR NOT NULL DEFAULT 'NULL',
 id_products INTEGER,
 id_materials INTEGER
);


ALTER TABLE handbooks ADD CONSTRAINT handbooks_pkey PRIMARY KEY (id);

CREATE TABLE products (
 id BIGSERIAL,
 names VARCHAR NOT NULL DEFAULT 'NULL',
 registration_numbers VARCHAR NOT NULL DEFAULT 'NULL',
 types VARCHAR NOT NULL DEFAULT 'NULL',
 products_lines VARCHAR NOT NULL DEFAULT 'NULL'
);


ALTER TABLE products ADD CONSTRAINT products_pkey PRIMARY KEY (id);

CREATE TABLE materials (
 id BIGSERIAL,
 titles VARCHAR NOT NULL DEFAULT 'NULL',
 contents VARCHAR NOT NULL DEFAULT 'NULL'
);


ALTER TABLE materials ADD CONSTRAINT materials_pkey PRIMARY KEY (id);

CREATE TABLE feedbacks (
 id BIGSERIAL,
 text VARCHAR NOT NULL DEFAULT 'NULL',
 id_handbooks INTEGER,
 id_users INTEGER
);


ALTER TABLE feedbacks ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);

CREATE TABLE production_lines_handbooks (
 id BIGSERIAL,
 id_handbooks INTEGER,
 id_production_lines INTEGER
);


ALTER TABLE production_lines_handbooks ADD CONSTRAINT production_lines_handbooks_pkey PRIMARY KEY (id);

ALTER TABLE production_lines ADD CONSTRAINT production_lines_id_users_fkey FOREIGN KEY (id_users) REFERENCES users(id);
ALTER TABLE handbooks ADD CONSTRAINT handbooks_id_products_fkey FOREIGN KEY (id_products) REFERENCES products(id);
ALTER TABLE handbooks ADD CONSTRAINT handbooks_id_materials_fkey FOREIGN KEY (id_materials) REFERENCES materials(id);
ALTER TABLE feedbacks ADD CONSTRAINT feedbacks_id_handbooks_fkey FOREIGN KEY (id_handbooks) REFERENCES handbooks(id);
ALTER TABLE feedbacks ADD CONSTRAINT feedbacks_id_users_fkey FOREIGN KEY (id_users) REFERENCES users(id);
ALTER TABLE production_lines_handbooks ADD CONSTRAINT production_lines_handbooks_id_handbooks_fkey FOREIGN KEY (id_handbooks) REFERENCES handbooks(id);
ALTER TABLE production_lines_handbooks ADD CONSTRAINT production_lines_handbooks_id_production_lines_fkey FOREIGN KEY (id_production_lines) REFERENCES production_lines(id);