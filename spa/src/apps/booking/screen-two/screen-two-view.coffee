define [ 'marionette' ], ( Marionette )->

   class ScreenTwoView extends Marionette.ItemView

        template : '<div class="costshett">
                        <span>Flat name : </span><span class="flat_name"></span>
                        <span>Building name : </span><span class="building_name"></span>
                        <span>Amount recievable as on Date : </span><span class="rec"></span>
                        <span>Final cost : </span><span class="final_cost"></span>
                    </div>

                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <button id="accept" class="next-one btn btn-primary btn-block">
                                Accept Terms and Conditions
                            </button>
                        </div>
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





       
           





    










