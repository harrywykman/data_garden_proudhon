# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0015_auto_20150821_1233'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='varietyprice',
            name='price_type',
        ),
        migrations.AddField(
            model_name='buyervarietyprice',
            name='date_effective',
            field=models.DateField(default=django.utils.timezone.now, null=True, verbose_name=b'date price set'),
        ),
        migrations.AddField(
            model_name='buyervarietyprice',
            name='date_end',
            field=models.DateField(null=True, verbose_name=b'date price expires', blank=True),
        ),
        migrations.AddField(
            model_name='buyervarietyprice',
            name='price_UOM',
            field=models.ForeignKey(to='grow_records.YieldUOM', null=True),
        ),
        migrations.AddField(
            model_name='buyervarietyprice',
            name='variety',
            field=models.ForeignKey(to='grow_records.Variety', null=True),
        ),
        migrations.AlterField(
            model_name='buyervarietyprice',
            name='price',
            field=models.FloatField(default=0, null=True, verbose_name=b'price'),
        ),
    ]
