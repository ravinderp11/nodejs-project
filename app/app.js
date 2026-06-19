const express=require("express")

const app=express()

app.get("/",(req,res)=>{

res.send("NodeJS deployed using Jenkins Docker Terraform ECS")

})

app.listen(3000)