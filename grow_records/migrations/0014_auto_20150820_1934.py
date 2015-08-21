# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0013_remove_crop_name'),
    ]

    operations = [
        migrations.CreateModel(
            name='BuyerVarietyPrice',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('buyer', models.ForeignKey(to='grow_records.Buyer', null=True)),
            ],
        ),
        migrations.CreateModel(
            name='VarietyPrice',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date_effective', models.DateField(default=django.utils.timezone.now, null=True, verbose_name=b'date price set')),
                ('date_end', models.DateField(null=True, verbose_name=b'date price expires')),
                ('price', models.FloatField(default=0, null=True, verbose_name=b'price')),
                ('price_type', models.CharField(max_length=2, choices=[(b'DF', b'default'), (b'WS', b'wholesale'), (b'CP', b'cost price')])),
                ('price_UOM', models.ForeignKey(to='grow_records.YieldUOM', null=True)),
                ('variety', models.ForeignKey(to='grow_records.Variety', null=True)),
            ],
        ),
        migrations.RemoveField(
            model_name='price',
            name='price_UOM',
        ),
        migrations.RemoveField(
            model_name='price',
            name='variety',
        ),
        migrations.RemoveField(
            model_name='deliveryitem',
            name='price',
        ),
        migrations.DeleteModel(
            name='Price',
        ),
        migrations.AddField(
            model_name='buyervarietyprice',
            name='price',
            field=models.ForeignKey(to='grow_records.VarietyPrice', null=True),
        ),
    ]
