# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0013_harvestrecord_harvest_date'),
    ]

    operations = [
        migrations.CreateModel(
            name='Buyer',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='DeliveryRecord',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date', models.DateTimeField(null=True, verbose_name=b'delivery_date')),
                ('weight_kg', models.FloatField(default=0, verbose_name=b'weight (kg)')),
                ('buyer', models.ForeignKey(to='grow_records.Buyer', null=True)),
                ('variety', models.ForeignKey(to='grow_records.Variety', null=True)),
            ],
        ),
        migrations.AlterField(
            model_name='seederrecord',
            name='seeder_settings',
            field=models.CharField(max_length=100, null=True),
        ),
    ]
