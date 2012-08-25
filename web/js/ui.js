(function() {
  var CameraView, MainWindowView,
    __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  MainWindowView = (function(_super) {

    __extends(MainWindowView, _super);

    function MainWindowView() {
      MainWindowView.__super__.constructor.apply(this, arguments);
    }

    MainWindowView.prototype.initialize = function() {
      return this.$el.sortable({
        placeholder: "ui-state-highlight"
      }).disableSelection();
    };

    return MainWindowView;

  })(Backbone.View);

  CameraView = (function(_super) {

    __extends(CameraView, _super);

    function CameraView() {
      CameraView.__super__.constructor.apply(this, arguments);
    }

    CameraView.prototype.initialize = function(options) {
      this.opts = options;
      return this.render();
    };

    CameraView.prototype.render = function() {
      var _this = this;
      return navigator.webkitGetUserMedia('video', function(stream) {
        stream = window.webkitURL.createObjectURL(stream);
        return _this.$el.find('video').attr('src', stream);
      }, function(exception) {
        return console.log(exception);
      });
    };

    return CameraView;

  })(Backbone.View);

  $(document).ready(function() {
    var main_window;
    main_window = new MainWindowView({
      el: $('#main-window')
    });
    return main_window.camera_view = new CameraView({
      el: $('#camera-view'),
      main_window: main_window
    });
  });

}).call(this);