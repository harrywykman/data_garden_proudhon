from django.contrib import admin

# Register your models here.

from .models import (Crop, Variety, Genus, Species, 
                        CommonName, Bed, Block, Site, SoilMediumBatch, 
                        PotOnRecord, NurseryRecord, BedRecord, SeederRecord,
                        HarvestRecord, Buyer, DeliveryRecord, DeliveryItem, 
                        Price, Family, LengthUOM, YieldUOM, AreaUOM
                    )

class PotOnRecordInline(admin.TabularInline):
    model = PotOnRecord
    extra = 1


class NurseryRecordAdmin(admin.ModelAdmin):
    fieldsets = [                                                               
        ('Variety',                  {'fields': ['variety']}),
        ('Start Date',          {'fields': ['in_nursery_date']}),
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
    list_display = ('name', 'site', 'block', 'width', 'width_UOM', 
                    'length', 'length_UOM')
    list_filter = ['block', 'site', 'length']
    ordering = ('block', 'name')
    fieldsets = [
        ('site',            {'fields': ['site']}),
        ('block',           {'fields': ['block']}),
        ('name',            {'fields': ['name']}),
        ('width',  {'fields': ['width']}),
        ('width unit',  {'fields': ['width_UOM']}),
        ('length',   {'fields': ['length']}),
        ('length unit',  {'fields': ['length_UOM']}),
    ]
    inlines = [BedRecordInline]


class BlockAdmin(admin.ModelAdmin):
    list_display = ('name', 'site',)

class DeliveryItemInline(admin.TabularInline):
    model = DeliveryItem
    extra = 5

class DeliveryRecordAdmin(admin.ModelAdmin):
    fieldsets = [                                                                                           
        ('date',            {'fields': ['date']}),                                                          
        ('buyer',           {'fields': ['buyer']}),                                                         
    ]
    inlines = [DeliveryItemInline]

class CropAdmin(admin.ModelAdmin):
    list_display = ('name', 'species', 'genus', 'family')
    #list_select_related = ('genus', 'species', 'family',)


class SpeciesAdmin(admin.ModelAdmin):
    list_display = ('__unicode__', 'genus', 'family')

admin.site.register(Crop, CropAdmin)
admin.site.register(Variety)
admin.site.register(Genus)
admin.site.register(Species, SpeciesAdmin)
admin.site.register(CommonName)
admin.site.register(Bed, BedAdmin)
admin.site.register(Block, BlockAdmin)
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
admin.site.register(Family)
admin.site.register(LengthUOM)
admin.site.register(YieldUOM)
admin.site.register(AreaUOM)
