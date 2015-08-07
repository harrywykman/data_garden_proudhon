# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0012_auto_20150806_1242'),
    ]

    operations = [
        migrations.CreateModel(
            name='Bed',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('width_in', models.IntegerField(default=30)),
                ('length_ft', models.IntegerField()),
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
            name='Site',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
            ],
        ),
        migrations.AddField(
            model_name='block',
            name='site',
            field=models.ForeignKey(to='grow_records.Site', null=True),
        ),
        migrations.AddField(
            model_name='bed',
            name='block',
            field=models.ForeignKey(to='grow_records.Block', null=True),
        ),
        migrations.AddField(
            model_name='bed',
            name='site',
            field=models.ForeignKey(to='grow_records.Site', null=True),
        ),
        migrations.AddField(
            model_name='croprecord',
            name='bed',
            field=models.ForeignKey(to='grow_records.Bed', null=True),
        ),
    ]
