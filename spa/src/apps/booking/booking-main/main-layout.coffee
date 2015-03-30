define [ 'extm'], ( Extm)->

    # Main controller
    view = []
    facing = []
    facingnames = []
    viewnames = []
    class MainController extends Extm.RegionController

        initialize : ->

            @layout = layout = @_getView()

            App.layout = @layout

            #listen to show event of layout to trigger sub apps
            @listenTo layout, 'show', @showRegionViews

            #show the layout
            @show layout

        showRegionViews: =>
            msgbus.showApp 'booking:header'
            .insideRegion  App.headerRegion
                .withOptions()

            
            msgbus.showApp 'booking:screen:one'
            .insideRegion  @layout.screenOneRegion
                .withOptions()

        _getView: =>
            new mainView
                templateHelpers:
                    SITEURL : SITEURL
                    VIEWS : VIEWS
                    FACINGS : FACINGS


    class mainView extends Marionette.LayoutView

        template: '
        <div id="notify" class="notifyBox" style="display:none;">
            You have clicked on a box!
        </div>
       
        <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2">
            <h3>My Menu</h3>
            <ul>
                <li><a href="#"><span class="glyphicon glyphicon-heart"></span> Wishlist</a>
                    <div id="comparetext" class="compareTxt">
                        Compare Apartments here!<br>You can compare up to 4 apartments.
                    </div><input type="hidden" name="currency_main" id="currency_main" class="demo" data-a-sign="Rs. " data-m-dec=""  data-d-group="2" >
                    <ul class="menuWishlist" id="showWishlist">
                    </ul>
                </li>
                <a href="#" id="compare" class="compareBtn">COMPARE</a>
            </ul>
            

        </nav>
        
        

        <div id="screen-one-region" class="section">

        </div>
        <div id="screen-two-region" >

        </div>
        <div id="screen-three-region" >

        </div>
        <div id="screen-four-region" >

        </div>

        '

        





        regions:
            screenOneRegion: '#screen-one-region'
            screenTwoRegion: '#screen-two-region'
            screenThreeRegion: '#screen-three-region'
            screenFourRegion: '#screen-four-region'


        





    msgbus.registerController 'booking:main:app', MainController