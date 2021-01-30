"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var express_1 = require("express");
var gamesController_1 = __importDefault(require("../controllers/gamesController"));
var GamesRoutes = /** @class */ (function () {
    function GamesRoutes() {
        this.router = express_1.Router();
        this.config();
    }
    GamesRoutes.prototype.config = function () {
        this.router.get('/', gamesController_1.default.list);
        this.router.get('/:id', gamesController_1.default.Onegame);
        this.router.post('/', gamesController_1.default.create);
        this.router.put('/:id', gamesController_1.default.updata);
        this.router.delete('/:id', gamesController_1.default.delete);
    };
    return GamesRoutes;
}());
var gamesRoutes = new GamesRoutes();
exports.default = gamesRoutes.router;
