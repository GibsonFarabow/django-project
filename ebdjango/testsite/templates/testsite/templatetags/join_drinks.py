from django import template
from django.template.defaultfilters import stringfilter
from testsite.models import Drink, DrinkHasAtt, DrinkAttribute

register = template.Library()


@register.filter
@stringfilter
def drink_query(drinkname):
    step1 = Drink.objects.get(drink_name__exact=drinkname)
    temp=step1.drink_id
    step2 = DrinkHasAtt.objects.filter(drink_id__exact=temp).values()
    temp=list(step2)
    templist = [i['drink_att_id'] for i in temp]
    step3 = DrinkAttribute.objects.filter(drink_att_id__in=templist).values()
    templist = list(step3)
    final_list = [i['drink_att'] for i in templist]
    return final_list