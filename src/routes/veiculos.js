import { Router } from "express";
import {
    altaVeiculos,
    editarVeiculos,
    bajaVeiculos,
    veiculo,
    veiculos
} from "../controller/veiculos";

const router = Router();
router.get('/veiculos',veiculos);
router.get('/veiculos/:id',veiculo);
router.post('/veiculos',altaVeiculos);
router.delete('/veiculos/:id',bajaVeiculos);
router.put('/veiculos/:id', editarVeiculos);
export default router;