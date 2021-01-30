"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.indexController = void 0;
var IndexController = /** @class */ (function () {
    function IndexController() {
    }
    IndexController.prototype.index = function (req, res) {
        //res.send('hola2')
        res.json({ text: 'API is /api/games' });
    };
    return IndexController;
}());
exports.indexController = new IndexController();
exports.default = exports.indexController;
