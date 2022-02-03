# todo_app

A Flutter todo Application consumming api's from NodeJS <br/>
for authentification i used JWT <br/>
and Redis as cache database .<br/>


To run locally :
<h3>REREQUISITE</h3>
- NodeJs installed <br/>
- Docker installed <br/>
- Flutter and Dart installed <br/>
<br/>

<strong>Server : </strong>
1. Run redis container :
```
Docker run -p 6379:6379 redis
```
2. Run NodeJs : 

```
npm start
```
<strong>Mobile : </strong>

1. Install Flutter dependencies : 
```
pub get
```
2. Run Flutter Application 
