# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0018_auto_20150826_1651'),
    ]

    operations = [
        migrations.CreateModel(
            name='Action',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('start_time', models.DateTimeField()),
                ('end_time', models.DateTimeField()),
                ('description', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Location',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='PlantRecord',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
            ],
        ),
        migrations.CreateModel(
            name='Tool',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='BedInteraction',
            fields=[
                ('action_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='grow_records.Action')),
            ],
            bases=('grow_records.action',),
        ),
        migrations.CreateModel(
            name='PlantInteraction',
            fields=[
                ('action_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='grow_records.Action')),
            ],
            bases=('grow_records.action',),
        ),
        migrations.CreateModel(
            name='AmmendInnoculate',
            fields=[
                ('bedinteraction_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='grow_records.BedInteraction')),
            ],
            bases=('grow_records.bedinteraction',),
        ),
        migrations.CreateModel(
            name='FertiliseInnoculate',
            fields=[
                ('plantinteraction_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='grow_records.PlantInteraction')),
            ],
            bases=('grow_records.plantinteraction',),
        ),
        migrations.CreateModel(
            name='Protect',
            fields=[
                ('plantinteraction_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='grow_records.PlantInteraction')),
            ],
            bases=('grow_records.plantinteraction',),
        ),
        migrations.AddField(
            model_name='plantinteraction',
            name='bed_record',
            field=models.ForeignKey(to='grow_records.BedRecord', null=True),
        ),
        migrations.AddField(
            model_name='plantinteraction',
            name='nursery_record',
            field=models.ForeignKey(to='grow_records.NurseryRecord', null=True),
        ),
        migrations.AddField(
            model_name='bedinteraction',
            name='bed',
            field=models.ForeignKey(to='grow_records.Bed', null=True),
        ),
    ]
