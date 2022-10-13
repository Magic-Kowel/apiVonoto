import { Router } from "express";
 
 
import { estancias,
    estancia,
    altaEstancias,
    finalizarEstancia,
    estanciasReporte,
    resetearEstancia
} from "../controller/estancias";
 

const router = Router();
router.get('/estancias',estancias);
router.get('/estancias/reporte',estanciasReporte);
router.get('/estancias/:id',estancia);
router.get('/estancias/:id',estancia);
router.post('/estancias',altaEstancias);
router.put('/estancias/:id', finalizarEstancia);
router.put('/resetear/estancia', resetearEstancia);
const pdfService = require('./../service/pdf-service');

router.get('/invoice', (req, res, next) => {
  const stream = res.writeHead(200, {
    'Content-Type': 'application/pdf',
    'Content-Disposition': `attachment;filename=invoice.pdf`,
  });
  pdfService.buildPDF(
    (chunk) => stream.write(chunk),
    () => stream.end()
  );
});
export default router;