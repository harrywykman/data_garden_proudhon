from django.contrib import admin

# Register your models here.

from .models import (Crop, Variety, Genus, Species, 
                        CommonName, Bed, Block, Site, SoilMediumBatch, 
                        PotOnRecord, NurseryRecord, BedRecord, SeederRecord,
                        HarvestRecord, Buyer, DeliveryRecord, DeliveryItem, 
                        Price
                    )

class PotOnRecordInline(admin.TabularInline):
    model = PotOnRecord
    extra = 1


class NurseryRecordAdmin(admin.ModelAdmin):
    fieldsets = [                                                               
        ('Variety',                  {'fields': ['variety']}),
        ('Start Date',          {'fields': ['start_date']}),
        ('Germ Date',           {'fields': ['germ_date']}),
        ('Medium',              {'fields': ['medium']}),
        ('Tray Size (eg. 72)',  {'fields': ['tray_size_cell']}),
        ('Number Trays',        {'fields': ['number_trays']}),
    ]
    inlines = [PotOnRecordInline]


class BedRecordInline(admin.TabularInline):
    model = BedRecord
    extra = 3

class BedAdmin(admin.ModelAdmin):
    fieldsets = [
        ('site',            {'fields': ['site']}),
        ('block',           {'fields': ['block']}),
        ('name',            {'fields': ['name']}),
        ('width (inches)',  {'fields': ['width_in']}),
        ('length (feet)',   {'fields': ['length_ft']}),
    ]
    inlines = [BedRecordInline]


class DeliveryItemInline(admin.TabularInline):
    model = DeliveryItem
    extra = 5

class DeliveryRecordAdmin(admin.ModelAdmin):
    fieldsets = [                                                                                           
        ('date',            {'fields': ['date']}),                                                          
        ('buyer',           {'fields': ['buyer']}),                                                         
    ]
    inlines = [DeliveryItemInline]

admin.site.register(Crop)
admin.site.register(Variety)
admin.site.register(Genus)
admin.site.register(Species)
admin.site.register(CommonName)
admin.site.register(Bed, BedAdmin)
admin.site.register(Block)
admin.site.register(Site)
admin.site.register(SoilMediumBatch)
admin.site.register(PotOnRecord)
admin.site.register(NurseryRecord, NurseryRecordAdmin)
admin.site.register(SeederRecord)
admin.site.register(HarvestRecord)
admin.site.register(BedRecord)
admin.site.register(Buyer)
admin.site.register(DeliveryRecord, DeliveryRecordAdmin)
admin.site.register(DeliveryItem)
admin.site.register(Price)
