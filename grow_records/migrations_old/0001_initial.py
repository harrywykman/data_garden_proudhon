# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
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
            name='CommonName',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Crop',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
            ],
        ),
        migrations.CreateModel(
            name='Genus',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Site',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Species',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Variety',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100)),
                ('crop', models.ForeignKey(to='grow_records.Crop')),
            ],
        ),
        migrations.AddField(
            model_name='crop',
            name='genus',
            field=models.ForeignKey(to='grow_records.Genus'),
        ),
        migrations.AddField(
            model_name='crop',
            name='species',
            field=models.ForeignKey(to='grow_records.Species'),
        ),
        migrations.AddField(
            model_name='commonname',
            name='crop',
            field=models.ForeignKey(to='grow_records.Crop'),
        ),
        migrations.AddField(
            model_name='block',
            name='site',
            field=models.ForeignKey(to='grow_records.Site'),
        ),
        migrations.AddField(
            model_name='bed',
            name='block',
            field=models.ForeignKey(to='grow_records.Block'),
        ),
        migrations.AddField(
            model_name='bed',
            name='site',
            field=models.ForeignKey(to='grow_records.Site'),
        ),
    ]
