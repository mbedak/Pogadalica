from django.db import models


class AuthUser(models.Model):
    id = models.IntegerField(db_column='id', primary_key=True)  # Field name made lowercase.
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'
        # app_label = 'NflWeb'

    def __str__(self):
        return self.username


class Ekipe(models.Model):
    id_ekipa = models.IntegerField(db_column='ID_ekipa', primary_key=True)  # Field name made lowercase.
    kratica = models.CharField(db_column='Kratica', max_length=10, blank=True, null=True)
    ekipa = models.CharField(db_column='Ekipa', max_length=50)  # Field name made lowercase.
    stadion = models.CharField(db_column='Stadion', max_length=50)  # Field name made lowercase.
    trener = models.CharField(db_column='Trener', max_length=50)  # Field name made lowercase.
    konferencija = models.CharField(db_column='Konferencija', max_length=10, blank=True,
                                    null=True)  # Field name made lowercase.
    divizija = models.CharField(db_column='Divizija', max_length=10, blank=True,
                                null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Ekipe'

    def __str__(self):
        return self.ekipa


class Kolo(models.Model):
    id_kolo = models.AutoField(primary_key=True)
    broj_kola = models.IntegerField(unique=True, blank=True, null=True)
    broj_td = models.IntegerField(db_column='broj_TD', blank=True, null=True)  # Field name made lowercase.
    startdate = models.DateTimeField(blank=True, null=True)
    enddate = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'kolo'

    def __str__(self):
        return str(self.broj_kola)


class Utakmice(models.Model):
    id_utakmica = models.AutoField(primary_key=True)
    kolo = models.ForeignKey(Kolo, models.DO_NOTHING, db_column='kolo', blank=True, null=True, )
    gosti = models.ForeignKey(Ekipe, models.DO_NOTHING, db_column='gosti', blank=True, null=True, related_name='gosti')
    domacini = models.ForeignKey(Ekipe, models.DO_NOTHING, db_column='domacini', blank=True, null=True,
                                 related_name='domacini')

    pobjednik = models.ForeignKey(Ekipe, models.DO_NOTHING, db_column='pobjednik', blank=True, null=True)
    datum_vrijeme = models.DateTimeField(blank=True, null=True)
    gosti_spread = models.IntegerField(blank=True, null=True)
    domaci_spread = models.IntegerField(blank=True, null=True)
    rez_doma = models.IntegerField(blank=True, null=True)
    rez_gosti = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Utakmice'


class Igraci(models.Model):
    id_igraca = models.AutoField(primary_key=True)
    ime_natjecatelj = models.CharField(max_length=150, blank=True, null=True)
    prezime_natjecatelj = models.CharField(max_length=150, blank=True, null=True)
    username = models.CharField(max_length=128, blank=True, null=True)
    lozinka = models.CharField(max_length=30, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'igraci'


class OkladaKolo(models.Model):
    id_oklada_kolo = models.AutoField(primary_key=True)
    user = models.ForeignKey('AuthUser', models.DO_NOTHING, blank=True, null=True)
    broj_kola = models.ForeignKey('Kolo', models.DO_NOTHING, db_column='broj_kola', blank=True, null=True)
    broj_td = models.IntegerField(db_column='broj_TD', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Oklada_kolo'


class OkladaUtakmice(models.Model):
    id_oklada_utakmica = models.AutoField(primary_key=True)
    utakmica = models.ForeignKey('Utakmice', models.DO_NOTHING, blank=True, null=True)
    pobjednik_utakmica = models.ForeignKey(Ekipe, models.DO_NOTHING, db_column='pobjednik_utakmica', blank=True,
                                           null=True)
    dvostruko = models.BooleanField(blank=True, null=True)
    oklada_kolo = models.ForeignKey(OkladaKolo, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Oklada_utakmice'
