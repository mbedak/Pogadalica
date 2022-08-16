from django.urls import path, include
from django.views.generic import TemplateView

from . import views
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [
    path('odabirkola/', views.odabirkola, name='odabirkola'),
    path('odabirkolazaokladu/', views.odabirkolazaokladu, name='odabirkolazaokladu'),
    path('kolo<int:BK>/', views.kolo, name='kolo'),
    path('home/', views.homepage, name='home'),
    path('oklada<int:BK>/', views.oklada, name='oklada'),
    path('okladi_se/', views.okladi_se, name='okladi_se'),
    path("accounts", include("django.contrib.auth.urls")),
    path('', TemplateView.as_view(template_name='homepage.html'), name='homepage'),
    path('register/', views.register_request, name='register'),
    path('login/', views.login_request, name='login'),
    path('logout/', views.logout_request, name='logout'),
    path('tablicabodova/', views.ukupna_tablica, name='tablicabodova'),
    path('upis_utakmice_formset/', views.upis_utakmice_formset, name='upis_utakmice_formset'),
    path('upis_kola_formset/', views.upis_kola_formset, name='upis_kola_formset'),
    path('odabirkolazapregled/', views.odabirkolazapregled, name='odabirkolazapregled'),
    path('broj_tjednih_bodova<int:BK>/', views.broj_tjednih_bodova, name='broj_tjednih_bodova'),


]

urlpatterns += staticfiles_urlpatterns()
