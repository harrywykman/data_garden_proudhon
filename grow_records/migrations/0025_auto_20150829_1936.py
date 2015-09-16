# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import address.models


class Migration(migrations.Migration):

    dependencies = [
        ('address', '0001_initial'),
        ('grow_records', '0024_auto_20150828_2132'),
    ]

    operations = [
        migrations.CreateModel(
            name='Input',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('descripton', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Supplier',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('address', address.models.AddressField(to='address.Address')),
            ],
        ),
        migrations.AddField(
            model_name='input',
            name='supplier',
            field=models.ForeignKey(to='grow_records.Supplier'),
        ),
    ]
