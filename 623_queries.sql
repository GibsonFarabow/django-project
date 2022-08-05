

SELECT drink_name drink, diet.diet_name rest, establishment_name 'restaurant/bar', drink_price price 
FROM Dietary_Restriction diet join Drink_has_Diet dd on dd.diet_id = diet.diet_id join Drink d on d.drink_id = dd.drink_id 
join Establishment e on d.establishment_id = e.establishment_id
UNION
SELECT common_drink_name drink, diet.diet_name rest, 'most establishments', common_drink_price price 
FROM Dietary_Restriction diet join Common_Drink_has_Diet cdd on cdd.diet_id = diet.diet_id
join Common_Drink cd on cd.common_drink_id = cdd.common_drink_id 
ORDER BY drink;


SELECT drink FROM (
    SELECT CASE WHEN diet_name in ('Grapefruit interaction', 'Gluten-free') then drink_name ELSE NULL END drink FROM Drink d JOIN 			Drink_has_Diet dd on d.drink_id = dd.drink_id JOIN Dietary_Restriction dr on dr.diet_id = dd.diet_id
	UNION
	SELECT CASE WHEN diet_name in ('Grapefruit interaction', 'Gluten-free') then common_drink_name ELSE NULL END drink FROM Common_Drink d 	   JOIN Common_Drink_has_Diet dd on d.common_drink_id = dd.common_drink_id JOIN Dietary_Restriction dr on dr.diet_id = dd.diet_id      
    ) cte where cte.drink IS NOT NULL;


WITH Full_list_of_drinks as(
SELECT Distinct
	placeholder,
	drink_name
FROM
	(
	SELECT
		'placeholder', drink
	FROM
		(
		SELECT d.drink_name drink,
		CASE WHEN da.drink_att NOT IN('Vodka', 'Sierra Mist', 'Gin', 'Simple syrup', 'Cola', 'Lemon juice')
    	THEN d.drink_id = NULL ELSE d.drink_id END drink_id
		FROM Drink d JOIN Drink_has_Att dha on
			d.drink_id = dha.drink_id JOIN Drink_Attribute da on da.drink_att_id = dha.drink_att_id)subquery
		WHERE
			drink_id IS NULL) wrong_drinks RIGHT JOIN Drink d on wrong_drinks.drink = d.drink_name)

SELECT drink_name FROM Full_list_of_drinks WHERE placeholder IS NULL;









