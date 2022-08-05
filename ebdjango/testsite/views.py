from django.shortcuts import render
from django.http import HttpResponse
from .models import Drink, DietaryRestriction, CommonDrink, DrinkAttribute, Establishment, DrinkHasAtt
from .models import DietDrinks


def hello(request):
	return HttpResponse("Hello")


def index(request):
    drinks = Drink.objects.all()
    diets = DietaryRestriction.objects.all()
    attr = DrinkAttribute.objects.all()
    cd = CommonDrink.objects.all()
    estab = Establishment.objects.all()
    context={
    'drinks': drinks, 'diets': diets, 'attr': attr, 'cd': cd, 'estab': estab,
    }
    return render(request, 'testsite/index.html', context)



def page2(request):
    drinks = Drink.objects.all()
    dbq1= DietDrinks.objects.all()
    context={
    'drinks':drinks, 'dbq1': dbq1,
    }
    return render(request, 'testsite/page2.html', context)
