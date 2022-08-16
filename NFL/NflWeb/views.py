import datetime
from collections import OrderedDict, Counter

from crispy_forms.helper import FormHelper
from crispy_forms.layout import Layout, Submit, Field
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.models import User
from django.forms import ModelForm, DateInput
from django.forms import modelformset_factory, DateTimeInput
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.template import loader
from django.utils import timezone

from klase import racunanje_boja, tjedni_bodovi
from .forms import NewUserForm
from .models import Utakmice, Kolo, Ekipe, OkladaUtakmice, OkladaKolo


class UtakmiceFormSetHelper(FormHelper):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.form_method = 'post'
        self.layout = Layout(
            # Field('rez_doma', style='max-width: 4em'),
            # Field('rez_gosti', style='max-width: 4em'),
            # Field('gosti_spread', style='max-width: 4em'),
            # Field('domaci_spread', style='max-width: 4em'),
            # Field('kolo', style='max-width: 4em'),
        )
        self.render_required_fields = True


class KolaFormSetHelper(FormHelper):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.form_method = 'post'
        self.layout = Layout(
        )
        self.render_required_fields = True


class UpisTekme(ModelForm):
    class Meta:
        model = Utakmice
        fields = ['id_utakmica', 'kolo', 'gosti', 'rez_gosti', 'gosti_spread', 'domacini', 'rez_doma', 'domaci_spread',
                  'pobjednik', 'datum_vrijeme', ]
        labels = {
            'kolo': '#',
            'domacini': 'Domaćin',
            'gosti': 'Gosti',
            'rez_gosti': 'Rezultat gosti',
            'gosti_spread': 'Gosti spread',
            'domaci_spread': 'Domaćin spread',
            'rez_doma': 'Rezulatat domaćin',
            'datum_vrijeme': 'Vrijeme i datum',
        }
        widgets = {
            'datum_vrijeme': DateTimeInput(format='%m/%d/%Y %H:%M',
                                           attrs={'type': 'datetime', 'placeholder': 'm/d/Y H:M'}),
        }


class UpisKola(ModelForm):
    class Meta:
        model = Kolo
        fields = ['id_kolo', 'broj_kola', 'broj_td', 'startdate', 'enddate', ]
        labels = {
            'broj_kola': '#',
            'broj_td': 'Broj TD',
            'enddate': 'Kraj kola',
            'startdate': 'Početak kola',
        }
        widgets = {
            'enddate': DateTimeInput(format='%m/%d/%Y %H:%M',
                                     attrs={'type': 'datetime', 'placeholder': 'm/d/Y H:M'}),
            'startdate': DateTimeInput(format='%m/%d/%Y %H:%M',
                                       attrs={'type': 'datetime', 'placeholder': 'm/d/Y H:M'}),
        }


def upis_utakmice_formset(request):
    UpisTekmeSet = modelformset_factory(Utakmice, form=UpisTekme)
    if request.method == "POST":
        formset = UpisTekmeSet(
            request.POST,
        )
        if formset.is_valid():
            formset.save()
            # Do something.
    else:
        formset = UpisTekmeSet()

    helper = UtakmiceFormSetHelper()
    helper.add_input(Submit("submit", "Save"))
    helper.template = 'bootstrap4/table_inline_formset.html'
    return render(request, 'NflWeb/upis_utakmice_formset.html', {'formset': formset, 'helper': helper})


def upis_kola_formset(request):
    UpisKolaSet = modelformset_factory(Kolo, form=UpisKola)
    if request.method == "POST":
        formset = UpisKolaSet(
            request.POST,
        )
        if formset.is_valid():
            formset.save()
            # Do something.
    else:
        formset = UpisKolaSet()

    helper = KolaFormSetHelper()
    helper.add_input(Submit("submit", "Save"))
    helper.template = 'bootstrap/table_inline_formset.html'
    return render(request, 'NflWeb/upis_kola_formset.html', {'formset': formset, 'helper': helper})


def homepage(request):
    return render(request, 'NflWeb/home.html')


def odabirkola(request):
    sva_kola = Kolo.objects.all()
    template = loader.get_template('NflWeb/Odabir_kola.html')
    context = {'sva_kola': sva_kola}
    return HttpResponse(template.render(context, request))


def odabirkolazaokladu(request):
    today = datetime.date.today()
    sva_kola = Kolo.objects.all()
    template = loader.get_template('NflWeb/odabirkolazaokladu.html')
    context = {'sva_kola': sva_kola,
               'today': today}
    return HttpResponse(template.render(context, request))


def odabirkolazapregled(request):
    today = datetime.date.today()
    sva_kola = Kolo.objects.all()
    template = loader.get_template('NflWeb/odabirkolazapregled.html')
    context = {'sva_kola': sva_kola,
               'today': today}
    return HttpResponse(template.render(context, request))


def kolo(request, BK):
    tekme = Utakmice.objects.filter(kolo=BK)
    stadion = Ekipe.objects.filter(stadion=Utakmice.domacini)
    template = loader.get_template('NflWeb/pregledupisa.html')
    context = {'tekme': tekme,
               'broj_kola': BK,
               'stadion': stadion, }
    return HttpResponse(template.render(context, request))


def oklada(request, BK):
    today = timezone.now()
    korisnik = request.user
    broj_TD = OkladaKolo.objects.filter(broj_kola=BK)
    datum = Kolo.objects.filter(broj_kola=BK).first()
    pocetak = datum.startdate
    kraj = datum.enddate
    # ulaz = 0
    # if pocetak>today or kraj < today:
    #     ulaz += 1
    # else:
    #     ulaz += 0

    tekme = Utakmice.objects.filter(kolo=BK)
    ekipe = Ekipe.objects.all()
    stadion = Ekipe.objects.filter(stadion=Utakmice.domacini)
    # pobjednik = Oklada.objects.all()
    template = loader.get_template('NflWeb/oklada.html')

    if OkladaKolo.objects.filter(user_id=request.user.id, broj_kola=BK).exists():
        messages.error(request, "Vi ste vec upisali okladu za ovo kolo")
        return redirect('home')
    else:
        dict_tekmi = {}
        dict_boji = {}
        najmanji_spread = 100
        najmanji_spread_tekma = tekme[0]
        for tekma in tekme:
            dict_tekmi[tekma] = racunanje_boja(tekma).moze_duplo
            dict_boji[tekma] = racunanje_boja(tekma).boja
            if tekma.domaci_spread is not None and tekma.gosti_spread is not None:
                if abs(tekma.domaci_spread) < najmanji_spread:
                    najmanji_spread = abs(tekma.domaci_spread)
                    najmanji_spread_tekma = tekma

    context = {'tekme': tekme,
               'ekipe': ekipe,
               # 'pobjednik': pobjednik,
               'broj_kola': BK,
               'stadion': stadion,
               'korisnik': korisnik,
               'today': today,
               'pocetak': pocetak,
               'kraj': kraj,
               'broj_TD': broj_TD,
               'duplam': dict_tekmi,
               'boja': dict_boji,
               'najmanji_spread_tekma': najmanji_spread_tekma
               }
    return HttpResponse(template.render(context, request))


def okladi_se(request):
    # korisnik = request.POST['korisnik']
    # broj_TD = request.POST['broj_TD']
    # broj_kola = request.POST['broj_kola']
    # print(request.POST)
    svi_iz_forme = request.POST
    print(svi_iz_forme)
    # novi =  korisnik
    user_id = request.user.id
    user = request.user
    broj_td = request.POST['broj_TD']
    broj_kola = request.POST['broj_kola']
    kolo = Kolo.objects.filter(broj_kola=broj_kola).get()
    oklade_utakmica = {}
    oklada_kolo = OkladaKolo(user_id=user_id, broj_td=broj_td, broj_kola=kolo)
    oklada_kolo.save()
    oklada_kolo = OkladaKolo.objects.filter(user_id=user_id, broj_td=broj_td, broj_kola=kolo).get()

    for k, v in svi_iz_forme.items():
        if 'pobjednik' in k:
            broj_tekme = k.split("_")[1]
            if broj_tekme not in oklade_utakmica:
                oklade_utakmica[broj_tekme] = OkladaUtakmice()
            oklade_utakmica[broj_tekme].pobjednik_utakmica = Ekipe.objects.filter(id_ekipa=v).get()

        elif 'duplam' in k:
            broj_tekme = k.split("_")[1]
            if broj_tekme not in oklade_utakmica:
                oklade_utakmica[broj_tekme] = OkladaUtakmice()
            oklade_utakmica[broj_tekme].dvostruko = 1 if v == "DA" else 0

    for z in oklade_utakmica.items():
        oklada_tekme = z[1]
        oklada_tekme.oklada_kolo = oklada_kolo
        oklada_tekme.utakmica = Utakmice.objects.filter(id_utakmica=z[0]).get()
        tekma = Utakmice.objects.filter(id_utakmica=z[0]).get()
        oklada_tekme.pobjednik_utakmica = Ekipe.objects.filter(id_ekipa=oklada_tekme.pobjednik_utakmica.id_ekipa).get()
        oklada_tekme.save()

    return redirect("/home")


def register_request(request):
    if request.method == "POST":
        form = NewUserForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            messages.success(request, "Registration successful.")
            return redirect("/home")
        messages.error(request, "Unsuccessful registration. Invalid information.")
    form = NewUserForm()
    return render(request=request, template_name="NflWeb/register.html", context={"register_form": form})


def login_request(request):
    if request.method == "POST":
        form = AuthenticationForm(request, data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                messages.info(request, f"You are now logged in as {username}.")
                return redirect("home")
            else:
                messages.error(request, "Invalid username or password.")
        else:
            messages.error(request, "Invalid username or password.")
    form = AuthenticationForm()
    return render(request=request, template_name="NflWeb/login.html", context={"login_form": form})


def logout_request(request):
    logout(request)
    messages.info(request, "You have successfully logged out.")
    return redirect("home")


def ukupna_tablica(request):
    sva_kola = [i for i in range(1, 19)]
    kola = Kolo.objects.all()
    kolo = kola[2].broj_kola
    okladena_kola_po_broju_kola = OkladaKolo.objects.filter(broj_kola=kolo)
    lista_korisnika = [okladeno_kolo.user for okladeno_kolo in okladena_kola_po_broju_kola]
    korisnik_bodovi = {}
    korisnik_ukupno = {}
    lista_korisnika_sa_tjednim_bodovima = {}
    tjedni_bodovi_za_korisnika = ()
    lista_korisnika_stifler = {}
    lista_korisnika_freight = {}
    lista_korisnika_utter = {}
    lista_korisnika_nostradamus = {}

    for korisnik in lista_korisnika:
        stifler_bodovi = 0
        freight_bodovi = 0
        utter_bodovi = 0
        nostradamus_bodovi = 0
        for kolo in kola:
            prave_tekme = Utakmice.objects.filter(kolo=kolo.broj_kola)
            kolo_korisnik1 = OkladaKolo.objects.filter(user=korisnik, broj_kola=kolo.broj_kola).first()
            sve_oklade_kolo = OkladaKolo.objects.filter(broj_kola=kolo.broj_kola).all()
            sve_tekme_oklada = OkladaUtakmice.objects.filter(oklada_kolo__in=sve_oklade_kolo)
            if kolo_korisnik1 == None:
                stifler_bodovi += 0
                freight_bodovi += 0
                nostradamus_bodovi += 0
                utter_bodovi += 0
                broj_bodova = 0
                ukupan_zbroj = 0

            else:
                kolo_korisnik = OkladaKolo.objects.filter(user=korisnik, broj_kola=kolo.broj_kola).get()
                utakmica_korisnik = OkladaUtakmice.objects.filter(oklada_kolo=kolo_korisnik)
                tj_bodovi = tjedni_bodovi(prave_tekme, utakmica_korisnik, sve_tekme_oklada)
                ukupan_zbroj = 0
                broj_bodova = 0
                pravi_td = kolo.broj_td
                okladeni_td = kolo_korisnik.broj_td

                if pravi_td == okladeni_td:
                    nostradamus_bodovi += 15

                if tj_bodovi.stifler_nagrada:
                    stifler_bodovi += 10
                if tj_bodovi.freight_train:
                    freight_bodovi += 50

                if tj_bodovi.tvornica_tuge:
                    ukupan_zbroj = 0
                elif tj_bodovi.utter_disaster:
                    ukupan_zbroj -= 15
                    utter_bodovi -= 15
                else:
                    broj_bodova = (
                        tj_bodovi.zbroji_bodove(), tj_bodovi.tko_rano_rani, tj_bodovi.prime_time_flag, tj_bodovi.DP)
                    ukupan_zbroj = tj_bodovi.zbroj_bodova_sve

            korisnik_bodovi[korisnik] = broj_bodova
            korisnik_ukupno[korisnik] = ukupan_zbroj
            tjedni_bodovi_za_korisnika = tjedni_bodovi_za_korisnika + (ukupan_zbroj,)

        lista_korisnika_sa_tjednim_bodovima[korisnik.username] = tjedni_bodovi_za_korisnika
        tjedni_bodovi_za_korisnika = ()
        lista_korisnika_stifler[korisnik.username] = stifler_bodovi
        lista_korisnika_freight[korisnik.username] = freight_bodovi
        lista_korisnika_utter[korisnik.username] = utter_bodovi
        lista_korisnika_nostradamus[korisnik.username] = nostradamus_bodovi

    lista_korisnika_stifler_sorted = sorted(lista_korisnika_stifler.items())
    lista_korisnika_freight_sorted = sorted(lista_korisnika_freight.items())
    lista_korisnika_utter_sorted = sorted(lista_korisnika_utter.items())
    lista_korisnika_nostradamus_sorted = sorted(lista_korisnika_nostradamus.items())

    korisnici_po_tjednu = {}
    krajnjalista = []
    zadnji_index = len(list(lista_korisnika_sa_tjednim_bodovima.values())[0])

    for i in range(zadnji_index):
        for k, v in lista_korisnika_sa_tjednim_bodovima.items():
            vrijednost_bodova_u_kolu = v[i]
            korisnici_po_tjednu[k] = vrijednost_bodova_u_kolu
            sorted_korisnici_po_tjednu = list(sorted(korisnici_po_tjednu.items(), key=lambda item: item[1], reverse=True))
        krajnjalista.append(sorted_korisnici_po_tjednu)
        korisnici_po_tjednu = {}
        sorted_korisnici_po_tjednu = []

    for nesto in krajnjalista:
        if nesto[0][1] != 0:
            if not len(nesto) < 1:
                if nesto[0][1] == 0:
                    nesto[0] = (nesto[0][0], 0)
                else:
                    nesto[0] = (nesto[0][0], 25)
            if not len(nesto) < 2:
                if nesto[1][1] == 0:
                    nesto[1] = (nesto[1][0], 0)
                else:
                    nesto[1] = (nesto[1][0], 18)
            if not len(nesto) < 3:
                if nesto[2][1] == 0:
                    nesto[2] = (nesto[2][0], 0)
                else:
                    nesto[2] = (nesto[2][0], 15)
            if not len(nesto) < 4:
                if nesto[3][1] == 0:
                    nesto[3] = (nesto[3][0], 0)
                else:
                    nesto[3] = (nesto[3][0], 12)
            if not len(nesto) < 5:
                if nesto[4][1] == 0:
                    nesto[4] = (nesto[4][0], 0)
                else:
                    nesto[4] = (nesto[4][0], 10)
            if not len(nesto) < 6:
                if nesto[5][1] == 0:
                    nesto[5] = (nesto[5][0], 0)
                else:
                    nesto[5] = (nesto[5][0], 8)
            if not len(nesto) < 7:
                if nesto[6][1] == 0:
                    nesto[6] = (nesto[6][0], 0)
                else:
                    nesto[6] = (nesto[6][0], 6)
            if not len(nesto) < 8:
                if nesto[7][1] == 0:
                    nesto[7] = (nesto[7][0], 0)
                else:
                    nesto[7] = (nesto[7][0], 4)
            if not len(nesto) < 9:
                if nesto[8][1] == 0:
                    nesto[8] = (nesto[8][0], 0)
                else:
                    nesto[8] = (nesto[8][0], 2)
            if not len(nesto) < 10:
                if nesto[9][1] == 0:
                    nesto[9] = (nesto[9][0], 0)
                else:
                    nesto[9] = (nesto[9][0], 1)
            else:
                for i in range(11,100):
                    if not len(nesto) < i :
                        nesto[i] = (nesto[i][0], 0)

    nova_lista = []
    for el in krajnjalista:
        sorted_by_abcd = sorted(el, key=lambda tup: tup[0])
        nova_lista.append(sorted_by_abcd)
    lista_kor = []
    for korisnik in lista_korisnika:
        lista_kor.append(korisnik.username)
    lista_kor = sorted(lista_kor)

    st = nova_lista
    d = {x[0][0]: sum(list(zip(*x))[1]) for x in zip(*st)}

    stf= dict(lista_korisnika_stifler_sorted)
    frt = dict(lista_korisnika_freight_sorted)
    utt = dict(lista_korisnika_utter_sorted)
    nos = dict(lista_korisnika_nostradamus_sorted)

    nagrade = dict(Counter(stf)+Counter(frt)+Counter(utt)+Counter(nos))
    ukupno_za_tablicu = dict(Counter(nagrade)+Counter(d))


    context = {'sva_kola': sva_kola,
               'lista_bodova': nova_lista,
               'lista_korisnika': lista_kor,
               'stifler': lista_korisnika_stifler_sorted,
               'train': lista_korisnika_freight_sorted,
               'utter': lista_korisnika_utter_sorted,
               'nostradamus': lista_korisnika_nostradamus_sorted,
               'ukupno': d,
               'ukupno_sve': ukupno_za_tablicu,
               }
    template = loader.get_template("NflWeb/tablicabodova.html")
    return HttpResponse(template.render(context, request))


def broj_tjednih_bodova(request, BK):
    prave_tekme = Utakmice.objects.filter(kolo=BK)
    okladena_kola_po_broju_kola = OkladaKolo.objects.filter(broj_kola=BK)
    tekme_oklada = OkladaUtakmice.objects.filter(oklada_kolo__in=okladena_kola_po_broju_kola)
    dict_tekme_oklada_po_tekmi = {}
    dict_tekme_oklada_po_tekmi_dupla = {}
    lista_korisnika = [okladeno_kolo.user for okladeno_kolo in okladena_kola_po_broju_kola]

    for okladena_tekma in tekme_oklada:
        dict_tekme_oklada_po_tekmi[okladena_tekma.utakmica] = [(oklada_tekme.pobjednik_utakmica, oklada_tekme.dvostruko)
                                                               for
                                                               oklada_tekme in tekme_oklada if
                                                               oklada_tekme.utakmica == okladena_tekma.utakmica]

    korisnik_bodovi = {}
    korisnik_ukupno = {}
    freight_train_ukupno = {}
    stifler_ukupno = {}
    tvornica_tuge_ukupno = {}
    utter_disaster_ukupno = {}
    for korisnik in lista_korisnika:
        kolo_korisnik = OkladaKolo.objects.filter(user=korisnik, broj_kola=BK).all()
        utakmica_korisnik = OkladaUtakmice.objects.filter(oklada_kolo__in=kolo_korisnik)
        tj_bodovi = tjedni_bodovi(prave_tekme, utakmica_korisnik, tekme_oklada)
        broj_bodova = (tj_bodovi.zbroji_bodove(), tj_bodovi.tko_rano_rani, tj_bodovi.prime_time_flag, tj_bodovi.DP)
        ukupan_zbroj = tj_bodovi.zbroj_bodova_flt
        freight_train = tj_bodovi.freight_train
        stifler = tj_bodovi.stifler_nagrada
        tvornica_tuge = tj_bodovi.tvornica_tuge
        utter_disaster = tj_bodovi.utter_disaster
        korisnik_bodovi[korisnik] = broj_bodova
        korisnik_ukupno[korisnik] = ukupan_zbroj
        freight_train_ukupno[korisnik] = freight_train
        stifler_ukupno[korisnik] = stifler
        tvornica_tuge_ukupno[korisnik] = tvornica_tuge
        utter_disaster_ukupno[korisnik] = utter_disaster
    context = {
        'freight_train': freight_train_ukupno,
        'stifler': stifler_ukupno,
        'tvornica_tuge': tvornica_tuge_ukupno,
        'utter_disaster': utter_disaster_ukupno,
        'prave_tekme': list(prave_tekme),
        'kolo_oklada': list(okladena_kola_po_broju_kola),
        'tekme_oklada': list(tekme_oklada),
        'dict_oklada_po_tekmi': dict_tekme_oklada_po_tekmi,
        'dict_oklada_po_tekmi_dupla': dict_tekme_oklada_po_tekmi_dupla,
        'lista_korisnika': lista_korisnika,
        'korisnik_bodovi': korisnik_bodovi,
        'korisnik_ukupno': korisnik_ukupno,

    }
    template = loader.get_template("NflWeb/broj_tjednih_bodova.html")

    return HttpResponse(template.render(context, request))
