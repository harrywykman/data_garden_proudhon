from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.IndexView.as_view(), name='index'),
    url(r'^(?P<pk>[0-9]+)/$', views.DetailView.as_view(), name='detail'),
    url(r'^(?P<pk>[0-9]+)/results/$', views.ResultsView.as_view(), name='results'),
    url(r'^beds/$', views.BedIndexView.as_view(), name='bed_index'),
    url(r'^beds/(?P<pk>[0-9]+)/$', views.BedDetailView.as_view(), name='bed_detail'),
    url(r'^crops/$', views.CropIndexView.as_view(), name='crop_index'),
    url(r'^current_crops/$', views.CurrentCropsIndexView.as_view(), name='current_crops_index'),
    url(r'^crops/(?P<pk>[0-9]+)/$', views.CropDetailView.as_view(), name='crop_detail'),
    #url(r'^crop_history/(?P<pk>[0-9]+)/$', views.CropHistoryView.as_view(), name='crop_history'),
    url(r'^bed_records/$', views.BedRecordIndexView.as_view(), name='bed_record_index'),
]

