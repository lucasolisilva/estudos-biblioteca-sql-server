USE biblioteca;

INSERT INTO assunto(nome_assunto)
VALUES
	('Ficção Científica'), ('Botânica'),
	('Eletrônica'), ('Matemática'),
	('Aventura'), ('Romance'),
	('Finanças'), ('Gastronomia'),
	('Terror'), ('Administração'),
	('Informática'), ('Suspense');

INSERT INTO editora(nome_editora)
VALUES
	('Aleph'), ('Microsoft Press'),
	('Wiley'), ('HarperCollins'),
	('Érica'), ('Novatec'),
	('McGraw-Hill'), ('Apress'),
	('Francisco Alves'), ('Sybex'),
	('Globo'), ('Companhia das Letras'),
	('Morro Branco'), ('Penguin Books'), ('Martin Claret'),
	('Record'), ('Springer'), ('Melhoramentos'),
	('Oxford'), ('Taschen'), ('Ediouro'), ('Bookman');

INSERT INTO autor(nome_autor, sobrenome_autor)
VALUES
	('Humberto', 'Eco'), ('Daniel', 'Barret'), ('Gerald', 'Carter'), ('Mark', 'Sobell'),
	('William', 'Stanek'), ('Christine', 'Bresnahan'), ('William', 'Gibson'),
	('James', 'Joyce'), ('John', 'Emsley'), ('José', 'Saramago'),
	('Richard', 'Silverman'), ('Robert', 'Byrnes'), ('Jay', 'Ts'),
	('Robert', 'Eckstein'), ('Paul', 'Horowitz'), ('Winfield', 'Hill'),
	('Joel', 'Murach'), ('Paul', 'Scherz'), ('Simon', 'Monk'),
	('George', 'Orwell'), ('Ítalo', 'Calvino'), ('Machado', 'de Assis'),
	('Oliver', 'Sacks'), ('Ray', 'Bradbury'), ('Walter', 'Isaacson'),
	('Benjamin', 'Graham'), ('Júlio', 'Verne'), ('Marcelo', 'Gleiser'),
	('Harri', 'Lorenzi'), ('Humphrey', 'Carpenter'), ('Isaac', 'Asimov'),
	('Aldous', 'Huxley'), ('Arthur', 'Conan Doyle'), ('Blaise', 'Pascal'),
	('Jostein', 'Gaarder'), ('Stephen', 'Hawking'), ('Stephen', 'Jay Gould'),
	('Neil', 'De Grasse Tyson'), ('Charles', 'Darwin'), ('Alan', 'Turing'),('Arthur', 'C. Clarke');

INSERT INTO livro(nome_livro, isbn13, data_pub, preco_livro, numero_paginas, id_assunto, id_editora)
VALUES
	('A Arte da Eletrônica', '9788582604342', '20170308', 300.74,  1160, 3, 24);

INSERT INTO livro(nome_livro, isbn13, data_pub, preco_livro, numero_paginas, id_assunto, id_editora)
VALUES
	('Vinte Mil Léguas Submarinas', '9788582850022', '2014-09-16', 24.50, 448, 1, 16),
	('O Investidor Inteligente', '9788595080805', '2016-01-25', 79.90, 450, 7, 6);


-- Inserir dados em lote com OPENROWSET(BULK) a partir de arquivo CSV

INSERT INTO livro (nome_livro, isbn13, data_pub, preco_livro, numero_paginas, id_editora, id_assunto)
SELECT 
     NomeLivro, ISBN13, DataPub, PrecoLivro, NumeroPaginas,
	 IdEditora, IdAssunto
FROM OPENROWSET(
    BULK 'C:\SQL\Livros.CSV',
    FORMATFILE = 'C:\SQL\Formato.xml',
	CODEPAGE = '65001',  -- UTF-8
	FIRSTROW = 2
) AS livros_csv;


INSERT INTO livro_autor(id_livro, id_autor)
VALUES
	(100,15),(100,16),(101,27),(102,26),
	(103,41),(104,24),(105,32),(106,20),
	(107,27),(108,1),(109,22),(110,10),
	(111,21),(112,5),(113,10),(114,8),
	(115,18),(115,19),(116,31),(117,22);