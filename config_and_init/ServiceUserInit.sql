-- Create the account that the web service code uses to interact with the database
-- Run this from the root account of the database

GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO 'db_test'@'localhost'
IDENTIFIED BY PASSWORD '*30BCB77EBDCF3CA24E51D3ECB31432C0A507F761';

GRANT ALL PRIVILEGES ON `db\_test`.* TO 'db_test'@'localhost';