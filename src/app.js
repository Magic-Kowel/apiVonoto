import express from "express";
import cors from 'cors';
import morgan from "morgan";
import tipoVeiculoRoutes from './routes/tipoVeiculos';
import veiculos from './routes/veiculos';
import estancias from './routes/estancias';
const app =  express();
app.use(cors());
app.use(morgan("dev"));
app.use(express.json())
app.use(tipoVeiculoRoutes);
app.use(veiculos);
app.use(estancias);
export default app;