-- Backup de banco de dados

USE biblioteca;

BACKUP DATABASE biblioteca
TO DISK = 'C:\SQL\backup_biblioteca.bak'
WITH CHECKSUM, STATS = 10;

RESTORE VERIFYONLY
FROM DISK = 'C:\SQL\backup_biblioteca.bak';

BACKUP DATABASE biblioteca
TO DISK = 'C:\SQL\backup_biblioteca.bak'
WITH DIFFERENTIAL, CHECKSUM, STATS = 10;


-- Backup de logs de transações *Não funciona no modelo simples de recuperação

BACKUP LOG biblioteca
TO DISK = 'C:\SQL\backup_biblioteca_log.trn'
WITH CHECKSUM, STATS = 10;


-- Restauração de backup

RESTORE FILELISTONLY
FROM DISK = 'C:\SQL\backup_biblioteca.bak';

RESTORE DATABASE biblioteca_restored
FROM DISK = 'C:\SQL\backup_biblioteca.bak'
WITH
	MOVE 'biblioteca' TO 'C:\SQL\biblioteca_restored.mdf',
	MOVE 'biblioteca_log' TO 'C:\SQL\biblioteca_restored_log.ldf',
	RECOVERY,
	STATS = 10;