from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.IndexView.as_view(), name='index'),
    #url(r'^(?P<pk>[0-9]+)/$', views.DetailView.as_view(), name='detail'),
    #url(r'^(?P<pk>[0-9]+)/results/$', views.ResultsView.as_view(), name='results'),
    url(r'^beds/$', views.BedIndexView.as_view(), name='bed_index'),
    url(r'^beds/(?P<pk>[0-9]+)/$', views.BedDetailView.as_view(), name='bed_detail'),
    url(r'^crops/$', views.CropIndexView.as_view(), name='crop_index'),
    url(r'^current_crops/$', views.CurrentCropsIndexView.as_view(), name='current_crops_index'),
    url(r'^crops/(?P<pk>[0-9]+)/$', views.CropDetailView.as_view(), name='crop_detail'),
    #url(r'^crop_history/(?P<pk>[0-9]+)/$', views.CropHistoryView.as_view(), name='crop_history'),
    #url(r'^bed_records/$', views.BedRecordIndexView.as_view(), name='bed_record_index'),
    url(r'^buyers/$', views.BuyerIndexView.as_view(), name='buyer_index'),
    url(r'^buyers/(?P<pk>[0-9]+)/$', views.BuyerDetailView.as_view(), name='buyer_detail'),
    url(r'^deliveries/$', views.DeliveryRecordIndexView.as_view(), name='delivery_index'),
    url(r'^deliveries/(?P<pk>[0-9]+)/$', views.DeliveryRecordDetailView.as_view(), name='delivery_detail'),
    url(r'^actions/$', views.ActionIndexView.as_view(), name='action_index'),                        
    url(r'^actions/(?P<pk>[0-9]+)/$', views.ActionDetailView.as_view(), name='action_detail'),
    url(r'^act/$', views.ActionView.as_view(), name='action'),
    url(r'^ammend_innoculate/$', views.AmmendInnoculateCreate.as_view(), name='ammendinnoculate_form'),
    url(r'^add_crop/$', views.AddCropForm.as_view(), name='addcrop_form'),
    url(r'^variety/add/$', views.add_variety, name='add_variety'),
    url(r'^nursery/$', views.nursery_records_index, name='nursery_records_index'),
    url(r'^bed_records/$', views.bed_records_index, name='bed_records_index'),
]
