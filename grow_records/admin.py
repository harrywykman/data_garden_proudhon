from django.contrib import admin

# Register your models here.

from .models import (Crop, Variety, Genus, Species,
                        CommonName, Bed, BedSet, Site, SoilMediumBatch,
                        PotOnRecord, NurseryRecord, BedRecord, SeederRecord,
                        HarvestRecord, Buyer, DeliveryRecord, DeliveryItem,
                        VarietyPrice, Family, LengthUOM, YieldUOM, AreaUOM,
                        BuyerVarietyPrice, Action, FertiliseInnoculate,
                        AmmendInnoculate, Input, Supplier
                    )

class FamilyAdmin(admin.ModelAdmin):
    ordering = ('name',)

class VarietyAdmin(admin.ModelAdmin):
    #ordering = ('crop__species__genus__name',)
    ordering = ('crop__commonname__name',)

class GenusAdmin(admin.ModelAdmin):
    ordering = ('name',)

class CommonNameAdmin(admin.ModelAdmin):
    ordering = ('name',)

class PotOnRecordInline(admin.TabularInline):
    model = PotOnRecord
    extra = 1


class NurseryRecordAdmin(admin.ModelAdmin):
    fieldsets = [
        ('Variety',             {'fields': ['variety']}),
        ('Start Date',          {'fields': ['in_nursery_date']}),
        ('Germ Date',           {'fields': ['germ_date']}),
        ('Medium',              {'fields': ['medium']}),
        ('Tray Size (eg. 72)',  {'fields': ['tray_size_cell']}),
        ('Number Trays',        {'fields': ['number_trays']}),
    ]
    inlines = [PotOnRecordInline]


#class BedRecordInline(admin.TabularInline):
#    model = BedRecord
#    extra = 3

class BedAdmin(admin.ModelAdmin):
    list_display = ('name', 'site', 'bed_set', 'width', 'width_UOM',
                    'length', 'length_UOM')
    list_filter = ['bed_set', 'site', 'length']
    ordering = ('bed_set', 'name')
    fieldsets = [
        ('site',            {'fields': ['site']}),
        ('bed set',           {'fields': ['bed_set']}),
        ('name',            {'fields': ['name']}),
        ('width',  {'fields': ['width']}),
        ('width unit',  {'fields': ['width_UOM']}),
        ('length',   {'fields': ['length']}),
        ('length unit',  {'fields': ['length_UOM']}),
    ]
#    inlines = [BedRecordInline]


class BedRecordAdmin(admin.ModelAdmin):
    list_display = ('bed', 'variety', 'in_bed_date', 'out_bed_date', 'rows',
                    'spacing_in', 'seeder', 'bed_percent',)
    ordering = ('in_bed_date',)

class BedSetAdmin(admin.ModelAdmin):
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

class BuyerVarietyPriceAdmin(admin.ModelAdmin):
    fieldsets = [
        ('date_effective',            {'fields': ['date_effective']}),
        ('date_end',          {'fields': ['date_end']}),
        ('buyer',            {'fields': ['buyer']}),
        ('variety',          {'fields': ['variety']}),
        ('price',            {'fields': ['price']}),
        ('price_UOM',            {'fields': ['price_UOM']}),
    ]

class CropAdmin(admin.ModelAdmin):
    list_display = ('pref_common_name', 'species', 'genus', 'family')
    ordering = ('species', )
    #list_select_related = ('genus', 'species', 'family',)


class SpeciesAdmin(admin.ModelAdmin):
    #list_display = ('__unicode__', 'genus', 'family')
    ordering = ('genus__name', )

class ActionAdmin(admin.ModelAdmin):
    fieldsets = [
        ('start time',              {'fields': ['start_time']}),
        ('end time',                {'fields': ['end_time']}),
        ('action description',      {'fields': ['description']}),
    ]

class FertiliseInnoculateAdmin(admin.ModelAdmin):
    fieldsets = [
        ('start time',              {'fields': ['start_time']}),
        ('end time',                {'fields': ['end_time']}),
        ('action description',      {'fields': ['description']}),
        ('crop(s) in bed',             {'fields': ['bed_records']}),
        ('crop(s) in nursery',         {'fields': ['nursery_records']}),
        ('recipe',                  {'fields': ['recipe']}),
    ]

class AmmendInnoculateAdmin(admin.ModelAdmin):
    fieldsets = [
        ('start time',              {'fields': ['start_time']}),
        ('end time',                {'fields': ['end_time']}),
        ('action description',      {'fields': ['description']}),
        ('beds',                    {'fields': ['beds']}),
        ('recipe',                  {'fields': ['recipe']}),
    ]


class InputAdmin(admin.ModelAdmin):
    fieldsets = [
        ('description',             {'fields': ['description']}),
        ('supplier',                {'fields': ['supplier']}),
        ('price',                   {'fields': ['price']}),
        ('weight',                  {'fields': ['weight']}),
        ('volume',                  {'fields': ['volume']}),
    ]


admin.site.register(Crop, CropAdmin)
admin.site.register(Variety, VarietyAdmin)
admin.site.register(Genus, GenusAdmin)
admin.site.register(Species, SpeciesAdmin)
admin.site.register(CommonName)
admin.site.register(Bed, BedAdmin)
admin.site.register(BedSet, BedSetAdmin)
admin.site.register(Site)
admin.site.register(SoilMediumBatch)
admin.site.register(PotOnRecord)
admin.site.register(NurseryRecord, NurseryRecordAdmin)
admin.site.register(SeederRecord)
admin.site.register(HarvestRecord)
admin.site.register(BedRecord, BedRecordAdmin)
admin.site.register(Buyer)
admin.site.register(DeliveryRecord, DeliveryRecordAdmin)
admin.site.register(DeliveryItem)
admin.site.register(VarietyPrice)
admin.site.register(Family, FamilyAdmin)
admin.site.register(LengthUOM)
admin.site.register(YieldUOM)
admin.site.register(AreaUOM)
admin.site.register(BuyerVarietyPrice, BuyerVarietyPriceAdmin)
admin.site.register(Action, ActionAdmin)
admin.site.register(FertiliseInnoculate, FertiliseInnoculateAdmin)
admin.site.register(AmmendInnoculate, AmmendInnoculateAdmin)
admin.site.register(Input, InputAdmin)
admin.site.register(Supplier)
