# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0018_auto_20150810_1703'),
    ]

    operations = [
        migrations.CreateModel(
            name='Price',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date', models.DateTimeField(default=django.utils.timezone.now, null=True, verbose_name=b'date price set')),
                ('price', models.FloatField(default=0, null=True, verbose_name=b'price')),
                ('unit', models.CharField(max_length=2, null=True, choices=[(b'kg', b'kilogram'), (b'lb', b'pound')])),
                ('variety', models.ForeignKey(to='grow_records.Variety', null=True)),
            ],
        ),
        migrations.RemoveField(
            model_name='varietyprice',
            name='variety',
        ),
        migrations.AlterField(
            model_name='deliveryitem',
            name='price',
            field=models.ForeignKey(to='grow_records.Price', null=True),
        ),
        migrations.DeleteModel(
            name='VarietyPrice',
        ),
    ]
