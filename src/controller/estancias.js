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

}
export const bajaEstancia = async (req,res) =>{
  
}
export const editarEstancia = async (req,res) =>{
  
}