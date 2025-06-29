-- Table Creation and Data Import
DROP TABLE manufacturers;
CREATE TABLE manufacturers (
  id VARCHAR(50) PRIMARY KEY,
  address TEXT,
  comment TEXT,
  name VARCHAR(255) NOT NULL,
  parent_company longtext,
  representative VARCHAR(255),
  slug LONGTEXT,
  source VARCHAR(100),
  created_at VARCHAR(255),
  updated_at VARCHAR(255),
  created_at_UTC Datetime,
  updated_at_UTC Datetime
);
SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\manufacturers_final_cleaned.csv'
INTO TABLE manufacturers
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
