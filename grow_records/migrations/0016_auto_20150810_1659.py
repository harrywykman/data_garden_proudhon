# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0015_auto_20150810_1626'),
    ]

    operations = [
        migrations.CreateModel(
            name='VarietyPrice',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date', models.DateTimeField(default=django.utils.timezone.now, null=True, verbose_name=b'date price set')),
                ('price', models.FloatField(default=0, null=True, verbose_name=b'price')),
                ('unit', models.CharField(max_length=2, null=True, choices=[(b'kg', b'kilogram'), (b'lb', b'pound')])),
            ],
        ),
        migrations.RenameField(
            model_name='deliveryitem',
            old_name='weight_kg',
            new_name='unit_amount',
        ),
        migrations.RemoveField(
            model_name='harvestrecord',
            name='weight_kg',
        ),
        migrations.AddField(
            model_name='deliveryitem',
            name='unit',
            field=models.CharField(max_length=2, null=True, choices=[(b'kg', b'kilogram'), (b'lb', b'pound')]),
        ),
        migrations.AddField(
            model_name='harvestrecord',
            name='amount',
            field=models.FloatField(default=0, verbose_name=b'amount'),
        ),
        migrations.AddField(
            model_name='harvestrecord',
            name='unit',
            field=models.CharField(max_length=2, null=True, choices=[(b'kg', b'kilogram'), (b'lb', b'pound')]),
        ),
        migrations.AlterField(
            model_name='bedrecord',
            name='bed_percent',
            field=models.IntegerField(default=100, null=True, verbose_name=b'percentage of bed for crop'),
        ),
        migrations.AddField(
            model_name='deliveryitem',
            name='price',
            field=models.ForeignKey(to='grow_records.VarietyPrice', null=True),
        ),
    ]
