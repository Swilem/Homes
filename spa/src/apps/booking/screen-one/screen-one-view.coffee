define [ 'marionette' ], ( Marionette )->

   class ScreenOneView extends Marionette.ItemView


   		template :'<div class="row">
   						<div class="col-md-6">
   							<h4>Sign up for fast and easy checkout</h4>
   							<ul class="information-ans">
   							<li class="why-signup">Complete your booking securely through our payment gateway.</li>
   							<li class="why-signup">Receive updates directly in your inbox.</li>
   							<li class="why-signup">Keep track of your searches and shortlist across platforms.</li>
   							<li class="why-signup">Save your details for faster checkout. </li>
   							</ul>
						</div>
						<div class="col-md-6">
		   					<div class="wp-social-login-widget socailMedia">

							<div class="wp-social-login-connect-with">Connect with:</div>

							<div class="wp-social-login-provider-list">

								<a rel="nofollow" href="http://localhost/aprtmentnetwork/homes/wp-login.php?action=wordpress_social_authenticate&amp;mode=login&amp;provider=Facebook&amp;redirect_to=http%3A%2F%2Flocalhost%2Faprtmentnetwork%2Fhomes%2Fbooking%2F" title="Connect with Facebook" class="wp-social-login-provider wp-social-login-provider-facebook" data-provider="Facebook">
									<img alt="Facebook" title="Connect with Facebook" src="http://localhost/aprtmentnetwork/homes/wp-content/plugins/wordpress-social-login/assets/img/32x32/wpzoom/facebook.png">
								</a>

								<a rel="nofollow" href="http://localhost/aprtmentnetwork/homes/wp-login.php?action=wordpress_social_authenticate&amp;mode=login&amp;provider=Google&amp;redirect_to=http%3A%2F%2Flocalhost%2Faprtmentnetwork%2Fhomes%2Fbooking%2F" title="Connect with Google" class="wp-social-login-provider wp-social-login-provider-google" data-provider="Google">
									<img alt="Google" title="Connect with Google" src="http://localhost/aprtmentnetwork/homes/wp-content/plugins/wordpress-social-login/assets/img/32x32/wpzoom/google.png">
								</a>

							</div> 

							<div class="wp-social-login-widget-clearing"></div>

						</div>
						<div class="userinfo"></div>
						</div>
					</div>
					

					<div class="text-center">
						<button class="next-one btn disabled btn-default">
			                Next
			            </button>
				     </div>
					'

   		onShow:->

   			usermodel = new Backbone.Model USER

   			if parseInt(usermodel.get('id')) != 0
			    $.ajax(
			    	type : 'POST',
			    	url : SITEURL+'/wp-json/unitstatus/'+unit_id,
			    	data : 'user_id='+usermodel.get('id')
			    	success:(response)->
			    		console.log "success"
			    	error:(response)->
			    		console.log "error"




			    )
			    $(".next-one").removeClass 'disabled btn-default'
			    $('.next-one').addClass 'btn-primary'
   				$('.socailMedia').hide()
   				$('.userinfo').text 'Welcome '+usermodel.get('display_name')
   				msgbus.showApp 'booking:screen:two'
   				.insideRegion  App.layout.screenTwoRegion
   					.withOptions()

   			$('.next-one').click ->
   			  $('.accordion-group.one').removeClass('open')
   			  $('.accordion-group.two').addClass('open')
   			  return
			







	










