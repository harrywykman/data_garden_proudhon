# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0014_auto_20150810_1619'),
    ]

    operations = [
        migrations.CreateModel(
            name='DeliveryItem',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('weight_kg', models.FloatField(default=0, verbose_name=b'weight (kg)')),
            ],
        ),
        migrations.RemoveField(
            model_name='deliveryrecord',
            name='variety',
        ),
        migrations.RemoveField(
            model_name='deliveryrecord',
            name='weight_kg',
        ),
        migrations.AddField(
            model_name='deliveryitem',
            name='delivery_record',
            field=models.ForeignKey(to='grow_records.DeliveryRecord', null=True),
        ),
        migrations.AddField(
            model_name='deliveryitem',
            name='variety',
            field=models.ForeignKey(to='grow_records.Variety', null=True),
        ),
    ]
