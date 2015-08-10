# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0016_auto_20150810_1659'),
    ]

    operations = [
        migrations.RenameField(
            model_name='deliveryitem',
            old_name='unit_amount',
            new_name='amount',
        ),
    ]
