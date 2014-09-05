(function() {
  var Exposer;

  Exposer = function(element, options) {
    this.options = $.extend({}, this.defaults, options);
    this.element = element;
    this.$element = $(element);
    this.init();
    return this;
  };

  Exposer.prototype.defaults = {
    exposer: '.exposer',
    exposeeClass: 'hidden',
    destroyParent: false
  };

  Exposer.prototype.init = function() {
    return this.$element.on('click.exposer', this.options.exposer, (function(_this) {
      return function(event) {
        $(event.delegateTarget).find('.' + _this.options.exposeeClass).removeClass(_this.options.exposeeClass);
        if (_this.options.destroyParent) {
          $(event.target).parent().remove();
        } else {
          $(event.target).remove();
        }
        return event.preventDefault();
      };
    })(this));
  };

  $.fn.exposer = function(options) {
    return this.each(function() {
      var $this, plugin;
      $this = $(this);
      if ($this.data('plugin_exposer') === void 0) {
        plugin = new Exposer(this, options);
        return $this.data('plugin_exposer', plugin);
      }
    });
  };

}).call(this);
