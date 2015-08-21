# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0011_auto_20150816_1222'),
    ]

    operations = [
        migrations.CreateModel(
            name='BedSet',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('site', models.ForeignKey(to='grow_records.Site', null=True)),
            ],
        ),
        migrations.RemoveField(
            model_name='block',
            name='site',
        ),
        migrations.RemoveField(
            model_name='bed',
            name='block',
        ),
        migrations.AlterField(
            model_name='bedrecord',
            name='in_bed_date',
            field=models.DateField(default=django.utils.timezone.now, null=True, verbose_name=b'transplant or seeding date'),
        ),
        migrations.AlterField(
            model_name='bedrecord',
            name='out_bed_date',
            field=models.DateField(null=True, verbose_name=b'date crop removed', blank=True),
        ),
        migrations.AlterField(
            model_name='deliveryrecord',
            name='date',
            field=models.DateField(default=django.utils.timezone.now, null=True, verbose_name=b'delivery_date'),
        ),
        migrations.AlterField(
            model_name='harvestrecord',
            name='harvest_date',
            field=models.DateField(default=django.utils.timezone.now, null=True, verbose_name=b'harvest date'),
        ),
        migrations.AlterField(
            model_name='nurseryrecord',
            name='germ_date',
            field=models.DateField(null=True, verbose_name=b'date of germination', blank=True),
        ),
        migrations.AlterField(
            model_name='nurseryrecord',
            name='in_nursery_date',
            field=models.DateField(default=django.utils.timezone.now, null=True, verbose_name=b'date of propagation'),
        ),
        migrations.AlterField(
            model_name='potonrecord',
            name='pot_on_date',
            field=models.DateField(default=django.utils.timezone.now, verbose_name=b'date potted on'),
        ),
        migrations.AlterField(
            model_name='price',
            name='date',
            field=models.DateField(default=django.utils.timezone.now, null=True, verbose_name=b'date price set'),
        ),
        migrations.AlterField(
            model_name='soilmediumbatch',
            name='created',
            field=models.DateField(default=django.utils.timezone.now, verbose_name=b'date medium created'),
        ),
        migrations.DeleteModel(
            name='Block',
        ),
        migrations.AddField(
            model_name='bed',
            name='bed_set',
            field=models.ForeignKey(to='grow_records.BedSet', null=True),
        ),
    ]
