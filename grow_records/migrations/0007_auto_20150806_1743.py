# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0006_nurseryrecord_number_trays'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bedrecord',
            name='nursery_record',
            field=models.ForeignKey(blank=True, to='grow_records.NurseryRecord', null=True),
        ),
    ]
