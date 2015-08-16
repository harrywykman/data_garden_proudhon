import datetime

from django.db import models
from django.utils import timezone

# Create your models here.

class AreaUOM(models.Model):                                                                                  
    FEET = 'ft2'                                                                                                 
    METRES = 'm2'                                                                                                
    ACRES = 'ac'
    HECTARES = 'ha'
    AREA_UNIT_CHOICES = (                                                                                     
        (FEET, 'ft^2'),                                                                                           
        (METRES, 'm^2')                                                                                           
    )                           
    unit = models.CharField(max_length=4, choices=AREA_UNIT_CHOICES)                                          
                                                                                                                
    def __unicode__(self):                                                                                      
        return self.unit 


class Site(models.Model):
    name = models.CharField(max_length=200)
    area = models.IntegerField(null=True)                                                                     
    area_UOM = models.ForeignKey(AreaUOM, related_name="site_area_UOM", null=True)
    
    def __unicode__(self):
        return self.name


class Block(models.Model):
    site = models.ForeignKey(Site, null=True)
    name = models.CharField(max_length=200)

    def __unicode__(self):                                                                             
        return self.name 

class LengthUOM(models.Model):
    INCHES = 'in'
    FEET = 'ft'                                                                                                                                     
    MILLIMETRES = 'mm'
    METRES = 'm'                                                                                                                                       
    LENGTH_UNIT_CHOICES = (                                                                                                                                    
        (INCHES, 'in'),
        (FEET, 'ft'),
        (MILLIMETRES, 'mm'),
        (METRES, 'm')
    )
    unit = models.CharField(max_length=2, choices=LENGTH_UNIT_CHOICES)

    def __unicode__(self):                                                                                                                          
        return self.unit


class Bed(models.Model):
    site = models.ForeignKey(Site, null=True)
    block = models.ForeignKey(Block, null=True)
    name = models.CharField(max_length=200)
    width = models.IntegerField(default=30)
    width_UOM = models.ForeignKey(LengthUOM, related_name="bed_width_UOM", null=True)
    length = models.IntegerField()
    length_UOM = models.ForeignKey(LengthUOM, related_name="bed_length_UOM", null=True)

    def bed_crop_history(self):
        return self.bedrecord_set.all().order_by('-in_bed_date')

    def __unicode__(self):                                                                             
        if self.block:
            name = "%s %s" % (self.block.name, self.name)
            return name
        return self.name 

    # returns area of bed
    #TODO create conversion methods for units to be able to calculate area
    # in standard measurement (imperial - ft, acres; metric - m, ha) 
    def area():
        pass   

class Family(models.Model):
    name = models.CharField(max_length=100)

    def __unicode__(self):                                                                                                                          
        return self.name

class Genus(models.Model):
    name = models.CharField(max_length=100)
    family = models.ForeignKey(Family, null=True)                                                                                

    def __unicode__(self):                                                      
        return self.name

class Species(models.Model):                                                    
    species = models.CharField(max_length=100)
    genus = models.ForeignKey(Genus, null=True)
                                                                                
    def __unicode__(self):                                                      
        return "%s %s" % (self.genus, self.species)
    
    __unicode__.admin_order_field = 'genus'

    def common_name():
        cn_set = Species.commonname_set.all().order_by('preferred')

    def family(self):
        return self.genus.family

    family.admin_order_field = 'genus__family'

class Crop(models.Model):
    name = models.CharField(max_length=100, null=True)
    species = models.ForeignKey(Species, null=True)
    

    def common_name():                                                                                          
        cn_set = Crop.commonname_set.all().order_by('preferred')

    def __unicode__(self):
        return "%s (%s)" % (self.name, self.species)

    def family(self):
        return self.species.genus.family

    family.admin_order_field = 'species__genus__family'

    def genus(self):                                                                                           
        return self.species.genus

    genus.admin_order_field = 'species__genus'

    def crop_history(self):                                                                    
        varieties = self.variety_set.all()
        bed_records = []
        for variety in varieties:
            bed_records.append(variety.bedrecord_set.all().order_by('-in_bed_date'))
        return bed_records

    # TODO - redundant method given bed_record.inground?
    def in_ground(self):
        """
        Returns True is crop is currently in a bed.
        """
        brs = self.objects.bedrecord_set.all().order_by('in_bed_date')
        print brs[0]
        if brs[0].out_bed_date:
            return False
        return True

    def in_nursery(self):                                                                           
        """                                                                                        
        Returns True is crop is currently in nursery.                                                
        """                                                                                        
        pass

    def varieties(self):
        """
        Returns a list of varieties.
        """
        return self.variety_set.all()

class CommonName(models.Model):                                                                                 
    name = models.CharField(max_length=100, null=True)                                                                     
    preferred = models.BooleanField(default=False)                                                              
    crop = models.ForeignKey(Crop, null=True)                                                                   
                                                                                                                
    def __unicode__(self):                                                                                      
        return self.name

class Variety(models.Model):
    crop = models.ForeignKey(Crop, null=True)
    name = models.CharField(max_length=100)
    
    def __unicode__(self):
        if self.crop:
            name = "%s var. %s" % (self.crop, self.name)
            return name
        return self.name 
    
    #TODO should be print_current_price.  current_price should return int
    def current_price(self):                                                                                                                        
        price = self.price_set.all().order_by('date')
        if price:
            return "%s / %s" % (price[0].price, price[0].unit)
        else:
            return "No price set for this variety"

class SoilMediumBatch(models.Model):
    created = models.DateTimeField('date medium created') 
    recipe = models.CharField(max_length=300)
    #TODO recipe should be quantities of inputs in models Inputs

    def __unicode__(self):                                                                                                                          
        return "Soil Medium created %s" % self.created


class NurseryRecord(models.Model):
    variety = models.ForeignKey(Variety, null=True)
    in_nursery_date = models.DateTimeField('date of propagation', null=True)
    germ_date = models.DateTimeField('date of germination', null=True, blank=True)
    tray_size_cell = models.IntegerField('tray size \(number cells\)', \
                                        null=True)
    number_trays = models.FloatField('number of trays', null=True)
    medium = models.ForeignKey(SoilMediumBatch, null=True)

    def __unicode__(self):
        name = self.in_nursery_date.strftime('%Y-%m-%d %H:%M') 
        if self.variety:
            name = "%s %s" % (self.variety, name)
        return name


class PotOnRecord(models.Model):                                                
    pot_on_date = models.DateTimeField('date potted on') 
    pot_size_in = models.IntegerField('pot size \(inches\)', null=True)         
    medium = models.ForeignKey(SoilMediumBatch, null=True)
    nursery_record = models.ForeignKey(NurseryRecord, null=True)

    def __unicode__(self):                                                                                                                          
        return "Potted on %s on %s" % (
                                        self.nursery_record.variety, 
                                        self.pot_on_date
                                      )

"""

class CropRecord(models.Model):
    variety = models.ForeignKey(Variety, null=True)
    bed = models.ForeignKey(Bed, null=True)
    rows = models.IntegerField(null=True)
    spacing_in = models.IntegerField('spacing \(inches\)', null=True)
    nursery_record = models.ForeignKey(NurseryRecord, null=True)

    def __unicode__(self):
        name = self.in_bed_date.strftime('%Y-%m-%d %H:%M')
        if self.variety:
            name = "%s %s" % (self.variety, name)
        return name

"""

class SeederRecord (models.Model):
    EARTHWAY = 'EW'
    GLASSER = 'GL'
    SEEDER_CHOICES = (
        (EARTHWAY, 'Earthway'),
        (GLASSER, 'Glasser'),
    )
    name = models.CharField(max_length=2, choices=SEEDER_CHOICES)
    seeder_settings = models.CharField(max_length=100, null=True)


class BedRecord(models.Model):
    in_bed_date = models.DateTimeField('transplant or seeding date', null=True)
    out_bed_date = models.DateTimeField('date crop removed', null=True, blank=True)
    bed = models.ForeignKey(Bed, null=True) 
    variety = models.ForeignKey(Variety, null=True)
    nursery_record = models.ForeignKey(NurseryRecord, null=True, blank=True)
    rows = models.IntegerField(null=True)
    spacing_in = models.IntegerField('spacing \(inches\)', null=True)
    seeder = models.ForeignKey(SeederRecord, null=True, blank=True)
    bed_percent = models.IntegerField('percentage of bed for crop', default=100, null=True)

    # TODO - redundant method given crop.inground?
    def in_ground(self):
        now = timezone.now()
        if self.in_bed_date < now and not self.out_bed_date:
            return True
        else:
            return False

    def __unicode__(self):
        if self.variety and self.bed:
            name = "%s - %s" % (self.bed, self.variety) 
        return name 


class YieldUOM(models.Model):
    KILOGRAMS = 'kg'                                                                                                                                   
    GRAMS = 'g'                                                                                                                                     
    POUNDS = 'lb'                                                                                                                              
    OUNCES= 'oz'                                                                                                                                    
    YIELD_UNIT_CHOICES = (                                                                                                                         
        (KILOGRAMS, 'kg'),                                                                                                                             
        (GRAMS, 'g'),                                                                                                                               
        (POUNDS, 'lb'),                                                                                                                        
        (OUNCES, 'oz')                                                                                                                               
    )
    unit = models.CharField(max_length=2, choices=YIELD_UNIT_CHOICES)
    
    def __unicode__(self):                                                                                                                          
        return self.unit


class HarvestRecord(models.Model):
    bed_record = models.ForeignKey(BedRecord, null=True)
    yield_UOM = models.ForeignKey(YieldUOM, null=True)
    yield_amount = models.FloatField('amount', default=0)
    harvest_date = models.DateTimeField('harvest date', null=True)

    def __unicode__(self):                                                                                                                          
        return "%s %s of %s from %s" % (self.yield_amount, self.yield_UOM, 
                                     self.bed_record.variety, 
                                     self.bed_record.bed)

class Buyer(models.Model):
    name = models.CharField(max_length=100, null=True)
    
    def __unicode__(self):                                                                                                                          
        return self.name

    
class DeliveryRecord(models.Model):
    date = models.DateTimeField('delivery_date', null=True)    
    buyer = models.ForeignKey(Buyer, null=True)

    def __unicode__(self):                                                                                                                          
        return "%s --- %s" % (self.buyer, self.date)

class Price(models.Model):
    variety = models.ForeignKey(Variety, null=True)
    date = models.DateTimeField('date price set', null=True, default=timezone.now)
    price = models.FloatField('price', default=0, null=True)
    price_UOM = models.ForeignKey(YieldUOM, null=True)

    def __unicode__(self):                                                                                                                          
        return "%s @ %s / %s" % (self.variety, self.price, self.price_UOM)

class DeliveryItem(models.Model):
    delivery_record = models.ForeignKey(DeliveryRecord, null=True)
    variety = models.ForeignKey(Variety, null=True)
    delivery_UOM = models.ForeignKey(YieldUOM, null=True)
    delivery_amount = models.FloatField('amount', default=0)
    price = models.ForeignKey(Price, null=True)

    def __unicode__(self):                                                                                                                                                                                                                                        
        return "%s - %s %s @ %s" % (self.variety, self.delivery_amount, self.delivery_UOM, self.price) 
