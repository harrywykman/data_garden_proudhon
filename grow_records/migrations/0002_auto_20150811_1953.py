# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Bed',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('width', models.IntegerField(default=30)),
                ('length', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='BedRecord',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('in_bed_date', models.DateTimeField(null=True, verbose_name=b'transplant or seeding date')),
                ('out_bed_date', models.DateTimeField(null=True, verbose_name=b'date crop removed', blank=True)),
                ('rows', models.IntegerField(null=True)),
                ('spacing_in', models.IntegerField(null=True, verbose_name=b'spacing \\(inches\\)')),
                ('bed_percent', models.IntegerField(default=100, null=True, verbose_name=b'percentage of bed for crop')),
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
            name='Buyer',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, null=True)),
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
            name='DeliveryItem',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('delivery_amount', models.FloatField(default=0, verbose_name=b'amount')),
            ],
        ),
        migrations.CreateModel(
            name='DeliveryRecord',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date', models.DateTimeField(null=True, verbose_name=b'delivery_date')),
                ('buyer', models.ForeignKey(to='grow_records.Buyer', null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Family',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100)),
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
            name='HarvestRecord',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('yeild_amount', models.FloatField(default=0, verbose_name=b'amount')),
                ('harvest_date', models.DateTimeField(null=True, verbose_name=b'harvest date')),
                ('bed_record', models.ForeignKey(to='grow_records.BedRecord', null=True)),
            ],
        ),
        migrations.CreateModel(
            name='LengthUOM',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('unit', models.CharField(max_length=2, choices=[(b'in', b'in'), (b'ft', b'ft'), (b'mm', b'mm'), (b'm', b'm')])),
            ],
        ),
        migrations.CreateModel(
            name='NurseryRecord',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('in_nursery_date', models.DateTimeField(null=True, verbose_name=b'date of propagation')),
                ('germ_date', models.DateTimeField(null=True, verbose_name=b'date of germination', blank=True)),
                ('tray_size_cell', models.IntegerField(null=True, verbose_name=b'tray size \\(number cells\\)')),
                ('number_trays', models.FloatField(null=True, verbose_name=b'number of trays')),
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
            name='Price',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date', models.DateTimeField(default=django.utils.timezone.now, null=True, verbose_name=b'date price set')),
                ('price', models.FloatField(default=0, null=True, verbose_name=b'price')),
            ],
        ),
        migrations.CreateModel(
            name='SeederRecord',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=2, choices=[(b'EW', b'Earthway'), (b'GL', b'Glasser')])),
                ('seeder_settings', models.CharField(max_length=100, null=True)),
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
        migrations.CreateModel(
            name='YieldUOM',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('unit', models.CharField(max_length=2, choices=[(b'kg', b'kg'), (b'g', b'g'), (b'lb', b'lb'), (b'oz', b'oz')])),
            ],
        ),
        migrations.AddField(
            model_name='price',
            name='price_UOM',
            field=models.ForeignKey(to='grow_records.YieldUOM', null=True),
        ),
        migrations.AddField(
            model_name='price',
            name='variety',
            field=models.ForeignKey(to='grow_records.Variety', null=True),
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
            model_name='harvestrecord',
            name='yeild_UOM',
            field=models.ForeignKey(to='grow_records.YieldUOM', null=True),
        ),
        migrations.AddField(
            model_name='deliveryitem',
            name='delivery_UOM',
            field=models.ForeignKey(to='grow_records.YieldUOM', null=True),
        ),
        migrations.AddField(
            model_name='deliveryitem',
            name='delivery_record',
            field=models.ForeignKey(to='grow_records.DeliveryRecord', null=True),
        ),
        migrations.AddField(
            model_name='deliveryitem',
            name='price',
            field=models.ForeignKey(to='grow_records.Price', null=True),
        ),
        migrations.AddField(
            model_name='deliveryitem',
            name='variety',
            field=models.ForeignKey(to='grow_records.Variety', null=True),
        ),
        migrations.AddField(
            model_name='crop',
            name='family',
            field=models.ForeignKey(to='grow_records.Family', null=True),
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
            field=models.ForeignKey(blank=True, to='grow_records.NurseryRecord', null=True),
        ),
        migrations.AddField(
            model_name='bedrecord',
            name='seeder',
            field=models.ForeignKey(blank=True, to='grow_records.SeederRecord', null=True),
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
            name='length_UOM',
            field=models.ForeignKey(related_name='bed_length_UOM', to='grow_records.LengthUOM', null=True),
        ),
        migrations.AddField(
            model_name='bed',
            name='site',
            field=models.ForeignKey(to='grow_records.Site', null=True),
        ),
        migrations.AddField(
            model_name='bed',
            name='width_UOM',
            field=models.ForeignKey(related_name='bed_width_UOM', to='grow_records.LengthUOM', null=True),
        ),
    ]
