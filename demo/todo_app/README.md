# todo_app

A Flutter todo Application consumming api's from NodeJS <br/>
for authentification i used JWT <br/>
and Redis as cache database .<br/>


To run locally :
<h3>REREQUISITE</h3>
- NodeJs installed
- Docker installed
- Flutter and Dart installed


Server : 
1. Run redis container :
```
Docker run -p 6379:6379 redis
```
2. Run NodeJs : 

```
npm start
```
Mobile : 

1. Install Flutter dependencies : 
```
pub get
```
2. Run Flutter Application 
