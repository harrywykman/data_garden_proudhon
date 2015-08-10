# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0017_auto_20150810_1659'),
    ]

    operations = [
        migrations.AddField(
            model_name='varietyprice',
            name='variety',
            field=models.ForeignKey(to='grow_records.Variety', null=True),
        ),
        migrations.AlterField(
            model_name='deliveryitem',
            name='amount',
            field=models.FloatField(default=0, verbose_name=b'amount)'),
        ),
    ]
