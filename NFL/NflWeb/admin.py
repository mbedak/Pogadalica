from django.contrib import admin

# Register your models here.
from .models import Ekipe
from .models import Utakmice
from .models import Igraci
from .models import Kolo


admin.site.register(Ekipe)
admin.site.register(Utakmice)
admin.site.register(Igraci)
admin.site.register(Kolo)
