CREATE TABLE IF NOT EXISTS Establishment (
  establishment_id INT(6) NOT NULL,
  establishment_name VARCHAR(45) NOT NULL,
  establishment_loc VARCHAR(45) NOT NULL,
  PRIMARY KEY (establishment_id));
 
CREATE TABLE IF NOT EXISTS Drink (
  drink_id INT NOT NULL,
  drink_name VARCHAR(45) NOT NULL,
  establishment_id INT(6) NOT NULL,
  drink_price VARCHAR(45) NOT NULL,
  PRIMARY KEY (drink_id),
  FOREIGN KEY (establishment_id) References Establishment(establishment_id));

CREATE TABLE IF NOT EXISTS Common_Drink (
  common_drink_id INT(6) NOT NULL,
  common_drink_name VARCHAR(45) NOT NULL,
  common_drink_price VARCHAR(45) NOT NULL,
  alc_content_abv INT(2) NULL,
  PRIMARY KEY (common_drink_id));
 
CREATE TABLE IF NOT EXISTS Dietary_Restriction (
  diet_id INT(6) NOT NULL,
  diet_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (diet_id));
 
CREATE TABLE IF NOT EXISTS Common_Drink_has_Diet(
  common_drink_id INT(6) NOT NULL,
  diet_id INT(6) NOT NULL,
  PRIMARY KEY (common_drink_id, diet_id),
  FOREIGN KEY (common_drink_id) References Common_Drink(common_drink_id),
  FOREIGN KEY (diet_id) References Dietary_Restriction(diet_id));
 
 CREATE TABLE IF NOT EXISTS Drink_has_Diet (
  drink_id INT(6) NOT NULL,
  diet_id int(6) NOT NULL,
  PRIMARY KEY (drink_id, diet_id),
  FOREIGN KEY (drink_id) References Drink(drink_id),
  FOREIGN KEY (diet_id) References Dietary_Restriction(diet_id));

CREATE TABLE IF NOT EXISTS Drink_Attribute (
  drink_att_id INT(6) NOT NULL,
  drink_att VARCHAR(45) NOT NULL,
  PRIMARY KEY (drink_att_id));

-- switched
CREATE TABLE IF NOT EXISTS Drink_has_Att (
  drink_id INT(6) NOT NULL,
  drink_att_id INT(6) NOT NULL,
  PRIMARY KEY (drink_att_id, drink_id),
  FOREIGN KEY (drink_id) References Drink(drink_id),
  FOREIGN KEY (drink_att_id) References Drink_Attribute(drink_att_id));


CREATE TABLE IF NOT EXISTS Common_Drink_has_Att (
  common_drink_id INT(6) NOT NULL,
  drink_att_id INT(6) NOT NULL,
  PRIMARY KEY (common_drink_id, drink_att_id),
  FOREIGN KEY (drink_att_id) References Drink_Attribute(drink_att_id),
  FOREIGN KEY (common_drink_id) References Common_Drink(common_drink_id));
