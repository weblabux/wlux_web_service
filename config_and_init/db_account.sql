-- define the account used by the code to connect to the database

GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO 'db_test'@'localhost' IDENTIFIED BY PASSWORD '*30BCB77EBDCF3CA24E51D3ECB31432C0A507F761';

GRANT ALL PRIVILEGES ON `db\_test`.* TO 'db_test'@'localhost';
