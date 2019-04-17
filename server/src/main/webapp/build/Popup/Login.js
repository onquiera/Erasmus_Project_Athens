function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

function _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }

function _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return self; }

function _get(target, property, receiver) { if (typeof Reflect !== "undefined" && Reflect.get) { _get = Reflect.get; } else { _get = function _get(target, property, receiver) { var base = _superPropBase(target, property); if (!base) return; var desc = Object.getOwnPropertyDescriptor(base, property); if (desc.get) { return desc.get.call(receiver); } return desc.value; }; } return _get(target, property, receiver || target); }

function _superPropBase(object, property) { while (!Object.prototype.hasOwnProperty.call(object, property)) { object = _getPrototypeOf(object); if (object === null) break; } return object; }

function _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }

function _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }

import PopupInterface from '../Popup/PopupInterface.js';

var Login =
/*#__PURE__*/
function (_PopupInterface) {
  _inherits(Login, _PopupInterface);

  function Login() {
    _classCallCheck(this, Login);

    return _possibleConstructorReturn(this, _getPrototypeOf(Login).call(this));
  }

  _createClass(Login, [{
    key: "open",
    value: function open() {
      this.render();

      _get(_getPrototypeOf(Login.prototype), "open", this).call(this);

      var register = document.querySelector('#SignUp');
      register.addEventListener('click', this.openRegister);
    }
  }, {
    key: "openRegister",
    value: function openRegister(event) {
      event.preventDefault();
      var register = new Register();
      register.open();
    }
  }, {
    key: "render",
    value: function render() {
      var result = "  \n    <!-- Modal content-->\n      <div class=\"modal-content\">\n        <div class=\"modal-header\" style=\"padding:35px 50px;\">\n          <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n          <h4><span class=\"glyphicon glyphicon-lock\"></span> Login</h4>\n        </div>\n        <div class=\"modal-body\" style=\"padding:40px 50px;\">\n          <form role=\"form\">\n            <div class=\"form-group\">\n              <label for=\"usrname\"><span class=\"glyphicon glyphicon-user\"></span> Username</label>\n              <input type=\"text\" class=\"form-control\" id=\"usrname\" placeholder=\"Enter email\">\n            </div>\n            <div class=\"form-group\">\n              <label for=\"psw\"><span class=\"glyphicon glyphicon-eye-open\"></span> Password</label>\n              <input type=\"protected\" class=\"form-control\" id=\"psw\" placeholder=\"Enter password\">\n            </div>\n            <div class=\"checkbox\">\n              <label><input type=\"checkbox\" value=\"\" checked>Remember me</label>\n            </div>\n              <button type=\"submit\" class=\"btn btn-success btn-block\"><span class=\"glyphicon glyphicon-off\"></span> Login</button>\n          </form>\n        </div>\n        <div class=\"modal-footer\">\n          <button type=\"submit\" class=\"btn btn-danger btn-default pull-left\" data-dismiss=\"modal\"><span class=\"glyphicon glyphicon-remove\"></span> Cancel</button>\n          <p>Not a member? <a id=\"SignUp\"href=\"#\">Sign Up</a></p>\n          <p>Forgot <a href=\"#\">Password?</a></p>\n        </div>\n      </div>\n      \n    </div>\n  </div> \n  </div>";

      _get(_getPrototypeOf(Login.prototype), "render", this).call(this, result);
    }
  }]);

  return Login;
}(PopupInterface);

export { Login as default };
//# sourceMappingURL=Login.js.map