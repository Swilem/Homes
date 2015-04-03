define [ 'extm', 'src/apps/screen-two/screen-two-view' ], ( Extm, ScreenTwoView )->

    # Screen two controller
    tagsArray = ""
    class ScreenTwoController extends Extm.RegionController

        initialize : ()->

            @Collection = @_getUnitsCountCollection()


            @layout = new ScreenTwoView.ScreenTwoLayout(
                collection:@Collection[0]
                uintVariantId : @Collection[2]
                uintVariantIdArray : @Collection[3]
                unitVariants:@Collection[1]
                views :@Collection[4] 
                facings : @Collection[5]
                Oviews :@Collection[6] 
                Ofacings : @Collection[7]
                terrace :@Collection[8] 
                terraceID : @Collection[9]
                templateHelpers:
                    unitVariants:@Collection[1]
                    views :@Collection[4] 
                    facings : @Collection[5]
                    terrace :@Collection[8] 
                    terraceID : @Collection[9]
                    AJAXURL : AJAXURL)


            @listenTo @layout, "show", @showViews

            @listenTo @layout, "show:updated:building", @showUpdateBuilding

            @listenTo @layout, 'unit:variants:selected', @showUpdateBuildings

            @listenTo @layout, 'unit:count:selected', @_unitCountSelected






            @show @layout


        showUpdateBuildings:->
            
            @Collection = @_getUnitsCountCollection()


            @layout = new ScreenTwoView.ScreenTwoLayout(
                collection:@Collection[1]
                buildingColl : @Collection[0]
                uintVariantId : @Collection[9]
                uintVariantIdArray : @Collection[10]
                views :@Collection[13] 
                facings : @Collection[14]
                Oviews :@Collection[11] 
                Ofacings : @Collection[12]
                unitVariants:@Collection[8]
                terrace :@Collection[15] 
                terraceID : @Collection[16]
                templateHelpers:
                    selection :@Collection[2]
                    unitsCount:@Collection[3]
                    unittypes:  @Collection[4]
                    high : @Collection[5]
                    medium : @Collection[6]
                    low : @Collection[7]
                    unitVariants:@Collection[8]
                    views :@Collection[11] 
                    facings : @Collection[12]
                    terrace :@Collection[15] 
                    terraceID : @Collection[16]
                    AJAXURL : AJAXURL)


            @listenTo @layout, "show", @showViews

            @listenTo @layout, "show:updated:building", @showUpdateBuilding

            @listenTo @layout, 'unit:variants:selected', @showUpdateBuildings

            @listenTo @layout, 'unit:count:selected', @_unitCountSelected






            @show @layout


        showUpdateBuilding:(id)=>
            @Collection = @_getUnitsCountCollection(id)

            
            itemview1 = new ScreenTwoView.UnitTypeChildView
                collection : @Collection[0]

            itemview2 = new ScreenTwoView.UnitTypeView
                collection : @Collection[1]

            
            @layout.buildingRegion.$el.empty();
            @layout.unitRegion.$el.empty();
            @layout.buildingRegion.$el.append(itemview1.render().el ); 
            @layout.unitRegion.$el.append(itemview2.render().el ); 
            scr = document.createElement('script')
            scr.src = '../wp-content/themes/Homes/js/src/preload/main2.js'
            document.body.appendChild(scr)
            
            
            building = @Collection[0].toArray()
            buidlingValue = _.first(building)
            masterbuilding = App.master.building
            masterbuilding.each ( index)->
                $("#highlighttower"+index.get('id')).attr('class','overlay')
            $("#highlighttower"+buidlingValue.get('id')).attr('class','overlay highlight')





            


            

       
            

            



        showViews:=>
            console.log "aaaaaa"
            @showUnitRegion @Collection[0]





        

        showUnitRegion:(unitCollection)->
            console.log unitCollection
            itemview2 = @getUnitsView unitCollection
            @layout.unitRegion.show itemview2








        getView:(buildingCollection)->
            new ScreenTwoView.UnitTypeChildView
                collection : buildingCollection

        getUnitsView:(unitCollection)->
            new ScreenTwoView.UnitTypeView
                collection : unitCollection


        _unitCountSelected:=>
            App.navigate "screen-three" , trigger:true









        _getUnitsCountCollection:(paramid={})->
            buildingArray = Array()
            buildingArrayModel = Array()
            unitColl = Array()
            templateArr = []
            mainunitTypeArray = []
            mainnewarr =  []
            lnewarr =  []
            mnewarr =  []
            hnewarr =  []
            mainunique = {}
            myArray1 = []
            MainCollection = new Backbone.Model()
            status = App.currentStore.status.findWhere({'name':'Available'})
            status_onhold = App.currentStore.status.findWhere({'name':'On Hold'})
            key =  _.isEmpty(paramid)
            if key == true
                units  = _.filter(App.currentStore.unit.toArray(),  (num)->
                    return (parseInt(num.get('status')) == parseInt(status.get('id')) || parseInt(num.get('status')) == parseInt(status_onhold.get('id'))) 

                )
            else
               units  = _.filter(App.currentStore.unit.toArray(),  (num)->
                    return (parseInt(num.get('status')) == parseInt(status.get('id')) || parseInt(num.get('status')) == parseInt(status_onhold.get('id'))) 

                ) 
            Countunits  = _.filter(App.currentStore.unit.toArray(),  (num)->
                    return (parseInt(num.get('status')) == parseInt(status.get('id')) || parseInt(num.get('status')) == parseInt(status_onhold.get('id'))) 

            )
            param = {}
            paramkey = {}
            flag = 0
            mainunitsTypeArray = []
            mainArray = []
            param = {}
            templateString = ""
            paramkey = {}
            flag = 0
            floorUnitsArray = []
            myArray = []
            $.map(App.defaults, (value, index)->
                if value!='All' 
                    if  index != 'unitVariant' 
                        myArray.push({key:index,value:value})
                    if  index != 'facing' && index != 'terrace' && index != 'view'
                        myArray1.push({key:index,value:value})

            )
            
            unitslen  = _.filter(App.currentStore.unit.toArray(),  (num)->
                    return (parseInt(num.get('status')) == parseInt(status.get('id')) || parseInt(num.get('status')) == parseInt(status_onhold.get('id'))) 

            ) 
            
            unitslen1 = App.master.unit.toArray()


            $.each(unitslen1, (index,value1)->

                if App.defaults['floor'] !='All'
                    floorstring = App.defaults['floor']
                    floorArray  = floorstring.split(',')
                    $.each(floorArray, (index,value)->
                        if value1.get('floor') == parseInt(value)
                            floorUnitsArray.push(value1)




                    )


            )
            if App.defaults['floor'] == "All"
                floorUnitsArray = unitslen1
            floorCollunits = []
            $.each(floorUnitsArray, (index,value1)->
                flag = 0
                $.each(myArray, (index,value)->
                    paramKey = {}
                    paramKey[value.key] = value.value
                    if value.key == 'budget'
                        buildingModel = App.master.building.findWhere({'id':value1.get 'building'})
                        floorRise = buildingModel.get 'floorrise'
                        floorRiseValue = floorRise[value1.get 'floor']
                        unitVariantmodel = App.master.unit_variant.findWhere({'id':value1.get 'unitVariant'})
                        #unitPrice = (parseInt( unitVariantmodel.get('persqftprice')) + parseInt(floorRiseValue)) * parseInt(unitVariantmodel.get 'sellablearea')
                        unitPrice = value1.get 'unitPrice'
                        budget_arr = value.value.split(' ')
                        budget_price = budget_arr[0].split('-')
                        budget_price[0] = budget_price[0]+'00000'
                        budget_price[1] = budget_price[1]+'00000'
                        if parseInt(unitPrice) >= parseInt(budget_price[0]) && parseInt(unitPrice) <= parseInt(budget_price[1])
                            flag++
                    else if value.key != 'floor'
                        tempnew = []
                        if value.key == 'view' ||  value.key == 'apartment_views'
                            tempnew = []
                            value.key = 'apartment_views'
                            tempnew = value1.get(value.key)
                            if tempnew != ""
                                tempnew = tempnew.map((item)->
                                    return parseInt(item))
                        else if value.key == 'facing'
                            tempnew = []
                            tempnew = value1.get(value.key)
                            if tempnew.length != 0
                                tempnew = tempnew.map((item)->
                                    return parseInt(item))
                        temp = []
                        temp.push value.value
                        tempstring = temp.join(',')
                        initvariant = tempstring.split(',').map((item)->
                            return parseInt(item)
                        )
                        
                        if initvariant.length >= 1
                            for element in initvariant
                                if value1.get(value.key) == parseInt(element)
                                    flag++ 
                                else if $.inArray(parseInt(element),tempnew) >=0 
                                    flag++ 

                        else
                            if value1.get(value.key) == parseInt(value.value)
                                flag++
                        


                )
                if flag >= myArray.length
                    floorCollunits.push(value1)





            )
            floorCollunits1 = []
            $.each(floorUnitsArray, (index,value1)->
                flag = 0
                $.each(myArray1, (index,value)->
                    paramKey = {}
                    paramKey[value.key] = value.value
                    if value.key == 'budget'
                        buildingModel = App.master.building.findWhere({'id':value1.get 'building'})
                        floorRise = buildingModel.get 'floorrise'
                        floorRiseValue = floorRise[value1.get 'floor']
                        unitVariantmodel = App.master.unit_variant.findWhere({'id':value1.get 'unitVariant'})
                        #unitPrice = (parseInt( unitVariantmodel.get('persqftprice')) + parseInt(floorRiseValue)) * parseInt(unitVariantmodel.get 'sellablearea')
                        unitPrice = value1.get 'unitPrice'
                        budget_arr = value.value.split(' ')
                        budget_price = budget_arr[0].split('-')
                        budget_price[0] = budget_price[0]+'00000'
                        budget_price[1] = budget_price[1]+'00000'
                        if parseInt(unitPrice) >= parseInt(budget_price[0]) && parseInt(unitPrice) <= parseInt(budget_price[1])
                            flag++
                    else if value.key != 'floor'
                        tempnew = []
                        
                        if value.key == 'view' ||  value.key == 'apartment_views'
                            tempnew = []
                            value.key = 'apartment_views'
                            tempnew = value1.get(value.key)
                            if tempnew != ""
                                tempnew = tempnew.map((item)->
                                    return parseInt(item))
                        else if value.key == 'facing'
                            tempnew = []
                            tempnew = value1.get(value.key)
                            if tempnew.length != 0
                                tempnew = tempnew.map((item)->
                                    return parseInt(item))
                        temp = []
                        temp.push value.value
                        tempstring = temp.join(',')
                        initvariant = tempstring.split(',').map((item)->
                            return parseInt(item)
                        )
                        
                        if initvariant.length >= 1
                            for element in initvariant
                                if value1.get(value.key) == parseInt(element)
                                    flag++ 
                                else if $.inArray(parseInt(element),tempnew) >=0 
                                    flag++ 

                        else
                            if value1.get(value.key) == parseInt(value.value)
                                flag++
                        


                )
                if flag == myArray1.length 
                    if  value1.get('unitType') != 14 && value1.get('unitType') != 16
                        floorCollunits1.push(value1)





            )
            tempunitvarinat = []
            uniqUnitvariant = []
            
            floorCollection = new Backbone.Collection(floorCollunits)
            $.each(App.master.unit.toArray(), (index,value)->
                if value.get('unitType') != 14 && value.get('unitType') != 16
                    tempunitvarinat.push(value)

                )
            unitvarinatColl = new Backbone.Collection tempunitvarinat
            unitvariant = unitvarinatColl.pluck("unitVariant")
            uniqUnitvariant = _.uniq(unitvariant)
            floorunitvariant = floorCollection.pluck("unitVariant")
            flooruniqUnitvariant = _.uniq(floorunitvariant)

            unitVariantModels = []
            unitVariantID = []
            viewModels = []
            viewID = []
            viewtemp = []
            viewtemp1 = []
            facingModels = []
            facingID = []
            facingtemp = []
            facingtemp1 = []
            terraceModels = []
            terraceID = []
            terracetemp = []
            terracetemp1 = []
            usermodel = new Backbone.Model USER
            capability = usermodel.get('all_caps')
            if usermodel.get('id') != "0" && $.inArray('see_special_filters',capability) >= 0
                floorCollectionmaster = App.master.unit
                floorCollectionmaster.each (item)->
                    if item.get('unitType') != 14 && item.get('unitType') != 16
                        if item.get('apartment_views') != "" && item.get('apartment_views').length != 0
                            $.merge(viewtemp,item.get('apartment_views'))
                        if item.get('facing').length != 0 && item.get('facing') != ""
                            $.merge(facingtemp,item.get('facing'))
                        if item.get('terrace') != "" && item.get('terrace') != 0
                            terracetemp.push item.get('terrace')
                
                floorCollectionCur = new Backbone.Collection floorCollunits1
                floorCollectionCur.each (item)->
                    if item.get('unitType') != 14 && item.get('unitType') != 16
                        if item.get('apartment_views') != "" && item.get('apartment_views').length != 0
                            $.merge(viewtemp1,item.get('apartment_views'))
                        if item.get('facing').length != 0 && item.get('facing') != ""
                            $.merge(facingtemp1,item.get('facing'))
                        if item.get('terrace') != "" && item.get('terrace') != 0
                            terracetemp1.push item.get('terrace')

                viewtemp = viewtemp.map((item)->
                    return parseInt(item)
                    )
                facingtemp = facingtemp.map((item)->
                    return parseInt(item)
                    )
                terracetemp = terracetemp.map((item)->
                    return parseInt(item)
                    )
                    
                uniqviews = _.uniq(viewtemp)
                uniqfacings = _.uniq(facingtemp)
                uniqterrace = _.uniq(terracetemp)
                viewtemp1 = viewtemp1.map((item)->
                    return parseInt(item)
                    )
                viewtemp1 = _.uniq(viewtemp1)
                facingtemp1 = facingtemp1.map((item)->
                    return parseInt(item)
                    )
                facingtemp1 = _.uniq(facingtemp1)
                terracetemp1 = terracetemp1.map((item)->
                    return parseInt(item)
                    )
                terracetemp1 = _.uniq(terracetemp1)
                $.each(uniqviews, (index,value)->
                    viewModel = App.master.view.findWhere({id:parseInt(value)})
                    disabled = "disabled"
                    checked = ""
                    key = ""
                    key  =  $.inArray(parseInt(value),viewtemp1)
                    count = []
                    $.each(floorCollunits1, (ind,val)->
                        if parseInt(val.get('status')) == parseInt(status.get('id')) || parseInt(val.get('status')) == parseInt(status_onhold.get('id'))

                            apartment = val.get('apartment_views')
                            if val.get('apartment_views') !="" && val.get('apartment_views').length !=0
                                apartment = apartment.map((item)->
                                    return parseInt(item)
                                    )
                                if $.inArray(parseInt(value),apartment) >= 0
                                    $.merge(count,val.get('apartment_views'))



                            )
                    if count.length != 0 && key >= 0 
                        disabled = ""
                        checked = "checked"
                        classname = 'filtered'
                        
                        viewID.push(parseInt(viewModel.get('id')))
                    else if count.length == 0 && key >= 0
                        classname = 'sold'
                    else
                        classname = 'other'
                    # if $.inArray(parseInt(value),viewtemp1) >= 0
                    #     viewID.push(parseInt(viewModel.get('id')))
                        
                        
                    viewModels.push({id:viewModel.get('id'),name:viewModel.get('name'),disabled:disabled,checked:checked,classname:classname})

                )
                $.each(uniqfacings, (index,value)->
                    facingModel = App.master.facings.findWhere({id:parseInt(value)})
                    disabled = "disabled"
                    checked = ""
                    key = ""
                    key  = $.inArray(parseInt(value),facingtemp1)
                    count = []
                    $.each(floorCollunits1, (ind,val)->
                        if parseInt(val.get('status')) == parseInt(status.get('id')) || parseInt(val.get('status')) == parseInt(status_onhold.get('id'))
                            facing = val.get('facing')
                            facing = facing.map((item)->
                                return parseInt(item)
                                )
                            if $.inArray(parseInt(value),facing) >= 0
                                $.merge(count,val.get('facing'))



                            )
                    if count.length != 0 && key >= 0 
                        disabled = ""
                        checked = "checked"
                        classname = 'filtered'
                        
                        facingID.push(parseInt(facingModel.get('id')))
                    else if count.length ==0 && key >= 0
                        classname = 'sold'
                    else
                        classname = 'other'
                    # if $.inArray(parseInt(value),facingtemp1) >= 0
                    #     facingID.push(parseInt(facingModel.get('id')))
                    #     disabled = ""
                    #     checked = "checked"
                        
                    facingModels.push({id:facingModel.get('id'),name:facingModel.get('name'),disabled:disabled,checked:checked,classname:classname})
                    

                )
                $.each(uniqterrace, (index,value)->
                    terraceModel = App.master.terrace.findWhere({id:parseInt(value)})
                    disabled = "disabled"
                    checked = ""
                    key = ""
                    key  = $.inArray(parseInt(value),terracetemp1) 
                    count = []
                    $.each(floorCollunits1, (ind,val)->
                        if parseInt(val.get('status')) == parseInt(status.get('id')) || parseInt(val.get('status')) == parseInt(status_onhold.get('id'))
                            if parseInt(value) == parseInt(val.get('terrace')) 
                                count.push(val)



                            )
                    if count.length != 0 && key >= 0 
                        disabled = ""
                        checked = "checked"
                        classname = 'filtered'
                        
                        terraceID.push(parseInt(terraceModel.get('id')))
                    else if count.length ==0 && key >= 0
                        classname = 'sold'
                    else
                        classname = 'other'
                    # if $.inArray(parseInt(value),terracetemp1) >= 0
                    #     terraceID.push(parseInt(terraceModel.get('id')))
                    #     disabled = ""
                    #     checked = "checked"
                        
                    terraceModels.push({id:parseInt(terraceModel.get('id')),name:terraceModel.get('name'),disabled:disabled,checked:checked,classname:classname})
                    
                )
            
            $.each(uniqUnitvariant, (index,value)->
                unitVarinatModel = App.master.unit_variant.findWhere({id:value})
                count  = _.filter(floorCollection.toArray(),  (num)->
                    return (parseInt(num.get('status')) == parseInt(status.get('id')) || 
                    parseInt(num.get('status')) == parseInt(status_onhold.get('id'))) &&
                    num.get('unitVariant') == value

                )
                key  = $.inArray(value,flooruniqUnitvariant)
                if App.defaults['unitType'] != "All"
                    unittypemodel = App.master.unit_type.findWhere({id:parseInt(App.defaults['unitType'])})
                    filter = unittypemodel.get('name')+' apartments'
                else if App.defaults['budget'] != "All"
                    filter = 'Apartments within '+App.defaults['budget']
                selected = ""
                if count.length != 0 && key >= 0 
                    classname = 'filtered'
                    selected = 'selected'
                    unitVariantID.push(parseInt(unitVarinatModel.get('id')))
                else if count.length ==0 && key >= 0
                    classname = 'sold'
                else
                    classname = 'other'
                unitVariantModels.push({id:unitVarinatModel.get('id'),name:unitVarinatModel.get('name'),sellablearea:unitVarinatModel.get('sellablearea'),count:count.length,classname:classname,selected:selected,filter:filter})
                


            )
            
            unitVariantModels.sort( (a,b)->
                a.id - b.id

            )
            unitVariantID.sort( (a,b)->
                a - b

            )
            mainunitTypeArray1 = []
            units1  = _.filter(App.master.unit.toArray(),  (num)->
                    return (parseInt(num.get('status')) == parseInt(status.get('id')) || parseInt(num.get('status')) == parseInt(status_onhold.get('id'))) 

            )
            $.each(units1, (index,value)->

                if buildingArray.indexOf(value.get 'building') ==  -1
                    buildingArray.push value.get 'building'
                unitType = App.master.unit_type.findWhere({id:value.get 'unitType'})
                mainunitTypeArray1.push({id:unitType.get('id'),name: unitType.get('name')})
            )
            $.each(units, (index,value)->
                maxcoll = Array()
                
                
                    


                unitType = App.master.unit_type.findWhere({id:value.get 'unitType'})
                mainunitTypeArray.push({id:unitType.get('id'),name: unitType.get('name')})
            )


            $.each(mainunitTypeArray1, (key,item)->
                if (!mainunique[item.id])
                    if item.id != 14 && item.id != 16
                        
                        count  = _.filter(App.currentStore.unit.toArray(),  (num)->
                                return (parseInt(num.get('status')) == parseInt(status.get('id')) || 
                                parseInt(num.get('status')) == parseInt(status_onhold.get('id'))) &&
                                num.get('unitType') == item.id


                        )

                        count = App.currentStore.unit.where({unitType:item.id,'status':status.get('id')})

                        if parseInt(item.id) == 9
                            classname = 'twoBHK'
                        else if parseInt(item.id) == 19
                            classname = 'oneBHK'
                        else
                            classname = 'threeBHK'

                        mainnewarr.push({id:item.id,name:item.name,classname:classname,count:count})
                        mainunique[item.id] = item;


            )


            buildingUnits = []
            $.each(buildingArray, (index,value)->
                units = App.currentStore.unit.where({'building':parseInt(value)})
                buildingUnits.push 
                    'id' : value
                    'count' : units.length
            )

            
                

            buildingCollection = new Backbone.Collection buildingUnits
            [buildingCollection ,unitVariantModels,unitVariantID,unitVariantID,viewModels,facingModels,viewID,facingID,terraceModels,terraceID]





    msgbus.registerController 'screen:two', ScreenTwoController