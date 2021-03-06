import datetime
import moneyed

from django.db import models
from django.utils import timezone

from moneyed import Money, USD, AUD
from djmoney.models.fields import MoneyField
from django_measurement.models import MeasurementField
from measurement.measures import Weight, Volume, Area
from model_utils.managers import InheritanceManager
#from address.models import AddressField

#TODO Use django measurement (https://pypi.python.org/pypi/django-measurement/)
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

class Location(models.Model):
    name = models.CharField(max_length=200)

class Site(models.Model):
    name = models.CharField(max_length=200)
    area = models.IntegerField(null=True)
    area_UOM = models.ForeignKey(
                                 AreaUOM,
                                 related_name="site_area_UOM",
                                 null=True
                                )

    def sets(self):
        return self.bedset_set.all().order_by('name')

    def __unicode__(self):
        return self.name


class BedSet(models.Model):
    name = models.CharField(max_length=200)
    site = models.ForeignKey(Site, null=True)

    def bedset(self):
        return self.bed_set.all().order_by('name')
        #return self.bed_set.all().extra(select={'int_name': 'CAST(name AS INTEGER)'}, order_by=['int_name'])


    def __unicode__(self):
        return self.name

#TODO Use django measurement (https://pypi.python.org/pypi/django-measurement/)
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
    bed_set = models.ForeignKey(BedSet, null=True)
    name = models.CharField(max_length=200)
    width = models.IntegerField(default=30)
    width_UOM = models.ForeignKey(
                                  LengthUOM,
                                  related_name="bed_width_UOM",
                                  null=True)
    length = models.IntegerField()
    length_UOM = models.ForeignKey(
                                   LengthUOM,
                                   related_name="bed_length_UOM",
                                   null=True
                                  )

    def bed_crop_history(self):
        return self.bedrecord_set.all().order_by('in_bed_date')

    def actions(self):
        return self.bedinteraction_set.all().select_subclasses().order_by('end_time')

    def __unicode__(self):
        if self.bed_set:
            name = "%s %s" % (self.bed_set.name, self.name)
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

    #__unicode__.admin_order_field = 'genus'

    def common_name():
        cn_set = Species.commonname_set.all().order_by('preferred')

    def family(self):
        return self.genus.family

    #family.admin_order_field = 'genus__family'

class Crop(models.Model):
    species = models.ForeignKey(Species, null=True)

    def pref_common_name(self):
        pcn = self.commonname_set.all().filter(preferred=True)
        count = pcn.count()
        if count > 0:
            return str(pcn[0])
        else:
            return "No Preferred Common Name"

    def __unicode__(self):
        #pcn = str(self.pref_common_name())
        return "%s %s %s" % (self.pref_common_name(), self.species.genus, self.species.species)

    def family(self):
        return self.species.genus.family

    family.admin_order_field = 'species__genus__family'

    def genus(self):
        return self.species.genus

    genus.admin_order_field = 'species__genus'

    def varieties(self):
        return self.variety_set.all()

    def crop_history(self):
        bed_records = []
        nursery_records = []
        #records = {}
        for variety in self.varieties():
            for record in variety.bedrecord_set.all().order_by('-in_bed_date'):
                bed_records.append(record)
                #records[record.in_bed_date] = record
            for record in variety.nurseryrecord_set.all().order_by('-in_nursery_date'):
                nursery_records.append(record)
                #records[record.in_nursery_date] = record
        # TODO return objects sorted by date
        return bed_records + nursery_records

    def actions(self):
        actions = []
        for record in self.crop_history():
            for action in record.plantinteraction_set.all().select_subclasses().order_by('end_time'):
                if action not in actions:
                    actions.append(action)
        return actions

    # TODO - redundant method given bed_record.inground?
    def in_ground(self):
        """
        Returns True if crop is currently in a bed.
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

    def save(self, *args, **kwargs):
        if self.preferred:
            try:
                temp = CommonName.objects.get(preferred=True, crop=self.crop)
                if self != temp:
                    temp.preferred = False
                    temp.save()
            except CommonName.DoesNotExist:
                pass
        super(CommonName, self).save(*args, **kwargs)

    def __unicode__(self):
        return self.name

class Variety(models.Model):
    crop = models.ForeignKey(Crop, null=True)
    name = models.CharField(max_length=100)

    def __unicode__(self):
        if self.crop:
            name = "%s var. %s" % (self.crop.pref_common_name(), self.name)
            return name
        return self.name

    def current_price():
        pass

    def current_buyer_price(self, buyer):
        bvp = self.buyervarietyprice_set.all().filter(buyer=buyer, date_end=None)
        count = bvp.count()
        if count > 0:
            return (bvp[0].price, bvp[0].price_UOM)
        else:
            return (0.0, None)

    def print_current_price(self):
        price = self.varietyprice_set.all().filter(date_end=None).order_by('date_effective')
        if price:
            return "%s / %s" % (price[0].price, price[0].price_UOM)
        else:
            return "No price set for this variety"

class SoilMediumBatch(models.Model):
    created = models.DateField('date medium created', default=timezone.now)
    recipe = models.CharField(max_length=300)
    #TODO recipe should be quantities of inputs in models Inputs

    def __unicode__(self):
        return "Batch %s" % self.created

class PlantRecord(models.Model):
    pass
    #variety = models.ForeignKey(Variety, null=True)

# better if CHILD of PlantRecord
class NurseryRecord(models.Model):
    variety = models.ForeignKey(Variety, null=True)
    in_nursery_date = models.DateField(
                                       'date of propagation',
                                        null=True,
                                       default=timezone.now)
    germ_date = models.DateField('date of germination', null=True, blank=True)
    tray_size_cell = models.IntegerField('tray size \(number cells\)', \
                                        null=True)
    number_trays = models.FloatField('number of trays', null=True)
    medium = models.ForeignKey(SoilMediumBatch, null=True)

    def __unicode__(self):
        name = self.in_nursery_date.strftime('%Y-%m-%d %H:%M')
        if self.variety:
            name = "nursery - %s %s" % (self.variety, name)
        return name

    def potted_on(self):
        if self.potonrecord_set.all():
            return True
        else:
            return False

    def pot_on_records(self):
        return self.potonrecord_set.all()

    def transplanted(self):
        if BedRecord.objects.filter(nursery_record = self.id):
            return True
        else:
            return False

    def bed_records(self):
        return BedRecord.objects.filter(nursery_record = self.id)

class PotOnRecord(models.Model):
    pot_on_date = models.DateField('date potted on', default=timezone.now)
    pot_size_in = models.IntegerField('pot size \(inches\)', null=True, blank=True)
    medium = models.ForeignKey(SoilMediumBatch, null=True, blank=True)
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

    def __unicode__(self):
        if self.name and self.seeder_settings:
            name = "%s --- %s" % (self.name, self.seeder_settings)
        else:
            name = "%s" % (self.name)
        return name

# better if CHILD of PlantRecord
class BedRecord(models.Model):
    in_bed_date = models.DateField(
                                   'transplant or seeding date',
                                   null=True,
                                   default=timezone.now
                                  )
    out_bed_date = models.DateField('date crop removed', null=True, blank=True)
    bed = models.ForeignKey(Bed, null=True)
    variety = models.ForeignKey(Variety, null=True)
    nursery_record = models.ForeignKey(NurseryRecord, null=True, blank=True)
    rows = models.IntegerField(null=True)
    spacing_in = models.IntegerField('spacing \(inches\)', null=True)
    seeder = models.ForeignKey(SeederRecord, null=True, blank=True)
    bed_percent = models.IntegerField(
                                      'percentage of bed for crop',
                                      default=100,
                                      null=True)

    # TODO - redundant method given crop.inground?
    def in_ground(self):
        now = timezone.now()
        if self.in_bed_date < now.date() and not self.out_bed_date:
            return True
        else:
            return False

    def __unicode__(self):
        if self.variety and self.bed:
            name = "%s" % (self.bed)
        return name

#TODO Use django measurement (https://pypi.python.org/pypi/django-measurement/)
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
    harvest_date = models.DateField(
                                    'harvest date',
                                    null=True,
                                    default=timezone.now
                                   )

    def __unicode__(self):
        return "%s %s of %s from %s" % (self.yield_amount, self.yield_UOM,
                                     self.bed_record.variety,
                                     self.bed_record.bed)

class Buyer(models.Model):
    name = models.CharField(max_length=100, null=True)

    def price_list_current(self):
        return self.buyervarietyprice_set.all().filter(date_end__isnull=True).order_by('-variety__crop')


    def variety_volume_delivered(self):
        """ Returns a sorted list of lists of all the varieties delivered
        to a particular buyer in the form [variety object, amount in kg,
        number of deliveries]
        """
        varieties = {}
        delivery_records = self.deliveryrecord_set.all()
        for dr in delivery_records:
            items = dr.items()
            # Get each item and append unique varieties to a list while keeping
            # a running total of amount of variety and number of deliveries.
            for item in items:
                variety = item.variety
                # unique identifier because includes botanical name
                # TODO make rely on botanical name function
                key = variety.__unicode__()
                number_times_delivered = 1
                var_amount = [item.variety, item.delivery_amount, 
                    number_times_delivered, item.value()]
                if key not in varieties:
                    varieties[key] = var_amount
                else:
                    varieties[key][1] += item.delivery_amount
                    varieties[key][2] += 1
                    varieties[key][3] += item.value()
                    print "running value: %s" % (varieties[key][3])
        vs = []
        # discard unique dictionary key and create new sorted list of values
        for key, item in varieties.iteritems():
            vs.append(item)
            sorted_vs = sorted(vs, key=lambda x: x[0].__unicode__())
        return sorted_vs

    def duplicate(self):
        self.pk = None
        self.name += " (copy)"
        self.save()
        return self

    def __unicode__(self):
        return self.name


class DeliveryRecord(models.Model):
    date = models.DateField('delivery_date', null=True, default=timezone.now)
    buyer = models.ForeignKey(Buyer, null=True)

    def duplicate(self, buyer):
        self.pk = None
        self.buyer = buyer 
        items = self.items()
        self.save()
        self.deliveryitem_set = items
        return self

    def items(self):
        return self.deliveryitem_set.all()

    def value(self):
        items = self.deliveryitem_set.all()
        value = 0.0
        print "items --- %s" % (items)
        if items:
            for item in items:
                value += item.value()
        return value

    def __unicode__(self):
        return "%s --- %s" % (self.buyer, self.date)


class VarietyPrice(models.Model):
    variety = models.ForeignKey(Variety, null=True)
    date_effective = models.DateTimeField(
                                      'date price set',
                                      null=True,
                                      default=timezone.now
                                     )
    date_end = models.DateTimeField('date price expires', null=True, blank=True)
    #TODO make MoneyField (https://pypi.python.org/pypi/django-moneyfield/0.2.1)
    price = models.FloatField('price', default=0, null=True)
    price_UOM = models.ForeignKey(YieldUOM, null=True)

    def save(self, *args, **kwargs):
        now = timezone.now()
        print self.date_effective
        print self.date_end
        test = self.date_effective < now and not self.date_end
        print test
        if self.date_effective < now and not self.date_end:
            try:
                temp = VarietyPrice.objects.get(
                                                variety=self.variety,
                                                date_end=None
                                               )
                if self != temp:
                    print "Temp record exists"
                    temp.date_end = now
                    temp.save()
            except VarietyPrice.DoesNotExist:
                pass
        super(VarietyPrice, self).save(*args, **kwargs)

    def __unicode__(self):
        return "%s @ %s / %s" % (self.variety, self.price, self.price_UOM)

class BuyerVarietyPrice(models.Model):
    variety = models.ForeignKey(Variety, null=True)
    buyer = models.ForeignKey(Buyer, null=True)
    date_effective = models.DateTimeField(
                                      'date price set',
                                      null=True,
                                      default=timezone.now
                                     )
    date_end = models.DateTimeField('date price expires', null=True, blank=True)
    price = models.FloatField('price', default=0, null=True)
    price_UOM = models.ForeignKey(YieldUOM, null=True)

    def save(self, *args, **kwargs):
        now = timezone.now()
        print self.date_effective
        print self.date_end
        test = self.date_effective < now and not self.date_end
        print test
        if self.date_effective < now and not self.date_end:
            try:
                temp = BuyerVarietyPrice.objects.get(buyer=self.buyer, variety=self.variety, date_end=None)
                if self != temp:
                    print "Temp record exists"
                    temp.date_end = now
                    temp.save()
            except BuyerVarietyPrice.DoesNotExist:
                pass
        super(BuyerVarietyPrice, self).save(*args, **kwargs)

    def __unicode__(self):
        return "%s - %s @ %s / %s" % (self.buyer, self.variety, self.price, self.price_UOM)

class DeliveryItem(models.Model):
    delivery_record = models.ForeignKey(DeliveryRecord, null=True)
    variety = models.ForeignKey(Variety, null=True)
    delivery_UOM = models.ForeignKey(YieldUOM, null=True)
    delivery_amount = models.FloatField('amount', default=0)

    def value(self):
        buyer = self.delivery_record.buyer
        date = self.delivery_record.date
        #TODO change ASSUMPTION delivery_UOM == price_UOM for now
        #TODO change ASSUMPTION price at delivery record date is current price
        current_price_tuple = self.variety.current_buyer_price(buyer)
        current_price = current_price_tuple[0]
        print current_price
        value = current_price * self.delivery_amount
        print value
        return value

    def __unicode__(self):
        return "%s - %s %s" % (
                               self.variety,
                               self.delivery_amount,
                               self.delivery_UOM
                              )

class Tool(models.Model):
    name = models.CharField(max_length=200)

class Action(models.Model):
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    # location = models.ForeignKey(Location, null=True)
    # tools
    description = models.TextField(null=True, blank=True)

    objects = InheritanceManager()

    def duration(self):
        delta = self.end_time - self.start_time
        minutes = delta.seconds / 60
        return "%s minutes" % (minutes)

    def __unicode__(self):
        duration = self.duration()
        return "ACTION: %s | DURATION: %s" % (
                               self.description,
                               duration
                              )


class PlantInteraction(Action):
    bed_records = models.ManyToManyField(BedRecord, null=True, blank=True)
    #bed_record = models.ForeignKey(BedRecord, null=True, blank=True)
    nursery_records = models.ManyToManyField(NurseryRecord, null=True, blank=True)
    #nursery_record = models.ForeignKey(NurseryRecord, null=True, blank=True)

    objects = InheritanceManager()

class FertiliseInnoculate(PlantInteraction):
    recipe = models.TextField(null=True)

    def __unicode__(self):
        duration = self.duration()

        return "FERTILISED / INNOCULATED: %s | DURATION: %s" % (
                               self.description,
                               duration
                              )

class Protect(PlantInteraction):
    pass

class BedInteraction(Action):
    beds = models.ManyToManyField(Bed)
    #bed = models.ForeignKey(Bed, null=True)

    objects = InheritanceManager()

class AmmendInnoculate(BedInteraction):
    recipe = models.TextField(null=True)

    def __unicode__(self):
        duration = self.duration()
        return "AMMEND / INNOCULATE: %s | %s | DURATION: %s" % (
                               self.description,
                               self.recipe,
                               duration
                              )


class Supplier(models.Model):
    name = models.CharField(max_length=200)
    # address = AddressField()


class Input(models.Model):
    description = models.CharField(max_length=200)
    supplier = models.ForeignKey(Supplier)
    price = MoneyField(max_digits=10, decimal_places=2, default_currency='USD')
    weight = MeasurementField(measurement=Weight, null=True, blank=True)
    volume = MeasurementField(measurement=Volume, null=True, blank=True)
