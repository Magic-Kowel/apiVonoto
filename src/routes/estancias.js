import { Router } from "express";
import { estancias,
    estancia,
    altaEstancias,
    bajaEstancia,
    finalizarEstancia
} from "../controller/estancias";
 

const router = Router();
router.get('/estancias',estancias);
router.get('/estancias/:id',estancia);
router.post('/estancias',altaEstancias);
router.delete('/estancias/:id',bajaEstancia);
router.put('/estancias/:id', finalizarEstancia);
export default router;