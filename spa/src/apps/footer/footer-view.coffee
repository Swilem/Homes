define [ 'marionette' ], ( Mariontte )->

    class FooterView extends Marionette.ItemView

<<<<<<< HEAD
        template : '<div class="text-center">
        				<div class="link small termsLink" >Terms &amp; Conditions</div> |
        				<div class="salesLink text-center small">Sales Login</div>
        			</div>'
=======
        template : '<div class="link text-center small termsLink" >Terms &amp; Conditions</div>'
>>>>>>> 51410a74a73becccecf5df23db6f2537364aec4e

        events:
        	'click .link':(e)->
        		win = window.open('http://manaslake.com/terms-conditions/', '_blank')
<<<<<<< HEAD

        	'click .salesLink':(e)->
        		win = window.open('http://homes.skyi.com/wp-admin/', '_self')
=======
>>>>>>> 51410a74a73becccecf5df23db6f2537364aec4e
                
        		
       	