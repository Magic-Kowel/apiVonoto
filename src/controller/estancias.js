import { connect } from "../database"

export const estancias = async (req,res) =>{
    const connection = await connect();
    const [rows] = await connection.query(`
    SELECT 
    estancia.id_estancia,
    DATE_FORMAT(estancia.tiempo_inicio,'%c/%e/%Y %h:%i:%s %p') as tiempo_inicio,
    DATE_FORMAT(estancia.tiempo_fin,'%c/%e/%Y %h:%i:%s %p') as tiempo_fin ,
    veiculo.placa,
    tipo_veiculo.tipo,
    estancia.coste_estancia
    FROM estancia 
    INNER JOIN veiculo on estancia.id_veiculo = veiculo.id_veiculo 
    INNER JOIN tipo_veiculo on tipo_veiculo.id_tipo_veiculo = veiculo.id_tipo_veiculo 
    AND estancia.estatus = 1`);
    res.json(rows);
}
export const estanciasReporte = async (req,res) =>{
    const connection = await connect();
    const [rows] = await connection.query(`
    SELECT 
    sum(TIMESTAMPDIFF(MINUTE,tiempo_inicio,tiempo_fin)) as minutos,
    veiculo.placa,
    sum(tipo_veiculo.importe*TIMESTAMPDIFF(MINUTE,tiempo_inicio,tiempo_fin)) as coste
    FROM estancia 
    INNER JOIN veiculo on estancia.id_veiculo = estancia.id_veiculo 
    INNER JOIN tipo_veiculo on tipo_veiculo.id_tipo_veiculo = veiculo.id_tipo_veiculo 
    AND estancia.estatus = 1`);
    res.json(rows);
}
export const estancia = async (req,res) =>{
    const connection = await connect();
    const [rows] = await connection.query('SELECT * FROM estancia WHERE id_estancia = ?',
    [
        req.params.id
    ]);
    res.json(rows[0]);
}
export const altaEstancias = async (req,res) =>{
    const connection = await connect();
    const [results] = await connection.query("INSERT INTO estancia (id_veiculo) VALUES (?)",
    [
        req.body.id_veiculo
    ]);
    res.json({
        id:results.insertId,
        ...req.body
    });
}
export const finalizarEstancia = async (req,res) =>{
    const connection = await connect();
    const [minutos] = await connection.query(`select TIMESTAMPDIFF(MINUTE,tiempo_inicio,tiempo_fin) as minutos
        from estancia 
        where id_estancia= ?`,[
        req.params.id
    ]);
    const [importe] = await connection.query(`SELECT tipo_veiculo.importe 
    FROM estancia 
    INNER JOIN veiculo on estancia.id_veiculo = estancia.id_veiculo 
    INNER JOIN tipo_veiculo on tipo_veiculo.id_tipo_veiculo = veiculo.id_tipo_veiculo 
    WHERE estancia.id_estancia = ?
    AND estancia.estatus = 1
    limit 1`,[
    req.params.id
    ]);
    // console.log("minutos",minutos[0].minutos);
    // console.log("importe",importe[0].importe);
    const costo = (minutos[0].minutos * importe[0].importe);
    // console.log("costo",costo);
    const results = await connection.query(`UPDATE estancia 
    SET tiempo_fin = NOW(),
    coste_estancia = ${costo}
    WHERE estancia.id_estancia = ?`,[
        req.params.id
    ]);
    res.sendStatus(204)
}
export const resetearEstancia = async (req,res) =>{
    const connection = await connect();
    const results = await connection.query(`UPDATE estancia 
        SET estatus = 0
        WHERE estancia.id_veiculo = 
        (
            SELECT id_tipo_veiculo 
            FROM veiculo
            WHERE id_tipo_veiculo =1
        )`);
    res.sendStatus(204)
}