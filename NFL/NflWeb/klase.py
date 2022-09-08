from datetime import datetime, time


# import datetime
# from datetime import time


class racunanje_boja:
    def __init__(self, utakmica):
        self.utakmica = utakmica
        if utakmica.domaci_spread is None or utakmica.gosti_spread is None:
            self.moze_duplo = False
            self.boja = "#808080"


        elif -3 <= utakmica.domaci_spread <= 3:
            self.moze_duplo = True
            self.boja = "#008000"

        elif -50 < utakmica.domaci_spread < -3 or 3 < utakmica.domaci_spread < 50:
            self.moze_duplo = True
            self.boja = "#FFD700"

    def moze_duplo(self):
        return self.moze_duplo

    def boja(self):
        return self.boja


class tjedni_bodovi:

    def __init__(self, utakmice, okladene_utakmice, sve_okladene_utakmice):
        self.N_utakmica = utakmice.count()
        self.N_pola = self.N_utakmica / 2
        self.N_pola_rd = self.N_pola - 1.5
        self.DP = 0
        self.PT = 0
        self.stifler = 0
        self.prime_time = 0
        self.tko_rano = 0
        self.bodovi = 0
        self.utakmice = utakmice
        self.okladene_utakmice = okladene_utakmice
        self.sve_utakmice_oklada = sve_okladene_utakmice

        tekme_u_19 = [tekma for tekma in utakmice if
                      tekma.datum_vrijeme != None and datetime.strftime(tekma.datum_vrijeme, "%H") == "19"]

        prime_start = time(hour=1, minute=50)
        prime_end = time(hour=2, minute=30)
        self.pobjednici_svi = []
        self.solo_tekme = []
        self.oklada_ekipe = []
        self.solo_tekme_user = []
        self.prave = []
        self.tie1 = 0
        self.tie2 = 0
        self.tie3 = 0

        for i in self.utakmice:  # dobavi pobjednike pravih utakmica (ekipe)
            self.prave.append(i.pobjednik)

        for i in self.sve_utakmice_oklada:  # dobavi sve oklade (ekipe)
            self.pobjednici_svi.append(i.pobjednik_utakmica)

        for i in self.okladene_utakmice:  # dobavi sve oklade od korisnika (ekipe)
            self.oklada_ekipe.append(i.pobjednik_utakmica)

        for n in self.pobjednici_svi:  # dobavi samo ekipe koje se u okladama pojavljuju jednom
            x = self.pobjednici_svi.count(n)
            if x == 1:
                self.solo_tekme.append(n)

        for i in self.solo_tekme:  # ako user ima jednu od tih ekipa dodaj u listu
            if i in self.oklada_ekipe:
                self.solo_tekme_user.append(i)

        for i in self.solo_tekme_user:  # ako su ekipe iz liste pobjednici  dodaj 0.1
            if i in self.prave:
                self.tie1 += 0.1

        for okl_utakmica in okladene_utakmice:
            for tekma in utakmice:
                if tekma.pobjednik is not None:
                    if prime_end > tekma.datum_vrijeme.time() > prime_start:
                        self.PT += 1
                    if tekma == okl_utakmica.utakmica:
                        if tekma.pobjednik == okl_utakmica.pobjednik_utakmica:
                            self.bodovi += 1
                            self.tie2 += 0.001

                            time_tekme = datetime.strftime(tekma.datum_vrijeme, "%H")
                            if time_tekme == "19":
                                self.tko_rano += 1
                            if prime_end > tekma.datum_vrijeme.time() > prime_start:
                                self.prime_time += 1
                            if okl_utakmica.dvostruko:
                                self.DP += 1
                                if abs(tekma.domaci_spread) <= 3:
                                    self.tie3 += 0.001
                                if abs(tekma.domaci_spread) > 7:
                                    self.stifler += 1
                        elif tekma.pobjednik != okl_utakmica.pobjednik_utakmica:
                            if okl_utakmica.dvostruko is True:
                                if tekma.domaci_spread is None:
                                    self.DP += 0
                                if abs(tekma.domaci_spread) <= 3:
                                    self.DP += -1

        if self.bodovi == self.N_utakmica and self.bodovi != 0:
            self.freight_train = True
        else:
            self.freight_train = False

        if len(tekme_u_19) == self.tko_rano and len(tekme_u_19) != 0:
            self.tko_rano_rani = 2
        else:
            self.tko_rano_rani = 0

        if self.PT == self.prime_time and self.prime_time > 0:
            self.prime_time_flag = 1
        else:
            self.prime_time_flag = 0

        if self.N_pola_rd >= self.bodovi > 4:
            self.tvornica_tuge = True
        else:
            self.tvornica_tuge = False

        if self.bodovi <= 4 and self.bodovi != 0:
            self.utter_disaster = True
        else:
            self.utter_disaster = False

        if self.stifler > 0:
            self.stifler_nagrada = True
        else:
            self.stifler_nagrada = False

        self.zbroj_bodova_sve = self.bodovi + self.tie1 + self.DP + self.prime_time_flag + self.tko_rano_rani + self.tie2 \
                                + self.tie3
        self.zbroj_bodova_flt = "%.5f" % self.zbroj_bodova_sve

    def tko_rano_rani(self):
        return self.tko_rano_rani

    def duplerica(self):
        return self.DP

    def prime_time_flag(self):
        return self.prime_time_flag

    def zbroji_bodove(self):
        return self.bodovi

    def zbroj_bodova_sve(self):
        return self.zbroj_bodova_sve

    def zbroj_bodova_flt(self):
        return self.zbroj_bodova_flt

    def freight_train(self):
        return self.freight_train

    def tvornica_tuge(self):
        return self.tvornica_tuge

    def utter_disaster(self):
        return self.utter_disaster

    def stifler_nagrada(self):
        return self.stifler_nagrada
