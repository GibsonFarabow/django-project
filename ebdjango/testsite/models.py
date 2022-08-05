from django.db import models
# Create your models here.

# from picklefield.fields import PickledObjectField

#python manage.py inspectdb > models.py
# Create your models here.

class Establishment(models.Model):
    establishment_id = models.CharField(max_length=64, primary_key=True)
    establishment_name = models.CharField(max_length=64)
    establishment_loc = models.CharField(max_length=64)

    class Meta:
        managed = False
        db_table = 'Establishment'


class Drink(models.Model):
    drink_id = models.CharField(max_length=64, primary_key=True)
    drink_name = models.CharField(max_length=64)
    establishment = models.ForeignKey('Establishment', models.DO_NOTHING)
    drink_price = models.CharField(max_length=64) #PickledObjectField()#models.CharField(max_length=64),

    class Meta:
        managed = False
        db_table = 'Drink'


class CommonDrink(models.Model):
    common_drink_id = models.CharField(max_length=64, primary_key=True)
    common_drink_name = models.CharField(max_length=64)
    common_drink_price = models.CharField(max_length=64)
    alc_content_abv = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Common_Drink'


class DietaryRestriction(models.Model):
    diet_id = models.CharField(max_length=64, primary_key=True)
    diet_name = models.CharField(max_length=64)

    class Meta:
        managed = False
        db_table = 'Dietary_Restriction'


class CommonDrinkHasDiet(models.Model):
    common_drink = models.ForeignKey(CommonDrink, models.DO_NOTHING)
    diet = models.ForeignKey('DietaryRestriction', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Common_Drink_has_Diet'


class DrinkHasDiet(models.Model):
    drink = models.ForeignKey(Drink, models.DO_NOTHING)
    diet = models.ForeignKey(DietaryRestriction, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Drink_has_Diet'


class DrinkAttribute(models.Model):
    drink_att_id = models.CharField(max_length=64, primary_key=True)
    drink_att = models.CharField(max_length=64)

    class Meta:
        managed = False
        db_table = 'Drink_Attribute'


class DrinkHasAtt(models.Model):
    id = models.AutoField(primary_key=True)
    drink = models.ForeignKey(Drink, models.DO_NOTHING)
    drink_att = models.ForeignKey(DrinkAttribute, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'DrinkHasAttributeView'


### needs a view
class CommonDrinkHasAtt(models.Model):
    common_drink = models.ForeignKey(CommonDrink, models.DO_NOTHING)
    common_drink_att = models.ForeignKey('DrinkAttribute', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Common_Drink_has_Att'

###is a SQL view
class DietDrinks(models.Model):
    id = models.CharField(max_length=64, primary_key=True)
    drink = models.CharField(max_length=64)
    rest = models.CharField(max_length=64)
    restaurant = models.CharField(max_length=64)
    price = models.CharField(max_length=64)

    class Meta:
        managed = False
        db_table = 'DietDrinks'





