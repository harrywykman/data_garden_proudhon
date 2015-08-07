from django.http import HttpResponse
from django.shortcuts import render
from django.views import generic
from django.utils import timezone

from .models import Bed

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

class ResultsView(generic.DetailView):                                                 
    model = Bed                                                                   
    template_name = 'grow_records/results.html'
