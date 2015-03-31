// Generated by CoffeeScript 1.8.0
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['marionette'], function(Marionette) {
  var ScreenThreeView;
  return ScreenThreeView = (function(_super) {
    __extends(ScreenThreeView, _super);

    function ScreenThreeView() {
      return ScreenThreeView.__super__.constructor.apply(this, arguments);
    }

    ScreenThreeView.prototype.template = '<div> <form id="store_order" parsley-validate> <input type="hidden" required  name="user_id" id="user_id" value="' + unit_id + '" /> <span>First name : </span> <input type="text" required data-parsley-type="alphanum" name="first_name" id="first_name" value="" /> <span>Last name : </span> <input type="text" required data-parsley-type="alphanum" name="last_name" id="last_name" value="" /> <span>Email : </span> <input type="email" type="number" data-parsley-trigger="change" required name="email" id="email" value="" /> <span>Phone : </span> <input type="text" required name="phone" id="phone" value="" /> <span>Birthdate : </span> <input type="text" required name="birthdate" id="birthdate" value="" /> <span>Nationality: </span> <select name="nationality" id="nationality" required> <option value=""></option> <option value="indian">Indian</option> <option value="poi">POI/OCI</option> <option value="nri">NRI</option> </select> <span>Address : </span> <input type="text" name="address" required id="address" value="" /> <span>City : </span> <input type="text" name="city"  data-parsley-type="alphanum"requiredid="city" value="" /> <span>State : </span> <input type="text" name="state" data-parsley-type="alphanum" required id="state" value="" /> <span>Zipcode : </span> <input type="text" name="zipcode" type="number" requiredid="zipcode" value="" /> <span>Country : </span> <select name="country" id="country" required> <option value=""></option> <option value="india">India</option> <option value="china">China</option> <option value="nepal">Nepal</option> </select> </form> </div> <div class="text-center"> <button id="payment" class="next-three btn btn-primary"> Continue to Payment </button> </div>';

    ScreenThreeView.prototype.events = {
      'click #payment': function(e) {
        e.preventDefault();
        if ($('#store_order').parsley().validate()) {
          $.ajax({
            type: 'POST',
            url: SITEURL + '/wp-json/units/' + unit_id,
            data: $('#store_order').serialize(),
            success: function(response) {},
            error: function(response) {}
          });
        }
        $('.accordion-group.three').removeClass('open');
        return $('.accordion-group.four').addClass('open');
      }
    };

    ScreenThreeView.prototype.onShow = function() {
      return $('#birthdate').datepicker({
        dateFormat: 'yy-mm-dd',
        changeYear: true,
        changeMonth: true,
        maxDate: new Date(),
        yearRange: "-100:+0"
      });
    };

    return ScreenThreeView;

  })(Marionette.ItemView);
});
