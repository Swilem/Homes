define [ 'marionette' ], ( Marionette )->

   class ScreenThreeView extends Marionette.ItemView

        template : '<div>
                    <form id="store_order" parsley-validate>
                    <input type="hidden" required  name="user_id" id="user_id" value="'+unit_id+'" />
                    <span>First name : </span>
                    <input type="text" required data-parsley-type="alphanum" name="first_name" id="first_name" value="" />
                    <span>Last name : </span>
                    <input type="text" required data-parsley-type="alphanum" name="last_name" id="last_name" value="" />
                    <span>Email : </span>
                    <input type="email" type="number" data-parsley-trigger="change" required name="email" id="email" value="" />
                    <span>Phone : </span>
                    <input type="text" required name="phone" id="phone" value="" />
                    <span>Birthdate : </span>
                    <input type="text" required name="birthdate" id="birthdate" value="" />
                    <span>Nationality: </span>
                    <select name="nationality" id="nationality" required>
                    <option value=""></option>
                    <option value="indian">Indian</option>
                    <option value="poi">POI/OCI</option>
                    <option value="nri">NRI</option>
                    </select>
                    <span>Address : </span>
                    <input type="text" name="address" required id="address" value="" />
                    <span>City : </span>
                    <input type="text" name="city"  data-parsley-type="alphanum"requiredid="city" value="" />
                    <span>State : </span>
                    <input type="text" name="state" data-parsley-type="alphanum" required id="state" value="" />
                    <span>Zipcode : </span>
                    <input type="text" name="zipcode" type="number" requiredid="zipcode" value="" />
                    <span>Country : </span>
                    <select name="country" id="country" required>
                    <option value=""></option>
                    <option value="india">India</option>
                    <option value="china">China</option>
                    <option value="nepal">Nepal</option>
                    </select>

                    </form>

                    </div>

                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <button id="payment" class="next-one btn btn-primary btn-block">
                                Continue to Payment
                            </button>
                        </div>
                    </div>'


        events:
            'click #payment':(e)->
                e.preventDefault()
                if $('#store_order').parsley().validate()
                    $.ajax({
                        type : 'POST',
                        url : SITEURL+'/wp-json/units/'+unit_id,
                        data : $('#store_order').serialize(),
                        success:(response)->
                            
                        error :(response)->



                    })
                $('.accordion-group.three').removeClass('open')
                $('.accordion-group.four').addClass('open')

        onShow:->
            $('#birthdate').datepicker({
                dateFormat : 'yy-mm-dd'
                changeYear: true,
                changeMonth: true,
                maxDate: new Date(),
                yearRange: "-100:+0",
            });







       
           





    










