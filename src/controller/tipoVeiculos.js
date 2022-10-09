import { connect } from "../database"
export const tipoVeiculos = async (req,res) =>{
    const connection = await connect();
    const [rows] = await connection.query("SELECT * FROM tipo_veiculo");
    res.json(rows);
}
export const tipoVeiculo = async (req,res) =>{
    const connection = await connect();
    const [rows] = await connection.query('SELECT * FROM tipo_veiculo WHERE id_tipo_veiculo = ?',
    [
        req.params.id
    ]);
    console.log(rows[0]);
    res.json(rows[0]);
}
export const altatipoVeiculos = async (req,res) =>{
    const connection = await connect();
    const [results] = await connection.query("INSERT INTO tipo_veiculo (tipo,descripcion,importe) VALUES (?,?,?)",
    [
        req.body.tipo,
        req.body.descripcion,
        req.body.importe
    ]);
    res.json({
        id:results.insertId,
        ...req.body
    });
}
export const bajaTipoVeiculos = async (req,res) =>{
    const connection = await connect();
    await connection.query("UPDATE tipo_veiculo SET estatus = '0' WHERE tipo_veiculo.id_tipo_veiculo = ?",[
        req.params.id
    ]);
    res.sendStatus(204);
}
export const editarTipoVeiculos = async (req,res) =>{
    const connection = await connect();
    const results = await connection.query("UPDATE tipo_veiculo SET ? WHERE tipo_veiculo.id_tipo_veiculo = ?",[
        req.body,
        req.params.id
    ]);
    res.sendStatus(204)
}