import mysql from 'promise-mysql';
//import { createPool } from "promise-mysql";

import keys from './keys';


const pool = mysql.createPool(keys.database);

pool.getConnection()
        .then(connection => {
        pool.releaseConnection(connection);
        console.log('DB is connected');
    });

//pool.then((r: any) => r.getConnection().then((connection:any)=>{
//    r.releaseConnection(connection);
//   console.log('Conexion exitosa.')
//}));

    export default pool;