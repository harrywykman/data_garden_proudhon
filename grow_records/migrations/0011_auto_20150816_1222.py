# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0010_auto_20150816_1213'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bedrecord',
            name='in_bed_date',
            field=models.DateTimeField(default=django.utils.timezone.now, null=True, verbose_name=b'transplant or seeding date'),
        ),
        migrations.AlterField(
            model_name='deliveryrecord',
            name='date',
            field=models.DateTimeField(default=django.utils.timezone.now, null=True, verbose_name=b'delivery_date'),
        ),
        migrations.AlterField(
            model_name='harvestrecord',
            name='harvest_date',
            field=models.DateTimeField(default=django.utils.timezone.now, null=True, verbose_name=b'harvest date'),
        ),
        migrations.AlterField(
            model_name='nurseryrecord',
            name='in_nursery_date',
            field=models.DateTimeField(default=django.utils.timezone.now, null=True, verbose_name=b'date of propagation'),
        ),
        migrations.AlterField(
            model_name='potonrecord',
            name='pot_on_date',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name=b'date potted on'),
        ),
        migrations.AlterField(
            model_name='soilmediumbatch',
            name='created',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name=b'date medium created'),
        ),
    ]
