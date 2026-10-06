USE biblioteca

-- Deleção de registros com DELETE

SELECT id_assunto, nome_assunto
FROM assunto
WHERE id_assunto = 8;

DELETE FROM assunto
WHERE id_assunto = 8;

SELECT * FROM assunto;

-- Atualizando registros de uma tabela