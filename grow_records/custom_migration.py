# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations

from grow_records.models import Site, Block

def populate_blocks(apps, schema_editor):
    site = Site(name='Croton Greenhouses')
    blocks = ('Lower', 'Middle', 'Top', 'Greenhouse West', 'Greenhouse East')           
    print blocks                                                                        
    for name in blocks:                                                                 
        print name                                                                      
        b = Block(name=name, site=site)                                                            
        b.save()                                                                        
        print 'saved', name, "as block"


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.RunPython(populate_blocks),
    ]
