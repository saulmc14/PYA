"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var promise_mysql_1 = __importDefault(require("promise-mysql"));
//import { createPool } from "promise-mysql";
var keys_1 = __importDefault(require("./keys"));
var pool = promise_mysql_1.default.createPool(keys_1.default.database);
pool.getConnection()
    .then(function (connection) {
    pool.releaseConnection(connection);
    console.log('DB is connected');
});
//pool.then((r: any) => r.getConnection().then((connection:any)=>{
//    r.releaseConnection(connection);
//   console.log('Conexion exitosa.')
//}));
exports.default = pool;
