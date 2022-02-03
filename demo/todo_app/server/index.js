require('dotenv').config();
const express = require('express')
const redis = require('redis')
const cors = require('cors')
const jwt = require('jsonwebtoken')
const app = express()
const client = redis.createClient({url:"redis://localhost:6379"})
const connect = async()=>{
    await client.connect()
}

connect()




app.use(cors())
app.use(express.json())

const verify = (req,res,next)=>{
    let token = req.headers.authorization ;
    console.log("TOKEN");
    
    jwt.verify(token,process.env.SECRET,(err,data)=>{
     
        if(err)
        {
            return res.sendStatus(403)
        }
        else{
          
            req.user = data.user
        }
        

    })
    next();
}

app.post('/',verify,async (req,res)=>{
    console.log(req.body)
    try
    {
        await client.lPush(req.user,req.body.todo)
        res.status(201).send("added Successfully")
    }
    catch(err){
        console.log(err)
    }
    
})

app.post('/register',async (req,res)=>{
    let exist = false;
    try{
        let data = await client.lRange("users",0,-1);
        if(data.length>0)
        {
            data.map((user)=>{
                console.log(JSON.parse(user))
                if(JSON.parse(user).email == req.body.email)
                { 
                    exist = true;
                }
            })
        }
       
        if(exist)
        {
            res.status(201).send("User already exist")
        }
        else{
            await client.lPush('users',JSON.stringify(req.body))
            res.status(201).send("User Added Successfully")
        }
        
    }
    catch(err)
    {
        console.log(err)
    }
})

app.post('/login',async (req,res)=>{
    try{
      let data = await client.lRange("users",0,-1);
      data.map((el)=>{
         let user = JSON.parse(el)
          if(user.email == req.body.email && user.password == req.body.password)
          {
             let token =  jwt.sign({user:user.email} , process.env.SECRET )
             console.log(token)
             res.status(201).send(token)
          }
          else{
              res.status(201).send("User Incorrect");
          }
      })
    }
    catch(err)
    {
        console.log(err)
    }
})

app.get('/user',async(req,res)=>{
    try{
        let data = await client.lRange("users",0,-1);
        res.send(data);
    }
    catch(err)
    {
        console.log(err)
    }
})



app.get('/',verify, async (req ,res)=>{
    console.log(req.user)
    try{
        const data = await client.lRange(req.user,0,-1);
        if(data)
        {
            res.send(data)
        }
        else{
            res.send("No Data Found")
        }
        
    }
    catch(err){
        console.log(err)
    }
    
    
})

app.delete('/',verify,async (req ,res)=>{
    try{
        await client.lRem(req.user,0,req.body.todo)
        res.status(201).send("Deleted Successfully")
    }
    catch(err){
        console.log(err)
    }
})



app.listen(8083,()=>{
    console.log("Listening to port 8083")
})
