import {Router} from 'express';
import {
    tipoVeiculos,
    tipoVeiculo,
    altatipoVeiculos,
    bajaTipoVeiculos,
    editarTipoVeiculos
} from '../controller/tipoVeiculos';
const router =  Router();

router.get('/tipoveiculos', tipoVeiculos);
router.get('/tipoveiculos/:id',tipoVeiculo);
router.post('/tipoveiculos', altatipoVeiculos);
router.delete('/tipoveiculos/:id', bajaTipoVeiculos);
router.put('/tipoveiculos/:id', editarTipoVeiculos);
export default router;