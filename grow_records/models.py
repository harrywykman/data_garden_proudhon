import datetime

from django.db import models
from django.utils import timezone

# Create your models here.

KILOGRAM = 'kg'                                                                                                                                 
POUND = 'lb'                                                                                                                                    
UNIT_CHOICES = (                                                                                                                                
    (KILOGRAM, 'kilogram'),                                                                                                                     
    (POUND, 'pound'),                                                                                                                           
) 

class Site(models.Model):
    name = models.CharField(max_length=200)
    
    def __unicode__(self):
        return self.name

class Block(models.Model):
    site = models.ForeignKey(Site, null=True)
    name = models.CharField(max_length=200)

    def __unicode__(self):                                                                             
        return self.name 

class Bed(models.Model):
    site = models.ForeignKey(Site, null=True)
    block = models.ForeignKey(Block, null=True)
    name = models.CharField(max_length=200)
    width_in = models.IntegerField(default=30)
    length_ft = models.IntegerField()

    def bed_crop_history(self):
        return self.bedrecord_set.all().order_by('-in_bed_date')

    def __unicode__(self):                                                                             
        if self.block:
            name = "%s %s" % (self.block.name, self.name)
            return name
        return self.name 

class Genus(models.Model):
    name = models.CharField(max_length=100)
                                                                                
    def __unicode__(self):                                                      
        return self.name

class Species(models.Model):                                                    
    name = models.CharField(max_length=100)                                     
                                                                                
    def __unicode__(self):                                                      
        return self.name

class CommonName(models.Model):                                                 
    name = models.CharField(max_length=100)                                     
                                                                                
    def __unicode__(self):                                                      
        return self.name

class Crop(models.Model):
    genus = models.ForeignKey(Genus, null=True)
    species = models.ForeignKey(Species, null=True)
    common_name = models.ForeignKey(CommonName, null=True)

    def __unicode__(self):
        name = ""        
        if self.common_name:
            name = "%s" % self.common_name
        elif self.genus and self. species:
            name = "%s %s" % (self.genus.name, self.species.name)
        return name

    def crop_history(self):                                                                    
        varieties = self.variety_set.all()
        bed_records = []
        for variety in varieties:
            bed_records.append(variety.bedrecord_set.all().order_by('-in_bed_date'))
        return bed_records

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

class Variety(models.Model):
    crop = models.ForeignKey(Crop, null=True)
    name = models.CharField(max_length=100)
    
    def __unicode__(self):
        if self.crop:
            name = "%s var. %s" % (self.crop, self.name)
            return name
        return self.name 

    def current_price(self):                                                                                                                        
        price = self.price_set.all().order_by('date')
        if price:
            return "%s / %s" % (price[0].price, price[0].unit)
        else:
            return "No price set for this variety"

class SoilMediumBatch(models.Model):
    created = models.DateTimeField('date medium created') 
    recipe = models.CharField(max_length=300)


class PotOnRecord(models.Model):
    pot_on_date = models.DateTimeField('date potted on')
    pot_size_in = models.IntegerField('pot size \(inches\)', null=True)
    medium = models.ForeignKey(SoilMediumBatch, null=True) 

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
    out_bed_date = models.DateTimeField('date crop removed', null=True)
    bed = models.ForeignKey(Bed, null=True) 
    variety = models.ForeignKey(Variety, null=True)
    nursery_record = models.ForeignKey(NurseryRecord, null=True, blank=True)
    rows = models.IntegerField(null=True)
    spacing_in = models.IntegerField('spacing \(inches\)', null=True)
    seeder = models.ForeignKey(SeederRecord, null=True, blank=True)
    bed_percent = models.IntegerField('percentage of bed for crop', default=100, null=True)

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

class HarvestRecord(models.Model):
    bed_record = models.ForeignKey(BedRecord, null=True)
    unit = models.CharField(max_length=2, null=True, choices=UNIT_CHOICES)
    amount = models.FloatField('amount', default=0)
    harvest_date = models.DateTimeField('harvest date', null=True)

    def __unicode__(self):                                                                                                                          
        return "%s %s of %s from %s" % (self.amount, self.unit, 
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
    unit = models.CharField(max_length=2, null=True, choices=UNIT_CHOICES)

    def __unicode__(self):                                                                                                                          
        return "%s @ %s / %s" % (self.variety, self.price, self.unit)

class DeliveryItem(models.Model):
    delivery_record = models.ForeignKey(DeliveryRecord, null=True)
    variety = models.ForeignKey(Variety, null=True)
    unit = models.CharField(max_length=2, null=True, choices=UNIT_CHOICES)
    amount = models.FloatField('amount)', default=0)
    price = models.ForeignKey(Price, null=True)

    def __unicode__(self):                                                                                                                                                                                                                                        
        return "%s - %s %s @ %s" % (self.variety, self.amount, self.unit, self.price) 
