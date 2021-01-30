import {Request, Response} from 'express';

class IndexController{
    public index (req:Request, res:Response) {
     //res.send('hola2')
     res.json({text: 'API is /api/games'});
    }
}

export const indexController = new IndexController();
export default indexController;