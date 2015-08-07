# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0005_remove_nurseryrecord_number_trays'),
    ]

    operations = [
        migrations.AddField(
            model_name='nurseryrecord',
            name='number_trays',
            field=models.IntegerField(null=True, verbose_name=b'number of trays'),
        ),
    ]
