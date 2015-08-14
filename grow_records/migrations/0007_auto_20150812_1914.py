# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0006_crop_common_name'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='commonname',
            name='species',
        ),
        migrations.RemoveField(
            model_name='crop',
            name='common_name',
        ),
        migrations.AddField(
            model_name='commonname',
            name='crop',
            field=models.ForeignKey(to='grow_records.Crop', null=True),
        ),
        migrations.AddField(
            model_name='crop',
            name='name',
            field=models.CharField(max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='commonname',
            name='name',
            field=models.CharField(max_length=100, null=True),
        ),
    ]
