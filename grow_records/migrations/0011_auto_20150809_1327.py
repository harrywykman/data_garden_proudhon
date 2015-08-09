# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0010_auto_20150808_1531'),
    ]

    operations = [
        migrations.CreateModel(
            name='HarvestRecord',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('weight_kg', models.FloatField(verbose_name=0)),
            ],
        ),
        migrations.RemoveField(
            model_name='croprecord',
            name='bed',
        ),
        migrations.RemoveField(
            model_name='croprecord',
            name='nursery_record',
        ),
        migrations.RemoveField(
            model_name='croprecord',
            name='variety',
        ),
        migrations.AddField(
            model_name='bedrecord',
            name='bed_percent',
            field=models.IntegerField(null=True, verbose_name=100),
        ),
        migrations.DeleteModel(
            name='CropRecord',
        ),
        migrations.AddField(
            model_name='harvestrecord',
            name='bed_record',
            field=models.ForeignKey(to='grow_records.BedRecord', null=True),
        ),
    ]
