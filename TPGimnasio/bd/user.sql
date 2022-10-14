drop user if exists 'java'@'%';
create user 'java'@'%' identified by 'himitsu';
GRANT SELECT, INSERT, UPDATE, DELETE ON gimnasio.* TO 'java'@'%';