from models import (
                    Site, Block, Family, Bed, Genus, Species, Crop, 
                    CommonName, LengthUOM
                   )

SITE = "Croton Greenhouses"
BLOCKS = {
          'Lower': {'1': {'width': 30,
                          'length': 40,
                          'width_UOM': 'in',
                          'length_UOM': 'ft'},
                     '2': {'width': 30,                                                                         
                          'length': 40,                                                                        
                          'width_UOM': 'in',                                                                    
                          'length_UOM': 'ft'},
                     '3': {'width': 30,                                                                         
                          'length': 40,                                                                        
                          'width_UOM': 'in',                                                                    
                          'length_UOM': 'ft'},
                     '4': {'width': 30,                                                                         
                          'length': 40,                                                                        
                          'width_UOM': 'in',                                                                    
                          'length_UOM': 'ft'}, 
                     '5': {'width': 30,                                                                         
                          'length': 40,                                                                        
                          'width_UOM': 'in',                                                                    
                          'length_UOM': 'ft'},
                    },
          'Middle': {'1': {'width': 30,                                                                           
                           'length': 20,                                                                          
                           'width_UOM': 'in',                                                                     
                           'length_UOM': 'ft'},                                                                   
                     '2': {'width': 30,                                                                           
                           'length': 20,                                                                          
                           'width_UOM': 'in',                                                                     
                           'length_UOM': 'ft'},                                                                   
                     '3': {'width': 30,                                                                           
                           'length': 20,                                                                          
                           'width_UOM': 'in',                                                                     
                           'length_UOM': 'ft'},                                                                   
                     '4': {'width': 30,                                                                           
                          'length': 18,                                                                           
                          'width_UOM': 'in',                                                                      
                          'length_UOM': 'ft'},                                                                    
                     '5': {'width': 30,                                                                           
                           'length': 18,                                                                          
                           'width_UOM': 'in',                                                                     
                           'length_UOM': 'ft'},                                                                   
                     '6': {'width': 30,                                                                           
                           'length': 16,                                                                          
                           'width_UOM': 'in',                                                                     
                           'length_UOM': 'ft'},                                                                   
                     '7': {'width': 30,                                                                           
                           'length': 16,                                                                          
                           'width_UOM': 'in',                                                                     
                           'length_UOM': 'ft'},                                                                    
                     '8': {'width': 30,                                                                           
                           'length': 14,                                                                          
                           'width_UOM': 'in',                                                                     
                           'length_UOM': 'ft'},                                                                   
                     '9': {'width': 30,                                                                           
                           'length': 14,                                                                          
                           'width_UOM': 'in',                                                                     
                           'length_UOM': 'ft'},
                     '10': {'width': 30,                                                                        
                           'length': 12,                                                                       
                           'width_UOM': 'in',                                                                  
                           'length_UOM': 'ft'},
                     '11': {'width': 30,                                                                        
                           'length': 12,                                                                       
                           'width_UOM': 'in',                                                                  
                           'length_UOM': 'ft'},
                     '12': {'width': 30,                                                                        
                           'length': 10,                                                                       
                           'width_UOM': 'in',                                                                  
                           'length_UOM': 'ft'},
                    },
          'Top': {'1': {'width': 30,                                                               
                        'length': 20,                                                              
                        'width_UOM': 'in',                                                          
                        'length_UOM': 'ft'},                                                        
                  '2': {'width': 30,                                                               
                        'length': 20,                                                              
                        'width_UOM': 'in',                                                          
                        'length_UOM': 'ft'},                                                        
                  '3': {'width': 30,                                                               
                        'length': 20,                                                              
                        'width_UOM': 'in',                                                          
                        'length_UOM': 'ft'},                                                        
                  '4': {'width': 30,                                                               
                       'length': 20,                                                              
                       'width_UOM': 'in',                                                          
                       'length_UOM': 'ft'},                                                        
                  '5': {'width': 30,                                                               
                        'length': 20,                                                              
                        'width_UOM': 'in',                                                          
                        'length_UOM': 'ft'},                                                        
                  '6': {'width': 30,                                                              
                        'length': 20,                                                              
                        'width_UOM': 'in',                                                          
                        'length_UOM': 'ft'},                                                        
                  '7': {'width': 30,                                                              
                        'length': 20,                                                              
                        'width_UOM': 'in',                                                          
                        'length_UOM': 'ft'},
                  '8': {'width': 30,                                                                           
                        'length': 20,                                                                          
                        'width_UOM': 'in',                                                                     
                        'length_UOM': 'ft'},                                                                   
                  '9': {'width': 30,                                                                           
                        'length': 20,                                                                          
                        'width_UOM': 'in',                                                                     
                        'length_UOM': 'ft'},
                 },
          'Greenhouse West': {'1': {'width': 30,                                                                         
                                    'length': 30,                                                                        
                                    'width_UOM': 'in',                                                                    
                                    'length_UOM': 'ft'}, 
                              '2': {'width': 30,                                                                         
                                    'length': 30,                                                                        
                                    'width_UOM': 'in',                                                                    
                                    'length_UOM': 'ft'}, 
                              '3': {'width': 30,                                                                         
                                    'length': 30,                                                                        
                                    'width_UOM': 'in',                                                                    
                                    'length_UOM': 'ft'}, 
                              '4': {'width': 30,                                                                         
                                    'length': 25,                                                                        
                                    'width_UOM': 'in',                                                                    
                                    'length_UOM': 'ft'}, 
                              '5': {'width': 30,                                                                         
                                    'length': 30,                                                                        
                                    'width_UOM': 'in',                                                                    
                                    'length_UOM': 'ft'}, 
                               '6': {'width': 30,                                                                         
                                    'length': 30,                                                                        
                                    'width_UOM': 'in',                                                                    
                                    'length_UOM': 'ft'}, 
                               '7': {'width': 30,                                                                         
                                    'length': 30,                                                                        
                                    'width_UOM': 'in',                                                                    
                                    'length_UOM': 'ft'},
                             },
          'Greenhouse East': {'1': {'width': 30,                                                                         
                                    'length': 60,                                                                        
                                    'width_UOM': 'in',                                                                   
                                    'length_UOM': 'ft'},                                                                 
                              '2': {'width': 30,                                                                        
                                    'length': 60,                                                                        
                                    'width_UOM': 'in',                                                                   
                                    'length_UOM': 'ft'},                                                                 
                              '3': {'width': 30,                                                                        
                                    'length': 60,                                                                        
                                    'width_UOM': 'in',                                                                   
                                    'length_UOM': 'ft'},                                                                 
                             '4': {'width': 30,                                                                        
                                   'length': 60,                                                                        
                                   'width_UOM': 'in',                                                                   
                                  'length_UOM': 'ft'},                                                                 
                             '5': {'width': 30,                                                                        
                                   'length': 60,                                                                        
                                   'width_UOM': 'in',                                                                   
                                   'length_UOM': 'ft'}, 
                             },
         }

# dictionary of crops where key is common name and value is a tuple 
# with order family, genus, species
CROPS = {
        'arugula': ('Brassicaceae', 'Eruca', 'sativa'),
        'tomato': ('Solanaceae', 'Solanum', 'lycopersicum'),
        'basil': ('Lamiaceae', 'Ocimum', 'basilicum'),
        'sage': ('Lamiaceae', 'Salvia', 'officinalis'),
        'pepper': ('Solanaceae', 'Capsicum', 'annuum'),
        'pattypan squash': ('Cucurbitaceae', 'Cucurbita', 'pepo'),
        'zucchini': ('Cucurbitaceae', 'Cucurbita', 'pepo'),
        'eggplant': ('Solanaceae', 'Solanum', 'melongena'),
        'broccoli': ('Brassicaceae', 'Brassica', 'oleracea'),
        'broccoli rabe': ('Brassicaceae', 'Brassica', 'rapa'),
        'kale': ('Brassicaceae', 'Brassica', 'oleracea'),
        'lettuce': ('Asteraceae', 'Lactuca', 'sativa'),
        'beet': ('Amaranthaceae', 'Beta', 'vulgaris'),
        'chard': ('Amaranthaceae', 'Beta', 'vulgaris'),
        'fennel': ('Apiaceae', 'Foeniculum', 'vulgare'),
        'parsley': ('Apiaceae', 'Petroselinum', 'crispum'),
        'escarole': ('Asteraceae', 'Cichorium', 'endivia'),
        'radicchio': ('Asteraceae', 'Cichorium', 'intybus'),
        'endive': ('Asteraceae', 'Cichorium', 'endivia'),
        'dandelion': ('Asteraceae', 'Cichorium', 'intybus'),
        }


# add major families
def populate_families():
    for name in FAMILIES:                                                         
        existing_family = Family.objects.filter(name=name)                      
                                                                                
        if existing_family.count() > 0:                                          
            print "    Family ", name, " already exists in database."            
        else:                                                                   
            f = Family(name=name)                                        
            f.save()                                                            
            print '    Saved', name, "as Family."

# add major crops with family, genus and species
def populate_crops():
    for common_name in CROPS:
        common_name = common_name
        family = CROPS[common_name][0]
        genus = CROPS[common_name][1]
        species = CROPS[common_name][2]

        existing_family = Family.objects.filter(name=family)
        if existing_family.count() > 0:                                         
            print "    Family ", family, " already exists in database."           
            existing_family = existing_family[0]
        else:                                                                   
            f = Family(name=family)
            f.save()
            existing_family = f                                                            
            print '    Saved', family, "as Family."

        existing_genus = Genus.objects.filter(name=genus)
        if existing_genus.count() > 0:                                         
            print "    Genus ", genus, " already exists in database."           
            existing_genus = existing_genus[0]
        else:                                                                   
            g = Genus(name=genus, family=existing_family) 
            g.save()
            existing_genus = g                                                            
            print '    Saved', genus, "as Genus."

        existing_species = Species.objects.filter(species=species, 
                                                  genus=existing_genus)                              
        if existing_species.count() > 0:                                          
            print "    Species ", species, " already exists in database."            
            existing_species = existing_species[0]
        else:                                                                   
            s = Species(species=species, genus=existing_genus)                                               
            s.save()                                                            
            existing_species = s
            print '    Saved', species, "as Species."

                                                                                
        existing_crop = Crop.objects.filter(species=existing_species, 
                                            name=common_name)      
        if existing_crop.count() > 0:                                        
            print "    Crop ", common_name, " already exists in database."          
            existing_crop = existing_crop[0]
        else:                                                                   
            c = Crop(species=existing_species, name=common_name)                                          
            c.save()                               
            existing_crop = c                             
            print '    Saved', common_name, "as Crop."
        
        existing_common_name = CommonName.objects.filter(crop=existing_crop,                             
                                                  name=common_name) 
        if existing_common_name.count() > 0:                                                                   
            print "    Common name for ", species, " already exists in database."                              
            existing_common_name = existing_common_name[0]                                                     
        else:                                                                                                  
            cn = CommonName(                                                                                   
                            crop=existing_crop,                                                          
                            name=common_name,                                                                  
                            preferred=True)                                                                    
            cn.save()                                                                                          
            existing_common_name = cn                                                                          
            print '    Saved', common_name, ' for ', species, "as CommonName."


# add site and blocks
def populate_blocks():
    existing_site = Site.objects.filter(name=SITE)

    if existing_site.count() > 0:
        print "Site ", SITE, " already exists in database."
        existing_site = existing_site[0]
    else:
        s = Site(name=SITE)
        s.save() 
        existing_site = s

    for block_name in BLOCKS:
        existing_block = Block.objects.filter(name=block_name, site=existing_site)

        if existing_block.count() > 0:
            print "    Block ", block_name, " already exists in database."
            existing_block = existing_block[0]
        else:
            b = Block(name=block_name, site=s)
            b.save()
            existing_block = b
            print '    Saved', block_name, "as Block."

        for bed_name in BLOCKS[block_name]:

            width_UOM = BLOCKS[block_name][bed_name]['width_UOM']
            existing_width_UOM = LengthUOM.objects.filter(unit=width_UOM)                 
            if existing_width_UOM.count() > 0:                                                           
                print "    WidthUOM ", width_UOM, " already exists in database."  
                existing_width_UOM = existing_width_UOM[0]                                                 
            else:                                                                                  
                wuom = LengthUOM(unit=width_UOM)                                                          
                wuom.save()                                                                           
                existing_width_UOM = wuom                                                                 
                print '    Saved', width_UOM, "as WidthUOM."

            length_UOM = BLOCKS[block_name][bed_name]['length_UOM']                                  
            existing_length_UOM = LengthUOM.objects.filter(unit=length_UOM)                           
            if existing_length_UOM.count() > 0:                                                     
                print "    LengthUOM ", length_UOM, " already exists in database."                   
                existing_length_UOM = existing_length_UOM[0]                                         
            else:                                                                                  
                luom = LengthUOM(unit=length_UOM)                                                    
                luom.save()                                                                        
                existing_length_UOM = luom                                                          
                print '    Saved', length_UOM, "as LengthUOM." 

            bed_name = bed_name
            print bed_name
            width = BLOCKS[block_name][bed_name]['width']
            print width
            length = BLOCKS[block_name][bed_name]['length']
            width_UOM = existing_width_UOM
            length_UOM = existing_length_UOM         
                                                                                                   
            existing_bed = Bed.objects.filter(name=bed_name, block=existing_block)                                   

            if existing_bed.count() > 0:                                                                         
                print "    Bed ", bed_name, "in ", existing_block, " already exists in database."                                           
                existing_bed = existing_bed[0]
            else:                                                                                                  
                b = Bed(
                        site = existing_site,
                        block = existing_block,
                        name = bed_name, 
                        width = width, 
                        width_UOM = width_UOM, 
                        length = length,
                        length_UOM = length_UOM
                       )
                b.save()                          
                existing_bed = b                                                                 
                print '    Saved', bed_name, "in", block_name, "as Bed."


def populate():
    populate_blocks()
    populate_crops()
    
