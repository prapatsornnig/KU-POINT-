const express = require('express')
const router = express.Router()
const { validation, schema } = require('../validator/dbnews')
const db = require('../config/db') // เรียกใช้งานเชื่อมกับ MySQL
 
router.route('/dbnews?')
    .get((req, res, next) => { 
        // ทำการแสดงข้อมูลทั้งหมด
        let sql = ' SELECT * FROM postnews '
        db.query(sql,(error, results, fields)=>{
            // เกิด error ในคำสั่ง sql
            if(error) return res.status(500).json({
                "status": 500,
                "message": "Internal Server Error" // error.sqlMessage
            })
            // แสดงข้อมูลกร๊ไม่เกิด error
            const result = {
                "status": 200,
                "data": results
            }
            return res.json(result)        
        })
    })
    .post(validation(schema),(req, res, next) => {   
        // เตรียมฟิดล์และค่าของข้อมูลที่จะเพิ่ม
        let posts = {
            "title": req.body.title,
            "category": req.body.category,
            "detail": req.body.detail
        }
        let sql = ' INSERT INTO membert SET ? '
        db.query(sql, posts, (error, results, fields)=>{
            // เกิด error ในคำสั่ง sql
            if(error) return res.status(500).json({
                "status": 500,
                "message": "Internal Server Error" // error.sqlMessage
            })
            // เพื่อไม่ต้องไปดึงข้อมูลที่เพิ่งเพิม มาแสดง ให้เราใช้เฉพาะ id ข้อมูลใหม่ที่เพิ่งเพิม
            // รวมกับชุดข้อมูลที่เพิ่งเพิ่ม เป็น ข้อมูลที่ส่งกลับออกมา
            posts = [{'id':results.insertId, ...posts}]
            const result = {
                "status": 200,
                "data": posts
            }
            return res.json(result)        
        })
    })
 
router.route('/dbnews/:id')
    .all((req, res, next) => { 
        // ตรวจสอบว่า id user ที่ส่งเข้ามาเพื่อดูข้อมูล / แก้ไข / ลบ มีอยู่ในฐานข้อมูลหรือไม่
        let sql = ' SELECT * FROM postnews WHERE id = ? '
        db.query(sql, [req.params.id], (error, results, fields)=>{
            // เกิด error ในคำสั่ง sql
            if(error) return res.status(500).json({
                "status": 500,
                "message": "Internal Server Error" // error.sqlMessage
            })
            // กรณีไม่พบข้อมูล 
            if(results.length ===0) return res.status(400).json({
                "status": 400,
                "message": "Not found posts with the given ID"
            }) 
            res.posts = results // ถ้ามี id นั้นอยู่ในฐานข้อมูล ส่งข้อมูลผู้ใช้นั้นไปทำงานต่อ
            next()  
        })        
    })
    .get((req, res, next) => { 
        // ถ้าเป็นการแสดงข้อมูลของ ผู้ใช้ id ใด ก็นำค่าที่ถูกส่งมาไปแสดง
        const result = {
            "status": 200,
            "data": res.posts
        }
        return res.json(result)
    })
    .put(validation(schema),(req, res, next) => {   
        // ถ้าเป็นการแก้ไขข้อมูล ก็เตรียมรูปแบบข้อมูลที่รับมาสำหรับแก้ไข
        let posts = {
            "title": req.body.title,
            "category": req.body.category,
            "detail": req.body.detail
        }        
        // ทำการอัพเดท โดยอิง id ที่พบ
        let sql = ' UPDATE postnews SET ? WHERE id = ? '
        db.query(sql, [posts, req.params.id], (error, results, fields)=>{
            // เกิด error ในคำสั่ง sql
            if(error) return res.status(500).json({
                "status": 500,
                "message": "Internal Server Error" // error.sqlMessage
            })
            // ถ้ามีการแก้ไขค่าใหม่ 
            if(results.affectedRows > 0) {
                // เอาค่าฟิลด์ทีได้ทำการอัพเดท ไปอัพเดทกับข้อมูลทั้งหมด
                posts = Object.assign(res.posts[0], posts)
            }else{ // มีการอัพเดท แต่เป็นค่าเดิม
                posts = res.posts
            }
            // ส่งรายการข้อมูลที่อัพเทกลับไป
            const result = {
                "status": 200,
                "data": posts
            }
            return res.json(result)        
        })
    })
    .delete((req, res, next) => { 
        //router.get('/delete/(:id)', function(req, res, next) {
        // ถ้าเป็นการลบข้อมูล จาก id ใดๆ 
        let sql = ' DELETE FROM postnews WHERE id = ? '
        db.query(sql, [req.params.id],(error, results, fields)=>{
            if(error) return res.status(500).json({
                "status": 500,
                "message": "Internal Server Error" // error.sqlMessage
            })
            // ใช้ค่าข้อมูลถ้าค้นเจอ ก่อนลบ ส่งออกไป เป็นการบอกว่า รายการนี้คือรายการที่ถูกลบไปแล้ว
            const result = {
                "status": 200,
                "data": res.posts
            }
            return res.json(result)    
            //return res.redirect('newslist')  
        })
    })
 
module.exports = router