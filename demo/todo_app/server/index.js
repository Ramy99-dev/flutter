const express = require('express')
const redis = require('redis')
const cors = require('cors')

const app = express()
const client = redis.createClient({url:"redis://redis:6379"})
const connect = async()=>{
    await client.connect()
}

connect()




app.use(cors())
app.use(express.json())


app.post('/', async (req,res)=>{
    try
    {
        await client.lPush('todo',req.body.todo)
        res.send("added Successfully")
    }
    catch(err){
        console.log(err)
    }
    
})



app.get('/', async (req ,res)=>{
    try{
        const data = await client.lRange('todo',0,-1);
        res.send(data)
    }
    catch(err){
        console.log(err)
    }
    
    
})

app.delete('/', async (req ,res)=>{
    try{
        await client.lRem('todo',0,req.body.todo)
        res.send("Deleted Successfully")
    }
    catch(err){
        console.log(err)
    }
})

app.listen(8083,()=>{
    console.log("Listening to port 8083")
})
