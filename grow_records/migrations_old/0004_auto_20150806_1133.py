# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0003_auto_20150806_1109'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='bed',
            name='block',
        ),
        migrations.RemoveField(
            model_name='bed',
            name='site',
        ),
        migrations.RemoveField(
            model_name='block',
            name='site',
        ),
        migrations.RemoveField(
            model_name='commonname',
            name='crop',
        ),
        migrations.RemoveField(
            model_name='crop',
            name='genus',
        ),
        migrations.RemoveField(
            model_name='crop',
            name='species',
        ),
        migrations.DeleteModel(
            name='PropagationMethod',
        ),
        migrations.RemoveField(
            model_name='croprecord',
            name='variety',
        ),
        migrations.RemoveField(
            model_name='variety',
            name='crop',
        ),
        migrations.AddField(
            model_name='variety',
            name='crop_record',
            field=models.ForeignKey(to='grow_records.CropRecord', null=True),
        ),
        migrations.DeleteModel(
            name='Bed',
        ),
        migrations.DeleteModel(
            name='Block',
        ),
        migrations.DeleteModel(
            name='CommonName',
        ),
        migrations.DeleteModel(
            name='Crop',
        ),
        migrations.DeleteModel(
            name='Genus',
        ),
        migrations.DeleteModel(
            name='Site',
        ),
        migrations.DeleteModel(
            name='Species',
        ),
    ]
