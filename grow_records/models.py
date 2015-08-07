import datetime

from django.db import models
from django.utils import timezone

# Create your models here.

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

class Variety(models.Model):
    crop = models.ForeignKey(Crop, null=True)
    name = models.CharField(max_length=100)
    
    def __unicode__(self):
        if self.crop:
            name = "%s var. %s" % (self.crop, self.name)
            return name
        return self.name 


class SoilMediumBatch(models.Model):
    created = models.DateTimeField('date medium created') 
    recipe = models.CharField(max_length=300)


class PotOnRecord(models.Model):
    pot_on_date = models.DateTimeField('date potted on')
    pot_size_in = models.IntegerField('pot size \(inches\)', null=True)
    medium = models.ForeignKey(SoilMediumBatch, null=True) 

class NurseryRecord(models.Model):
    variety = models.ForeignKey(Variety, null=True)
    start_date = models.DateTimeField('date of propagation', null=True)
    germ_date = models.DateTimeField('date of germination', null=True, blank=True)
    tray_size_cell = models.IntegerField('tray size \(number cells\)', \
                                        null=True)
    number_trays = models.FloatField('number of trays', null=True)
    medium = models.ForeignKey(SoilMediumBatch, null=True)

    def __unicode__(self):
        name = self.start_date.strftime('%Y-%m-%d %H:%M') 
        if self.variety:
            name = "%s %s" % (self.variety, name)
        return name


class PotOnRecord(models.Model):                                                
    pot_on_date = models.DateTimeField('date potted on') 
    pot_size_in = models.IntegerField('pot size \(inches\)', null=True)         
    medium = models.ForeignKey(SoilMediumBatch, null=True)
    nursery_record = models.ForeignKey(NurseryRecord, null=True)

# PROBABLY UNNECESSARY
class CropRecord(models.Model):
    variety = models.ForeignKey(Variety, null=True)
    record_date = models.DateTimeField('date record created')
    bed = models.ForeignKey(Bed, null=True)
    rows = models.IntegerField(null=True)
    spacing_in = models.IntegerField('spacing \(inches\)', null=True)
    nursery_record = models.ForeignKey(NurseryRecord, null=True)

    def __unicode__(self):
        name = self.record_date.strftime('%Y-%m-%d %H:%M')
        if self.variety:
            name = "%s %s" % (self.variety, name)
        return name

class SeederRecord (models.Model):
    EARTHWAY = 'EW'
    GLASSER = 'GL'
    SEEDER_CHOICES = (
        (EARTHWAY, 'Earthway'),
        (GLASSER, 'Glasser'),
    )
    name = models.CharField(max_length=2, choices=SEEDER_CHOICES)
    seeder_settings = models.CharField(max_length=2, null=True)


class BedRecord(models.Model):
    record_date = models.DateTimeField('transplant or seeding date', null=True)
    bed = models.ForeignKey(Bed, null=True) 
    variety = models.ForeignKey(Variety, null=True)
    nursery_record = models.ForeignKey(NurseryRecord, null=True, blank=True)
    rows = models.IntegerField(null=True)
    spacing_in = models.IntegerField('spacing \(inches\)', null=True)
    seeder = models.ForeignKey(SeederRecord, null=True, blank=True)

    def propagation_date():
        if nursery_record:
            date = nursery_record.start_date
        else:
            date = record_date
        return date

    def __unicode__(self):
        if self.variety and self.bed:
            name = "%s - %s" % (self.bed, self.variety) 
        return name 

    
