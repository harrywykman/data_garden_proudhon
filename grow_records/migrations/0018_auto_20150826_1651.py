# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0017_auto_20150821_1316'),
    ]

    operations = [
        migrations.AlterField(
            model_name='potonrecord',
            name='medium',
            field=models.ForeignKey(blank=True, to='grow_records.SoilMediumBatch', null=True),
        ),
        migrations.AlterField(
            model_name='potonrecord',
            name='pot_size_in',
            field=models.IntegerField(null=True, verbose_name=b'pot size \\(inches\\)', blank=True),
        ),
    ]
