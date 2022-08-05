INSERT INTO Establishment VALUES
(1, 'Luna Rotisserie and Taproom', 'Carrboro'),
(2, 'Sup Dogs', 'Chapel Hill'),
(3, 'Linda''s Bar & Grill', 'Chapel Hill');

INSERT INTO Common_Drink VALUES
(1, 'Heineken', 4.5, 5),
(2, 'Merlot', 17, 13),
(3, 'Pinot Grigio', 6, 13),
(4, 'Miller Lite', 3.5, 4.2),
(5, 'Rum & Coke', 6, 12);

INSERT INTO Drink VALUES
(1, 'Orange Sup Crush', 2, 7),
(2, 'Grapefruit Sup Crush', 2, 7),
(3, 'Linda''s 76', 3, 10),
(4, 'Mango Margarita', 1, 9),
(5, 'Paloma Fresca', 1, 10),
(6, 'Carolina Collins', 3, 7);

INSERT INTO Drink_Attribute VALUES
(1, 'Vodka'),
(2, 'Triple sec'),
(3, 'Sierra Mist'),
(4, 'Tequila'),
(5, 'Lime juice'),
(6, 'Margarita mix'),
(7, 'Ginger beer'),
(8, 'Wheat'),
(9, 'White wine'),
(10, 'Cola'),
(11, 'Rum'),
(12, 'Grapefruit'),
(13, 'Gin'),
(14, 'Sour mix'),
(15, 'Lemon juice'),
(16, 'Simple syrup'),
(17, 'Red wine');

INSERT INTO Dietary_Restriction VALUES
(1, 'Diabetes'),
(2, 'Gluten-free'),
(3, 'Grapefruit interaction'),
(4, 'Lactose intolerant');

INSERT INTO Drink_has_Att VALUES
(1,1), (1,2), (1,3),
(2,1), (2,3),
(3,13), (3,15), (3,16), (3,17),
(4,4), (4,5),
(5,4), (5,5), (5,12),
(6,3), (6,13), (6,15), (6,16);

INSERT INTO Common_Drink_has_Att VALUES
(1,8),
(2,9),
(3,9),
(4,8),
(5,10), (5,11);

INSERT INTO Drink_has_Diet VALUES
(1,1),
(2,1), (2,3),
(3,1),
(4,1),
(5,3),
(6,1);

INSERT INTO Common_Drink_has_Diet VALUES
(1,1),
(2,4),
(3,4),
(4,1),(4,2),
(5,1);



