# Generated by Django 4.0.4 on 2022-06-09 21:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='AuthUser',
            fields=[
                ('id', models.IntegerField(db_column='id', primary_key=True, serialize=False)),
                ('password', models.CharField(max_length=128)),
                ('last_login', models.DateTimeField(blank=True, null=True)),
                ('is_superuser', models.BooleanField()),
                ('username', models.CharField(max_length=150, unique=True)),
                ('first_name', models.CharField(max_length=150)),
                ('last_name', models.CharField(max_length=150)),
                ('email', models.CharField(max_length=254)),
                ('is_staff', models.BooleanField()),
                ('is_active', models.BooleanField()),
                ('date_joined', models.DateTimeField()),
            ],
            options={
                'db_table': 'auth_user',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Ekipe',
            fields=[
                ('id_ekipa', models.IntegerField(db_column='ID_ekipa', primary_key=True, serialize=False)),
                ('ekipa', models.CharField(db_column='Ekipa', max_length=50)),
                ('stadion', models.CharField(db_column='Stadion', max_length=50)),
                ('trener', models.CharField(db_column='Trener', max_length=50)),
                ('konferencija', models.CharField(blank=True, db_column='Konferencija', max_length=10, null=True)),
                ('divizija', models.CharField(blank=True, db_column='Divizija', max_length=10, null=True)),
            ],
            options={
                'db_table': 'Ekipe',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Igraci',
            fields=[
                ('id_igraca', models.AutoField(primary_key=True, serialize=False)),
                ('ime_natjecatelj', models.CharField(blank=True, max_length=30, null=True)),
                ('prezime_natjecatelj', models.CharField(blank=True, max_length=30, null=True)),
                ('username', models.CharField(blank=True, max_length=30, null=True)),
                ('lozinka', models.CharField(blank=True, max_length=30, null=True)),
            ],
            options={
                'db_table': 'igraci',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Kolo',
            fields=[
                ('kolo_id', models.AutoField(primary_key=True, serialize=False)),
                ('broj_kola', models.IntegerField(blank=True, null=True)),
                ('broj_td', models.IntegerField(blank=True, db_column='broj_TD', null=True)),
            ],
            options={
                'db_table': 'kolo',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Oklada',
            fields=[
                ('ID_oklada', models.AutoField(primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'oklada',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Utakmice',
            fields=[
                ('id_utakmica', models.AutoField(primary_key=True, serialize=False)),
                ('rezultat_doma', models.IntegerField(blank=True, null=True)),
                ('rezultat_gosti', models.IntegerField(blank=True, null=True)),
                ('pobjednik', models.CharField(blank=True, max_length=50, null=True)),
            ],
            options={
                'db_table': 'Utakmice',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='OkladaKolo',
            fields=[
                ('id_oklada_kolo', models.OneToOneField(db_column='id_oklada_kolo', on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='NflWeb.oklada')),
                ('oklada_id', models.IntegerField(blank=True, null=True)),
                ('broj_td_user', models.IntegerField(blank=True, db_column='broj_TD_user', null=True)),
            ],
            options={
                'db_table': 'Oklada_kolo',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='OkladaUtakmice',
            fields=[
                ('id_oklada_utakmica', models.OneToOneField(db_column='id_oklada_utakmica', on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='NflWeb.ekipe')),
                ('utakmica_id', models.IntegerField(blank=True, null=True)),
                ('pobjednik_utakmica', models.IntegerField(blank=True, null=True)),
                ('domaci_rezultat', models.IntegerField(blank=True, null=True)),
                ('gosti_rezultat', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'Oklada_utakmice',
                'managed': False,
            },
        ),
    ]
