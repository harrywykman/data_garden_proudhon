from django.http import HttpResponse
from django.shortcuts import render
from django.views import generic
from django.utils import timezone

from .models import Bed, Crop, BedRecord

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
        return Crop.objects.all().order_by('common_name__name')

class CurrentCropsIndexView(generic.ListView):                                          
    models = BedRecord
    template_name = 'grow_records/current_crop_index.html'                              
    context_object_name = 'record_list'
                                                                                
    def get_queryset(self):                                                     
        """                                                                     
        Return list of current crops.                                                       
        """
        return BedRecord.objects.filter(out_bed_date__isnull=True).order_by('variety__crop__common_name__name')
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


class ResultsView(generic.DetailView):                                                 
    model = Bed                                                                   
    template_name = 'grow_records/results.html'
