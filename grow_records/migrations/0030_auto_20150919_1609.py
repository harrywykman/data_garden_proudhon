# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0029_remove_supplier_address'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='plantinteraction',
            name='bed_record',
        ),
        migrations.RemoveField(
            model_name='plantinteraction',
            name='nursery_record',
        ),
        migrations.AddField(
            model_name='plantinteraction',
            name='bed_recordss',
            field=models.ManyToManyField(to='grow_records.BedRecord', null=True, blank=True),
        ),
        migrations.AddField(
            model_name='plantinteraction',
            name='nursery_records',
            field=models.ManyToManyField(to='grow_records.NurseryRecord', null=True, blank=True),
        ),
    ]
