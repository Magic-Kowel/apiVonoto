import { connect } from "../database"
export const estancias = async (req,res) =>{
    const connection = await connect();
    const [rows] = await connection.query("SELECT * FROM estancia");
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
    const results = await connection.query("UPDATE estancia SET tiempo_fin = NOW() WHERE estancia.id_estancia = ?",[
        req.params.id
    ]);
    res.sendStatus(204)
}
export const bajaEstancia = async (req,res) =>{
  
}

 