// Generated by CoffeeScript 1.7.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['extm', 'src/apps/booking/screen-two/screen-two-view'], function(Extm, ScreenTwoView) {
  var ScreenTwoController;
  ScreenTwoController = (function(_super) {
    __extends(ScreenTwoController, _super);

    function ScreenTwoController() {
      return ScreenTwoController.__super__.constructor.apply(this, arguments);
    }

    ScreenTwoController.prototype.initialize = function() {
      var view;
      this.view = view = this._getUnitTypesView();
      return this.show(view);
    };

    ScreenTwoController.prototype._getUnitTypesView = function() {
      return new ScreenTwoView;
    };

    return ScreenTwoController;

  })(Extm.RegionController);
  return msgbus.registerController('booking:screen:two', ScreenTwoController);
});