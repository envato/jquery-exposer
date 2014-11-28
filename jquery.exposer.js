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
    destroyParent: false,
    parent: false
  };

  Exposer.prototype.init = function() {
    return this.$element.on('click.exposer', this.options.exposer, (function(_this) {
      return function(event) {
        var $parentElement;
        $(event.delegateTarget).find('.' + _this.options.exposeeClass).removeClass(_this.options.exposeeClass);
        if (_this.options.destroyParent) {
          $parentElement = _this.options.parent ? $(_this.options.parent) : $(event.target).parent();
          $parentElement.remove();
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
