define [ 'extm', 'src/apps/popup/popup-view' ], ( Extm, PopupView )->

    class PopupController extends Extm.RegionController

        initialize :(opt = {})->

            @getAjaxData()


            


        _getPopupView:(Collection,classnamearr)->
            new PopupView
                collection : Collection
                templateHelpers:
                        selection :classnamearr



        _getUnitsCountCollection:(modelstring)->
            cookeArray = modelstring
            unitModelArray = []
            classnamearr = []
            roomcoll = []
            actualroom = []
            actroomColl = ""
            act = []
            if cookeArray.length != 0
                for element in cookeArray

                    unitModel = element
                    unitVariantModel = App.master.unit_variant.findWhere({id:unitModel.get 'unitVariant'})
                    roomSizesObject = unitVariantModel.get 'roomsizes'
                    
                    roomSizesArray = $.map(roomSizesObject, (index,value1)->
<<<<<<< HEAD
                           roomcoll.push({id:index.room_type_id,name:index.room_type})
=======
                           roomcoll.push(index.room_type_id)
>>>>>>> 51410a74a73becccecf5df23db6f2537364aec4e




                    )
            roomcoll = _.uniq(roomcoll)
            floorLayoutimage = ""
            if cookeArray.length != 0
                for element in cookeArray
                    unitModel = element
                    actualroom = []
                    buildingModel = App.master.building.findWhere({id:unitModel.get 'building'})
                    exceptionObject = buildingModel.get 'floorexceptionpositions'
                    $.each(exceptionObject, (index,value1)->
                        floorvalue = $.inArray( unitModel.get('floor'),value1.floors)
                        if floorvalue == -1
                            floorLayoutimage = buildingModel.get('floor_layout_detailed').image_url
                        else
                            if value1.floor_layout_detailed.image_url == ""
                                floorLayoutimage = buildingModel.get('floor_layout_detailed').image_url
                            else
                                floorLayoutimage = value1.floor_layout_detailed.image_url



                            )

                    if exceptionObject.legth == 0
                        floorLayoutimage = building.get('floor_layout_detailed').image_url


                        
                    floorriserange = buildingModel.get 'floorriserange'
                    #floorriserange = [{"name":"low","start":"1","end":"2"},{"name":"medium","start":"3","end":"4"},{"name":"high","start":"5","end":"6"}]
                    rangeArrayVal = []
                    i = 0
                    $.each(floorriserange, (index,value)->
                        rangeArrayVal = []
                        i = 0
                        start = parseInt(value.start)
                        end = parseInt(value.end)
                        while parseInt(start) <= parseInt(end)
                            rangeArrayVal[i] = start
                            start = parseInt(start) + 1
                            i++
                        rangename = ""
                        if jQuery.inArray(parseInt(unitModel.get('floor')),rangeArrayVal) >= 0
                            if value.name == "medium"
                                rangename = "mid"
                            else
                                rangename = value.name
                            rangename = _.str.capitalize rangename
                            unitModel.set "flooRange" ,rangename+'rise'



                    )
                    viewModelArray = []
                    facingModelArray = []
                    unitTypeModel = App.master.unit_type.findWhere({id:unitModel.get 'unitType'})
                    unitTypeModelName = unitTypeModel.get('name' ).split(' ')
                    unitVariantModel = App.master.unit_variant.findWhere({id:unitModel.get 'unitVariant'})
                    unitModel.set "sellablearea" ,unitVariantModel.get 'sellablearea'
                    unitModel.set "carpetarea" ,unitVariantModel.get 'carpetarea'
                    unitModel.set "terracearea" ,unitVariantModel.get 'terracearea'
                    unitModel.set "unitTypeName" ,unitTypeModelName[0]
                    unitModel.set "buidlingName" ,buildingModel.get 'name'
                    unitModel.set 'TwoDimage' , unitVariantModel.get('url2dlayout_image')
                    unitModel.set 'ThreeDimage' , unitVariantModel.get('url3dlayout_image')
                    unitModel.set 'floorLayoutimage' , floorLayoutimage
                    unitModel.set 'BuildingPositionimage' , buildingModel.get('positioninproject').image_url
                    if unitModel.get('views_name') != ""
                        viewsArray = unitModel.get('views_name')
                        for element in viewsArray
                            viewModel = App.master.view.findWhere({id:parseInt(element)})
                            viewModelArray.push(viewModel.get('name'))
                    else
                        viewModelArray.push('-----')
                    unitModel.set 'views',viewModelArray.join(',')
                    facingssArray = unitModel.get('facing_name' )
                    if facingssArray.length != 0
                        for element in facingssArray
                            facingModel = App.master.facings.findWhere({id:parseInt(element)})
                            facingModelArray.push(facingModel.get('name'))

                    else
                        facingModelArray.push('-----')

                    unitModel.set 'facings',facingModelArray.join(',')
                    roomSizesObject = unitVariantModel.get 'roomsizes'
                    roomsizearray = []
                    # roomTypeArr = [68,71,72,70,66]
                    roomTypeArr = roomcoll
                    roomSizesArray = $.map(roomSizesObject, (index,value1)->
                        [index]




                    )
                    terraceoptions = unitVariantModel.get 'terraceoptions'
                    if terraceoptions == null
                        terraceoptionstext = '---------'
                    else
                        terraceoptionstext = unitVariantModel.get 'terraceoptions'

                    unitModel.set 'terraceoptions','with '+terraceoptionstext
                    terraceoptions = 'with '+terraceoptionstext
                    roomsizearr = []
                    mainArr = []
                    roomsizesCollection = new Backbone.Collection roomSizesArray
                    $.each(roomTypeArr, (ind,val)->
                        roomsizearr = []
                        roomtypename = ''
<<<<<<< HEAD
                        roomtypeid = val.id
                        roomtypename = val.name
                        roomtype = roomsizesCollection.where({room_type_id:parseInt(val.id)})
                        if roomtype != undefined
                            $.each(roomtype, (index1,value1)->
                                
                                
=======
                        roomtypeid = ""
                        roomtype = roomsizesCollection.where({room_type_id:parseInt(val)})
                        if roomtype != undefined
                            $.each(roomtype, (index1,value1)->
                                roomtypename = value1.get('room_type')
                                roomtypeid = value1.get('room_type_id')
>>>>>>> 51410a74a73becccecf5df23db6f2537364aec4e
                                roomsizearr.push({room_size:value1.get('room_size'),room_type:value1.get('room_type')})


                            )
                            roomsizearr.sort( (a,b)->
                                b.room_size - a.room_size

                            )
                            if roomsizearr.length ==0
<<<<<<< HEAD
                                roomsizearr.push({room_size:'----'})
=======
                                roomsizearr = '------------'
>>>>>>> 51410a74a73becccecf5df23db6f2537364aec4e
                            mainArr.push({id:roomtypeid,name:roomtypename,subarray:roomsizearr})

                        


                    )
<<<<<<< HEAD
                    
=======
>>>>>>> 51410a74a73becccecf5df23db6f2537364aec4e
                    actroom = []
                    $.each(mainArr, (ind,val)->
                        classnamearr.push({id:val.id, name:val.name,subarray:val.subarray})
                        actroom.push({id:val.id, name:val.name,subarray:val.subarray})
                       


                    )
<<<<<<< HEAD
                    id = ""
                    actroomColl =  new Backbone.Collection actroom
                    actualroom = []
                    coll = []
                    
=======
                    console.log actroom
                    actroomColl =  new Backbone.Collection actroom
                    actualroom = []
                    coll = []
>>>>>>> 51410a74a73becccecf5df23db6f2537364aec4e
                    $.each(roomcoll, (inde,value)->
                        classname = ''
                        coll = []
                        $.each(classnamearr, (ind,val)->
<<<<<<< HEAD
                            if parseInt(val.id) == parseInt(value.id)
                                if val.subarray != '----'
                                    coll.push({id:value.id,name:val.name,subarray:val.subarray,classname:classname})
=======
                            if parseInt(val.id) == parseInt(value)
                                coll.push({id:value,name:val.name,subarray:val.subarray,classname:classname})
>>>>>>> 51410a74a73becccecf5df23db6f2537364aec4e

                        )

                        
                        if coll.length == 0
                            id = actroomColl.get value
<<<<<<< HEAD
                            
=======
                            actroomColl.remove(id)
>>>>>>> 51410a74a73becccecf5df23db6f2537364aec4e

                       

                    )
                    act = []
                    actroomColl.each (item)->
<<<<<<< HEAD
                        if id != item.get('id')
                            if item.get('subarray') != '----'
                                act.push({id:item.get('id'),name:item.get('name'),subarray:item.get('subarray')})
                            else
                                act.push({id:item.get('id'),name:item.get('name'),subarray:"-----------"}) 

                    
=======
                        if item.get('subarray').length != 0
                            act.push({id:item.get('id'),name:item.get('name'),subarray:item.get('subarray')})
                        else
                           act.push({id:item.get('id'),name:item.get('name'),subarray:"-----------"}) 

                    console.log act
>>>>>>> 51410a74a73becccecf5df23db6f2537364aec4e
                    unitModel.set 'mainArr',act
                    

                    
                    unitModelArray.push(unitModel)
                
                unitCollection = new Backbone.Collection unitModelArray
                
                @view = view = @_getPopupView unitCollection , act
                @show view


        getAjaxData:->
            cookeArray = localStorage.getItem("cookievalue" ).split(',')
            unitModelArray = []
            modelArray = []
            i = 0
            if cookeArray.length != 0
                for element in cookeArray
                    unitModel = App.master.unit.findWhere({id:parseInt(element)})
                    object = @
                    $.ajax(
                        method: "POST" ,
                        url : AJAXURL+'?action=get_unit_single_details',
                        data : 'id='+unitModel.get('id')+'&building='+unitModel.get('building'),
                        success :(result)-> 
                            i++
                            unitModel1 = App.master.unit.findWhere({id:parseInt(result.id)})
                            unitModel1.set 'persqftprice' , result.persqftprice
                            unitModel1.set 'views_name' , result.views
                            unitModel1.set 'facing_name' , result.facings
                            modelArray.push unitModel1
                            if i == cookeArray.length
                                object._getUnitsCountCollection(modelArray)
                        error:(result)->

                    )

                
                







    msgbus.registerController 'popup', PopupController