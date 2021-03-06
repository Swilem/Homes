var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['extm', 'src/apps/screen-one/screen-one-view'], function(Extm, ScreenOneView) {
  var ScreenOneController;
  ScreenOneController = (function(_super) {
    __extends(ScreenOneController, _super);

    function ScreenOneController() {
      this._unitTypeClicked = __bind(this._unitTypeClicked, this);
      return ScreenOneController.__super__.constructor.apply(this, arguments);
    }

    ScreenOneController.prototype.initialize = function() {
      var view;
      this.unitTypeCollection = this._getUnitTypeCollection();
      this.view = view = this._getUnitTypesView(this.unitTypeCollection[0]);
      this.listenTo(view, "unit:type:clicked", this._unitTypeClicked);
      return this.show(view);
    };

    ScreenOneController.prototype._getUnitTypesView = function(unitTypeCollection) {
      return new ScreenOneView({
        collection: unitTypeCollection,
        templateHelpers: {
          priceArray: this.unitTypeCollection[1]
        }
      });
    };

    ScreenOneController.prototype._unitTypeClicked = function() {
      return App.navigate("screen-two", {
        trigger: true
      });
    };

    ScreenOneController.prototype._getUnitTypeCollection = function() {
      var Model, UnitsCollection, collection, element, modelArray, newUnits, priceArray, priceRange, priceUnits, rangeArray, status, units, _i, _len;
      Model = Backbone.Model.extend({});
      UnitsCollection = Backbone.Collection.extend({
        model: Model
      });
      modelArray = Array();
      collection = new UnitsCollection();
      status = App.currentStore.status.findWhere({
        'name': 'Available'
      });
      units = App.currentStore.unit.where({
        'status': status.get('id')
      });
      priceUnits = App.currentStore.unit;
      priceUnits.each(function(item) {
        var buildingModel, floorRise, floorRiseValue, unitPrice, unitVariantmodel;
        buildingModel = App.currentStore.building.findWhere({
          'id': item.get('building')
        });
        floorRise = buildingModel.get('floorrise');
        floorRiseValue = floorRise[item.get('floor')];
        unitVariantmodel = App.currentStore.unit_variant.findWhere({
          'id': item.get('unitVariant')
        });
        unitPrice = item.get('unitPrice');
        return item.set({
          'unitPrice': 'unitPrice',
          unitPrice: unitPrice
        });
      });
      priceRange = ['10-35 lakhs ', '35-45 lakhs ', '45-55 lakhs ', '55-65 lakhs '];
      priceArray = [];
      rangeArray = [];
      units = App.currentStore.unit.where({
        'status': status.get('id')
      });
      $.each(units, function(index, value) {
        var NewUnitCollection, budget_price, element, elementArray, max_coll, max_val, min_val, unitTypemodel, _i, _len;
        unitTypemodel = App.currentStore.unit_type.findWhere({
          'id': value.get('unitType')
        });
        if (unitTypemodel.get('id') !== 14 && unitTypemodel.get('id') !== 16) {
          NewUnitCollection = App.currentStore.unit.where({
            unitType: unitTypemodel.get('id')
          });
          max_coll = Array();
          for (_i = 0, _len = priceRange.length; _i < _len; _i++) {
            element = priceRange[_i];
            elementArray = element.split(' ');
            budget_price = elementArray[0].split('-');
            budget_price[0] = budget_price[0] + '00000';
            budget_price[1] = budget_price[1] + '00000';
            if (parseInt(value.get('unitPrice')) >= parseInt(budget_price[0]) && parseInt(value.get('unitPrice')) <= parseInt(budget_price[1])) {
              priceArray.push(element);
            }
          }
          $.each(NewUnitCollection, function(index, value) {
            var Variant;
            Variant = App.currentStore.unit_variant.findWhere({
              'id': value.get('unitVariant')
            });
            return max_coll.push(Variant.get('sellablearea'));
          });
          max_val = Math.max.apply(Math, max_coll);
          min_val = Math.min.apply(Math, max_coll);
          unitTypemodel.set({
            'max_value': max_val,
            'min_value': min_val
          });
          return modelArray.push(unitTypemodel);
        }
      });
      priceArray.sort(function(a, b) {
        var budget_pricea, budget_priceb;
        a = a.split(' ');
        budget_pricea = a[0].split('-');
        b = b.split(' ');
        budget_priceb = b[0].split('-');
        return budget_pricea[0] - budget_priceb[0];
      });
      priceArray = _.uniq(priceArray);
      for (_i = 0, _len = priceArray.length; _i < _len; _i++) {
        element = priceArray[_i];
        rangeArray.push({
          id: element,
          name: element
        });
      }
      collection.add(modelArray);
      newUnits = App.currentStore.unit.where();
      return [collection, rangeArray];
    };

    return ScreenOneController;

  })(Extm.RegionController);
  return msgbus.registerController('screen:one', ScreenOneController);
});
