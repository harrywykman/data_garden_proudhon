# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Bed',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('width_in', models.IntegerField(default=30)),
                ('length_ft', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='BedRecord',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('record_date', models.DateTimeField(null=True, verbose_name=b'transplant or seeding date')),
                ('rows', models.IntegerField(null=True)),
                ('spacing_in', models.IntegerField(null=True, verbose_name=b'spacing \\(inches\\)')),
                ('bed', models.ForeignKey(to='grow_records.Bed', null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Block',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='CommonName',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Crop',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('common_name', models.ForeignKey(to='grow_records.CommonName', null=True)),
            ],
        ),
        migrations.CreateModel(
            name='CropRecord',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('record_date', models.DateTimeField(verbose_name=b'date record created')),
                ('rows', models.IntegerField(null=True)),
                ('spacing_in', models.IntegerField(null=True, verbose_name=b'spacing \\(inches\\)')),
                ('bed', models.ForeignKey(to='grow_records.Bed', null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Genus',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='NurseryRecord',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('start_date', models.DateTimeField(null=True, verbose_name=b'date of propagation')),
                ('germ_date', models.DateTimeField(null=True, verbose_name=b'date of germination', blank=True)),
                ('tray_size_cell', models.IntegerField(null=True, verbose_name=b'tray size \\(number cells\\)')),
                ('number_trays', models.IntegerField(null=True, verbose_name=b'number of trays')),
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
            name='SeederRecord',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=2, choices=[(b'EW', b'Earthway'), (b'GL', b'Glasser')])),
                ('seeder_settings', models.CharField(max_length=2, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Site',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
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
        migrations.CreateModel(
            name='Species',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Variety',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100)),
                ('crop', models.ForeignKey(to='grow_records.Crop', null=True)),
            ],
        ),
        migrations.AddField(
            model_name='potonrecord',
            name='medium',
            field=models.ForeignKey(to='grow_records.SoilMediumBatch', null=True),
        ),
        migrations.AddField(
            model_name='potonrecord',
            name='nursery_record',
            field=models.ForeignKey(to='grow_records.NurseryRecord', null=True),
        ),
        migrations.AddField(
            model_name='nurseryrecord',
            name='medium',
            field=models.ForeignKey(to='grow_records.SoilMediumBatch', null=True),
        ),
        migrations.AddField(
            model_name='nurseryrecord',
            name='variety',
            field=models.ForeignKey(to='grow_records.Variety', null=True),
        ),
        migrations.AddField(
            model_name='croprecord',
            name='nursery_record',
            field=models.ForeignKey(to='grow_records.NurseryRecord', null=True),
        ),
        migrations.AddField(
            model_name='croprecord',
            name='variety',
            field=models.ForeignKey(to='grow_records.Variety', null=True),
        ),
        migrations.AddField(
            model_name='crop',
            name='genus',
            field=models.ForeignKey(to='grow_records.Genus', null=True),
        ),
        migrations.AddField(
            model_name='crop',
            name='species',
            field=models.ForeignKey(to='grow_records.Species', null=True),
        ),
        migrations.AddField(
            model_name='block',
            name='site',
            field=models.ForeignKey(to='grow_records.Site', null=True),
        ),
        migrations.AddField(
            model_name='bedrecord',
            name='nursery_record',
            field=models.ForeignKey(to='grow_records.NurseryRecord', null=True),
        ),
        migrations.AddField(
            model_name='bedrecord',
            name='variety',
            field=models.ForeignKey(to='grow_records.Variety', null=True),
        ),
        migrations.AddField(
            model_name='bed',
            name='block',
            field=models.ForeignKey(to='grow_records.Block', null=True),
        ),
        migrations.AddField(
            model_name='bed',
            name='site',
            field=models.ForeignKey(to='grow_records.Site', null=True),
        ),
    ]
