# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0003_auto_20150812_1751'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='crop',
            name='common_name',
        ),
        migrations.AddField(
            model_name='commonname',
            name='species',
            field=models.ForeignKey(to='grow_records.Species', null=True),
        ),
    ]
