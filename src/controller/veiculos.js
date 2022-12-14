import { connect } from "../database";
export const veiculos = async (req,res) =>{
    const connection = await connect();
    const [row] = await connection.query("SELECT * FROM veiculo");
    res.json(row);
}
export const veiculosActivos = async (req,res) =>{
    const connection = await connect();
    const [row] = await connection.query(`SELECT veiculo.id_veiculo, 
    veiculo.placa, 
    veiculo.estatus,
    veiculo.id_tipo_veiculo,
    tipo_veiculo.tipo 
    FROM veiculo 
    INNER JOIN tipo_veiculo on veiculo.id_tipo_veiculo = tipo_veiculo.id_tipo_veiculo 
    WHERE veiculo.estatus = 1`);
    res.json(row);
}
export const veiculo = async (req,res)=>{
    const connection = await connect();
    const [rows] = await connection.query("SELECT * FROM veiculo where id_veiculo = ?",
    [
        req.params.id
    ]);
    res.json(rows[0]);
}
export const altaVeiculos = async (req,res)=>{
    const connection = await connect();
    const [results] = await connection.query("INSERT INTO veiculo (placa,id_tipo_veiculo) VALUES (?,?)",
    [
        req.body.placa,
        req.body.id_tipo_veiculo
    ]);
    res.json({
        id:results.insertId,
        ...req.body
    });
}
export const bajaVeiculos = async (req,res)=>{
    const connection = await connect();
    await connection.query("UPDATE veiculo SET estatus = 0 WHERE id_veiculo = ? ",
    [
        req.params.id
    ]);
    console.log();
    res.sendStatus(204);
}
export const editarVeiculos = async (req,res) =>{
    const connection = await connect();
    const results = await connection.query("UPDATE veiculo SET ? WHERE veiculo.id_veiculo = ?",[
        req.body,
        req.params.id
    ]);
    res.sendStatus(204)
}
 
