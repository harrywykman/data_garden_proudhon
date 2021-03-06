import csv
from datetime import datetime, date, time

from django.http import HttpResponse
from django.shortcuts import render
from django.views import generic
from django.utils import timezone
from django.contrib import messages

from .models import (Bed, Crop, BedRecord, Buyer, DeliveryRecord, Action,
                     AmmendInnoculate, Variety, NurseryRecord, PotOnRecord, Site)
from .forms import (AmmendInnoculateForm, VarietyForm, CropForm, SpeciesForm,
                    GenusForm, FamilyForm)

# Create your views here.

class IndexView(generic.ListView):
    template_name = 'grow_records/index.html'
    context_object_name = 'bed_list'

    def get_queryset(self):
        """
        Return all beds.
        """
        return Bed.objects.all()

class DetailView(generic.DetailView):
    model = Bed
    template_name = 'grow_records/detail.html'

    def get_queryset(self):
        """
        Excludes any questions that aren't published yet.
        """
        return Bed.objects.all()

class BuyerIndexView(generic.ListView):
    template_name = 'grow_records/buyer_index.html'
    context_object_name = 'buyer_list'

    def get_queryset(self):
        """
        Return all buyers.
        """
        return Buyer.objects.all()

class BuyerDetailView(generic.DetailView):
    model = Buyer
    template_name = 'grow_records/buyer_detail.html'

    def get_queryset(self):
        """
        Excludes any questions that aren't published yet.
        """
        return Buyer.objects.all()

class DeliveryRecordIndexView(generic.ListView):
    template_name = 'grow_records/delivery_index.html'
    context_object_name = 'delivery_record_list'

    def get_queryset(self):
        """
        Return all buyers.
        """
        return DeliveryRecord.objects.all().order_by('date')

class DeliveryRecordDetailView(generic.DetailView):
    model = DeliveryRecord
    template_name = 'grow_records/delivery_detail.html'

    def get_queryset(self):
        """
        Excludes any questions that aren't published yet.
        """
        return DeliveryRecord.objects.all()

class BedIndexView(generic.ListView):
    template_name = 'grow_records/bed_index.html'
    context_object_name = 'bed_list'

    def get_queryset(self):
        """
        Return all beds.
        """
        return Bed.objects.all()


class BedDetailView(generic.DetailView):
    model = Bed
    template_name = 'grow_records/bed_detail.html'

    def get_queryset(self):
        """
        Excludes any questions that aren't published yet.
        """
        return Bed.objects.all()

class BedRecordIndexView(generic.ListView):
    template_name = 'grow_records/bed_record_index.html'
    context_object_name = 'bed_record_list'

    def get_queryset(self):
        """
        Return all beds.
        """
        return BedRecord.objects.all()


class CropIndexView(generic.ListView):
    template_name = 'grow_records/crop_index.html'
    context_object_name = 'crop_list'

    def get_queryset(self):
        """
        Return all crops.
        """
        return Crop.objects.all().order_by('commonname__name')


class CurrentCropsIndexView(generic.ListView):
    models = BedRecord
    template_name = 'grow_records/current_crop_index.html'
    context_object_name = 'record_list'

    def get_queryset(self):
        """
        Return list of current crops.
        """
        return BedRecord.objects.filter(out_bed_date__isnull=True).order_by('variety')
        #return BedRecord.objects.filter(out_bed_date__isnull=True).order_by('variety__crop__commonname__name')
        #return BedRecord.objects.filter(out_bed_date__isnull=True).distinct('variety__crop__common_name__name', 'variety').order_by('variety__crop__common_name__name')


#class CropHistoryView(generic.DetailView):
#    models = BedRecord
#    template_name = 'grow_records/crop_history.html'
#
#    def get_queryset(self):
#        """
#        Excludes any questions that aren't published yet.
#        """
#        return BedRecord.objects.all()


class CropDetailView(generic.DetailView):
    model = Crop
    template_name = 'grow_records/crop_detail.html'

    def get_queryset(self):
        """
        Excludes any questions that aren't published yet.
        """
        return Crop.objects.all()

class ActionIndexView(generic.ListView):
    template_name = 'grow_records/action_index.html'
    context_object_name = 'action_list'

    def get_queryset(self):
        """
        Return all action.
        """
        return Action.objects.all().select_subclasses().order_by('end_time')


class ActionDetailView(generic.DetailView):
    model = Action
    template_name = 'grow_records/action_detail.html'

    def get_queryset(self):
        """
        Excludes any questions that aren't published yet.
        """
        return Action.objects.all()

class ActionView(generic.DetailView):
    model = BedRecord
    template_name = 'grow_records/action.html'


class ResultsView(generic.DetailView):
    model = Bed
    template_name = 'grow_records/results.html'


class AmmendInnoculateCreate(generic.edit.CreateView):
    model = AmmendInnoculate
    fields = ['start_time', 'end_time', 'recipe', 'beds']
    
class AddCropForm(generic.edit.CreateView):
    model = Crop
    fields = ['species']

def site_index(request):
    return render(request, "grow_records/site_index.html",
            {'sites': Site.objects.all().order_by('name')})

class SiteDetailView(generic.DetailView):
    model = Site
    template_name = 'grow_records/site_detail.html'

def nursery_records_index(request):
    return render(request, "grow_records/nursery_records_index.html",
            {'nursery_records': NurseryRecord.objects.all().order_by('in_nursery_date')})

def bed_records_index(request):
    return render(request, "grow_records/bed_records_index.html",
            {'bed_records': BedRecord.objects.all().order_by('in_bed_date')})

def nursery_records_csv(request):
    """
    Create a csv file from nursery record data
    """
    now = datetime.now()
    nursery_records = NurseryRecord.objects.all().order_by('in_nursery_date')

    response = HttpResponse(content_type='text/csv')
    filename = "nursery_records_%s.csv" % (now.isoformat())
    response['Content-Disposition'] = 'attachment; filename=%s' % (filename)

    writer = csv.writer(response)
    writer.writerow(['Crop', 'Variety', 'Start Date', 'Germ Date', 'Tray Cells',
        '# Trays', 'Medium Batch', 'PO', 'TP'])

    for nursery_record in nursery_records:

        common_name = nursery_record.variety.crop.pref_common_name()
        variety_name = nursery_record.variety.name
        start_date = nursery_record.in_nursery_date
        germ_date = nursery_record.germ_date
        tray_size = nursery_record.tray_size_cell
        number_trays = nursery_record.number_trays
        medium = nursery_record.medium.created
        potted_on = ""
        if nursery_record.potted_on():
            for pot_on_record in nursery_record.pot_on_records():
               potted_on = potted_on + " %S" % (POT_ON_Record.pot_on_date)
        else:
            potted_on = "N"
        transplanted = ""
        if nursery_record.transplanted():
            for bed_record in nursery_record.bed_records():
                transplanted = transplanted + " %s" % (bed_record)
        else:
            transplanted = "N"
        row = [common_name, variety_name, start_date, germ_date,                            
                tray_size, number_trays, medium, potted_on, transplanted]                     
        writer.writerow(row)                                                                       
                                                                                                   
    return response   

def bed_records_csv(request):
    """
    Create a csv file from bed record data
    """
    now = datetime.now()
    bed_records = BedRecord.objects.all().order_by('in_bed_date')

    response = HttpResponse(content_type='text/csv')
    filename = "bed_records_%s.csv" % (now.isoformat())
    response['Content-Disposition'] = 'attachment; filename=%s' % (filename)

    writer = csv.writer(response)
    writer.writerow(['Crop', 'Variety', 'Nursery Date', 'In Bed Date', 'Out Bed Date', 'Bed',
        '% Bed', '# Rows', 'Spacing', 'Seeder'])

    for bed_record in bed_records:
        common_name = bed_record.variety.crop.pref_common_name()
        variety_name = bed_record.variety.name
        if bed_record.nursery_record:
            in_nursery_date = bed_record.nursery_record.in_nursery_date
        else:
            in_nursery_date = ""
        in_bed_date = bed_record.in_bed_date
        out_bed_date = bed_record.out_bed_date
        bed = bed_record.bed
        bed_percent = bed_record.bed_percent
        rows = bed_record.rows
        spacing_in = bed_record.spacing_in
        if bed_record.seeder:
            seeder_name = bed_record.seeder.name
        else:
            seeder_name = ""

        row = [common_name, variety_name, in_nursery_date, in_bed_date,
                out_bed_date, bed, bed_percent, rows, spacing_in, seeder_name]
        writer.writerow(row)

    return response

def add_variety(request):
    if request.method == 'POST': # If the form has been submitted...
        form = VarietyForm(request.POST) # A form bound to the POST data
        if form.is_valid(): # All validation rules pass
            print "form is valid"
            # Process the data in form.cleaned_data
            variety_name = form.cleaned_data['name']
            print "Variety name: %s" % (variety_name)
            crop = form.cleaned_data['crop']
            print "Crop obj: %s" % (crop)
            crop_id = crop.id
            print "Crop id: %s" % (crop_id)
            variety_exists = Variety.objects.filter(name = variety_name,
                                                 crop = crop_id)
            print "Does is already exist? %s" % (variety_exists)
            if variety_exists:
                messages.error(request, """ No variety added.
                                        A variety with name \'%s\' and crop id
                                        \'%s\' already exists. """
                                        % (variety_name, crop_id))
                return render(request, 'grow_records/add_variety.html', {'form': form,})
            else:
                form.save()
                messages.success(request, """ A variety with name \'%s\' and crop
                    id \'%s\' was successfully added."""
                    % (variety_name, crop_id))
                return render(request, 'grow_records/add_variety.html', {'form': form,})
    else:
        form = VarietyForm()

    return render(request, 'grow_records/add_variety.html', {'form': form,})

"""
def add_variety(request):
    if request.method == "POST":
        vform = VarietyForm(request.POST, instance=Variety())
        cform = CropForm(request.POST, instance=Crop())
        sform = CropForm(request.POST, instance=Species())
        gform = CropForm(request.POST, instance=Genus())
        fform = CropForm(request.POST, instance=Family())
        if pform.is_valid() and all([cf.is_valid() for cf in cforms]):
            new_poll = pform.save()
            for cf in cforms:
                new_choice = cf.save(commit=False)
                new_choice.poll = new_poll
                new_choice.save()
            return HttpResponseRedirect('/varieties/add/')
    else:
        vform = VarietyForm(request.POST, instance=Variety())
        cform = CropForm(request.POST, instance=Crop())
        sform = CropForm(request.POST, instance=Species())
        gform = CropForm(request.POST, instance=Genus())
        fform = CropForm(request.POST, instance=Family())
    return render_to_response('add_variety.html', {'variety_form': vform,
                                                    'crop_form': cform
                                                    'species_form': sform
                                                    'genus_form': gform
                                                    'family_form': fform
                                                    })

"""
