function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

var PopupInterface =
/*#__PURE__*/
function () {
  function PopupInterface() {
    _classCallCheck(this, PopupInterface);
  }

  _createClass(PopupInterface, [{
    key: "open",
    value: function open() {
      var _this = this;

      var pop = document.querySelector('#popup');

      if (pop) {
        pop.style.display = "inline";
      }

      var closeButton = document.querySelector('.close');

      if (closeButton) {
        closeButton.addEventListener('click', function (event) {
          event.preventDefault();

          _this.close();
        });
      }
    }
  }, {
    key: "close",
    value: function close() {
      var pop = document.querySelector('#popup');

      if (pop) {
        pop.style.display = "none";
      }
    }
  }, {
    key: "render",
    value: function render(chaine) {
      var dialog = document.querySelector('.modal-dialog');

      if (!dialog) {
        return;
      }

      dialog.innerHTML = chaine;
    }
  }, {
    key: "error",
    value: function error(chaine) {
      var error = document.querySelector("#error");

      if (error) {
        error.innerHTML = chaine;
      }
    }
  }, {
    key: "champsVide",
    value: function champsVide() {
      this.error("All field is required. Please complete it.");
    }
  }]);

  return PopupInterface;
}();

export { PopupInterface as default };
//# sourceMappingURL=PopupInterface.js.map