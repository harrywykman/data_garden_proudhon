# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0008_auto_20150806_1748'),
    ]

    operations = [
        migrations.AlterField(
            model_name='nurseryrecord',
            name='number_trays',
            field=models.FloatField(null=True, verbose_name=b'number of trays'),
        ),
    ]
