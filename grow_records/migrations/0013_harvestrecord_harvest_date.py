# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0012_auto_20150809_1330'),
    ]

    operations = [
        migrations.AddField(
            model_name='harvestrecord',
            name='harvest_date',
            field=models.DateTimeField(null=True, verbose_name=b'harvest date'),
        ),
    ]
