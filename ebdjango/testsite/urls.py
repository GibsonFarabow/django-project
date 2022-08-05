"""
from django.urls import path
from . import views
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [
    path('chad_app/', views.index, name='index'),
    path('chad_app/page2', views.page2, name='page2'),
] + staticfiles_urlpatterns() 
#urlpatterns += staticfiles_urlpatterns() #new
