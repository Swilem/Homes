define [ 'marionette' ], ( Marionette )->

   class ScreenTwoView extends Marionette.ItemView

        template : '<div class="costshett">
                        <div class="unitDetails">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="unitBox chargeArea"> 
                                        <h3 class="building_name"></h3> 
                                        <h4 class="titles">
                                            Building Name
                                        </h4> 
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="unitBox chargeArea"> 
                                        <h3 class="flat_name"></h3> 
                                        <h4 class="titles">
                                            Flat No.
                                        </h4> 
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="unitBox chargeArea"> 
                                        <h3 class="final_cost"></h3> 
                                        <h4 class="titles">
                                            Final cost
                                        </h4> 
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="unitBox unitNmbr"> 
                                        <h3 class="rec"></h3> 
                                        <h4 class="titles">
                                            Amount recievable as on Date
                                        </h4> 
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="text-center">
                        <div class="checkbox">
                            <label>
                              <input type="checkbox">I accept the <a href="http://manaslake.com/terms-conditions/" target="blank">Terms and Conditions</a>.
                            </label>
                        </div>                        
                        <button id="accept" class="next-one btn btn-primary">
                            NEXT
                        </button>
                    </div>'


        events:
            'click #accept':(e)->
                msgbus.showApp 'booking:screen:three'
                .insideRegion  App.layout.screenThreeRegion
                    .withOptions()
                $('.accordion-group.two').removeClass('open')
                $('.accordion-group.three').addClass('open')



        onShow:->
            $('.flat_name').text unit_name
            $('.building_name').text building
            $('.rec').text recAmount
            $('.final_cost').text finalcost





       
           





    










