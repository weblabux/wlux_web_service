--
-- creates the account: db_test
--             password: WeCantDecide2    
-- and gives CRUD access to the wlux_services database on the localhost
--
GRANT USAGE ON *.* TO 'db_test'@'%' IDENTIFIED BY PASSWORD '*30BCB77EBDCF3CA24E51D3ECB31432C0A507F761';
GRANT ALL PRIVILEGES ON `db\_test`.* TO 'db_test'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `wlux\_services`.* TO 'db_test'@'%';

