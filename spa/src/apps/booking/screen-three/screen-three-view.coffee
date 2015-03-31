define [ 'marionette' ], ( Marionette )->

   class ScreenThreeView extends Marionette.ItemView

        template : '<div>
                        <div class="alert alert-warning">All fields are mandatory</div>
                        <form id="store_order" parsley-validate class="details-form">
                            <input type="hidden" required  name="user_id" id="user_id" value="'+unit_id+'" />
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>First Name: </label>
                                        <input type="text" placeholder="Enter First Name" class="form-control" required data-parsley-type="alphanum" name="first_name" id="first_name" value="" />
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>Last Name: </label>
                                        <input type="text" placeholder="Enter Last Name" class="form-control" required data-parsley-type="alphanum" name="last_name" id="last_name" value="" />
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>Email: </label>
                                        <input type="email" placeholder="Enter Email Address" class="form-control" type="number" data-parsley-trigger="change" required name="email" id="email" value="" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>Phone: </label>
                                        <input type="text" placeholder="Enter Phone Number" class="form-control" required name="phone" id="phone" value="" />
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>Birthdate: </label>
                                        <input type="text" placeholder="Enter Date of Birth" class="form-control" required name="birthdate" id="birthdate" value="" />
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>Nationality: </label>
                                        <select class="form-control" name="nationality" id="nationality" required>
                                            <option value="">Select Nationality</option>
                                            <option value="indian">Indian</option>
                                            <option value="poi">POI/OCI</option>
                                            <option value="nri">NRI</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>Address: </label>
                                        <input type="text" class="form-control" placeholder="Enter Address" name="address" required id="address" value="" />
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>City: </label>
                                        <input type="text" class="form-control" name="city"  placeholder="Enter City"  data-parsley-type="alphanum" required id="city" value="" />
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>State: </label>
                                        <input type="text" class="form-control" name="state" placeholder="Enter State" data-parsley-type="alphanum" required id="state" value="" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>Zipcode: </label>
                                        <input type="text" class="form-control" name="zipcode" placeholder="Enter Zipcode" type="number" required id="zipcode" value="" />
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>Country: </label>
                                        <select class="form-control" name="country" id="country" required>
                                            <option value="">Select Country</option>
                                            <option value="india">India</option>
                                            <option value="china">China</option>
                                            <option value="nepal">Nepal</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">

                                </div>
                            </div>
                        </form>

                    </div>

                    <div class="text-center">
                        <button id="payment" class="next-three btn btn-primary">
                            Continue to Payment
                        </button>
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
                            $('.accordion-group.three').removeClass('open')
                            $('.accordion-group.four').addClass('open')
                            
                        error :(response)->



                    })


        onShow:->
            $('#birthdate').datepicker({
                dateFormat : 'yy-mm-dd'
                changeYear: true,
                changeMonth: true,
                maxDate: new Date(),
                yearRange: "-100:+0",
            });







       
           





    










