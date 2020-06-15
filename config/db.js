const mysql = require('mysql') // เรียกใช้งาน MySQL module
 
// กำหนดการเชื่อมต่อฐานข้อมูล
const db = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'long',
  })
 
// ทำการเชื่อมต่อกับฐานข้อมูล 
db.connect((err) =>{
    if(err){ // กรณีเกิด error
        console.error('error connecting: ' + err.stack)
        return
    }
    console.log('connected as id ' + db.threadId)
})
// ปิดการเชื่อมต่อฐานข้อมูล MySQL ในที่นี้เราจะไม่ให้ทำงาน
// db.end() 

/*

let user = {
    "username": 'William Smith', 
    "email": 'will.smith@gmail.com',
    "password": 'asdfg'
}
let sql = ' INSERT INTO tbl_users SET ? '
db.query(sql, user, (error, results, fields)=>{
    console.log(error)
    if(error) {
        throw error
    }   
    console.log(results.insertId)
    console.log(results)
    console.log(fields)
    res.json(results)
})

*/

module.exports = db