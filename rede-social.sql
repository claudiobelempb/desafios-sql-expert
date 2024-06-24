SHOW datestyle;
SET datestyle = 'ISO, DMY';

/*creando banco de dados*/
CREATE DATABASE redesocial;

CREATE TABLE IF NOT EXISTS tb_usuario (
	id SERIAL NOT NULL,
	nome VARCHAR(32) NOT NULL,
	email VARCHAR(32) UNIQUE NOT NULL, 
	nascimento DATE, 
	website VARCHAR(32), 
	genero CHAR(1) NOT NULL, 
	telefone VARCHAR(12),
	foto_de_perfil_id VARCHAR(60)
);

ALTER TABLE tb_usuario ADD PRIMARY KEY(id);
ALTER TABLE tb_usuario ADD FOREIGN KEY(foto_de_perfil_id) REFERENCES tb_foto(uri);

CREATE TABLE tb_seguidores(
	seguidor_id INTEGER NOT NULL, 
	seguido_id INTEGER NOT NULL
);

ALTER TABLE tb_seguidores ADD PRIMARY KEY(seguidor_id, seguido_id);
ALTER TABLE tb_seguidores ADD FOREIGN KEY(seguidor_id) REFERENCES tb_usuario(id);
ALTER TABLE tb_seguidores ADD FOREIGN KEY(seguido_id) REFERENCES tb_usuario(id);

CREATE TABLE tb_postagem(
	id SERIAL NOT NULL,
	texto TEXT, 
	instante TIMESTAMP, 
	autor_id INTEGER NOT NULL
);

ALTER TABLE tb_postagem ADD PRIMARY KEY(id);
ALTER TABLE tb_postagem ADD FOREIGN KEY(autor_id) REFERENCES tb_usuario(id);

CREATE TABLE tb_album(
	id SERIAL NOT NULL, 
	titulo VARCHAR(32), 
	instante_de_postagem TIMESTAMP, 
	usuario_id INTEGER NOT NULL
);

ALTER TABLE tb_album ADD PRIMARY KEY(id);
ALTER TABLE tb_album ADD FOREIGN KEY(usuario_id) REFERENCES tb_usuario(id);

CREATE TABLE tb_foto(
	uri VARCHAR(60) NOT NULL, 
	instante_de_postagem TIMESTAMP NOT NULL, 
	postagem_id INTEGER, 
	usuario_id INTEGER NOT NULL, 
	album_id INTEGER NOT NULL
);

ALTER TABLE tb_foto ADD PRIMARY KEY(uri);
ALTER TABLE tb_foto ADD FOREIGN KEY(postagem_id) REFERENCES tb_postagem(id);
ALTER TABLE tb_foto ADD FOREIGN KEY(usuario_id) REFERENCES tb_usuario(id);
ALTER TABLE tb_foto ADD FOREIGN KEY(album_id) REFERENCES tb_album(id);

INSERT INTO tb_usuario(nome, email, nascimento, website, genero, telefone, foto_de_perfil_id) VALUES('João Silva', 'joao@gmail.com', '15-10-1091', NULL, 'M', NULL, NULL);
INSERT INTO tb_usuario(nome, email, nascimento, website, genero, telefone, foto_de_perfil_id) VALUES('Maria Alice', 'alice@gmail.com', '15-04-1099', 'youtube.com/alice', 'F', NULL, NULL);
INSERT INTO tb_usuario(nome, email, nascimento, website, genero, telefone, foto_de_perfil_id) VALUES('Carlos Alves', 'carlos@gmail.com', NULL, NULL, 'M', '99777-8383', NULL);
INSERT INTO tb_usuario(nome, email, nascimento, website, genero, telefone, foto_de_perfil_id) VALUES('Ana Clara', 'clara@gmail.com', '23-01-1097', 'blog.clara.com', 'F', '8818102820', NULL);

INSERT INTO tb_seguidores(seguidor_id, seguido_id)  VALUES(1, 3);
INSERT INTO tb_seguidores(seguidor_id, seguido_id)  VALUES(1, 4);
INSERT INTO tb_seguidores(seguidor_id, seguido_id)  VALUES(3, 4);
INSERT INTO tb_seguidores(seguidor_id, seguido_id)  VALUES(2, 4);

INSERT INTO tb_postagem(texto, instante, autor_id) VALUES('#partiu festa', TIMESTAMP WITH TIME ZONE '09-08-2017T19:34:20Z', 4);
INSERT INTO tb_postagem(texto, instante, autor_id) VALUES('Bom dia pessoal!', TIMESTAMP WITH TIME ZONE '10-08-2017T17:50:00Z', 4);

INSERT INTO tb_album(titulo, instante_de_postagem, usuario_id) VALUES('Fésta de verão', TIMESTAMP WITH TIME ZONE '13-01-2017T13:50:13Z', 3);

INSERT INTO tb_foto(uri, instante_de_postagem, postagem_id, usuario_id, album_id) VALUES('http://dominio.com/praia1.jpg', TIMESTAMP WITH TIME ZONE '10-01-2017T10:30:14Z', NULL, 3, 1);
INSERT INTO tb_foto(uri, instante_de_postagem, postagem_id, usuario_id, album_id) VALUES('http://dominio.com/praia2.jpg', TIMESTAMP WITH TIME ZONE '10-01-2017T10:31:12Z', NULL, 3, 1);