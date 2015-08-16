# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0009_auto_20150814_1838'),
    ]

    operations = [
        migrations.RenameField(
            model_name='harvestrecord',
            old_name='yeild_UOM',
            new_name='yield_UOM',
        ),
        migrations.RenameField(
            model_name='harvestrecord',
            old_name='yeild_amount',
            new_name='yield_amount',
        ),
    ]
