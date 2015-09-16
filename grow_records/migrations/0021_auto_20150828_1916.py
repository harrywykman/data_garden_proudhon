# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0020_fertiliseinnoculate_recipe'),
    ]

    operations = [
        migrations.AlterField(
            model_name='action',
            name='description',
            field=models.TextField(null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='plantinteraction',
            name='bed_record',
            field=models.ForeignKey(blank=True, to='grow_records.BedRecord', null=True),
        ),
        migrations.AlterField(
            model_name='plantinteraction',
            name='nursery_record',
            field=models.ForeignKey(blank=True, to='grow_records.NurseryRecord', null=True),
        ),
    ]
