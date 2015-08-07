# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grow_records', '0018_auto_20150806_1627'),
    ]

    operations = [
        migrations.CreateModel(
            name='Seeder',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=2, choices=[(b'EW', b'Earthway'), (b'GL', b'Glasser')])),
                ('seeder_settings', models.CharField(max_length=2, null=True)),
            ],
        ),
        migrations.AddField(
            model_name='bedrecord',
            name='rows',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='bedrecord',
            name='spacing_in',
            field=models.IntegerField(null=True, verbose_name=b'spacing \\(inches\\)'),
        ),
        migrations.AddField(
            model_name='bedrecord',
            name='seeder',
            field=models.ForeignKey(to='grow_records.Seeder', null=True),
        ),
    ]
