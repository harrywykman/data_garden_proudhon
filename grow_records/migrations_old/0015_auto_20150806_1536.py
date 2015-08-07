# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0014_auto_20150806_1510'),
    ]

    operations = [
        migrations.CreateModel(
            name='BedRecord',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('bed', models.ForeignKey(to='grow_records.Bed', null=True)),
            ],
        ),
        migrations.CreateModel(
            name='NurseryRecord',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('start_date', models.DateTimeField(null=True, verbose_name=b'date of propagation')),
                ('germ_date', models.DateTimeField(null=True, verbose_name=b'date of germination')),
                ('tray_size_cell', models.IntegerField(null=True, verbose_name=b'tray size \\(number cells\\)')),
            ],
        ),
        migrations.CreateModel(
            name='PotOnRecord',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('pot_on_date', models.DateTimeField(verbose_name=b'date potted on')),
                ('pot_size_in', models.IntegerField(null=True, verbose_name=b'pot size \\(inches\\)')),
            ],
        ),
        migrations.CreateModel(
            name='SoilMediumBatch',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('created', models.DateTimeField(verbose_name=b'date medium created')),
                ('recipe', models.CharField(max_length=300)),
            ],
        ),
        migrations.AddField(
            model_name='potonrecord',
            name='medium',
            field=models.ForeignKey(to='grow_records.SoilMediumBatch', null=True),
        ),
        migrations.AddField(
            model_name='nurseryrecord',
            name='medium',
            field=models.ForeignKey(to='grow_records.SoilMediumBatch', null=True),
        ),
        migrations.AddField(
            model_name='croprecord',
            name='nursery_record',
            field=models.ForeignKey(to='grow_records.NurseryRecord', null=True),
        ),
    ]
