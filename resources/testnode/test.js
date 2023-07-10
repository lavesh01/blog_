const fs          = require( "fs" );
const _ = require("lodash");
// Servers with and without SSL

const https       = require( "https" );
const httpsPort   = 3000;
const httpsServer = https.createServer({
key: fs.readFileSync("/www/server/panel/vhost/cert/testnode/privkey.pem"),
  cert: fs.readFileSync("/www/server/panel/vhost/cert/testnode/fullchain.pem"),
  requestCert: true,
  rejectUnauthorized: false
});

httpsServer.listen( httpsPort, function() {
    console.log(  `Listening HTTPS on ${httpsPort}` );
});

// Socket.io

const io = require('socket.io')(httpsServer, {
    path: "/pathToConnection"
});
let users = {};
io.on('connection', (socket) => {

  let userId = socket.handshake.query.userId; // GET USER ID
  
  var room = socket.handshake['query']['r_var'];
  socket.join(room);
  // CHECK IS USER EXHIST 
  if (!users[userId]) users[userId] = [];
  
  // PUSH SOCKET ID FOR PARTICULAR USER ID
  users[userId].push(socket.id);
   
  // USER IS ONLINE BROAD CAST TO ALL CONNECTED USERS
  io.sockets.emit("online", userId);
  console.log(userId, "Is Online!", socket.id);

  // DISCONNECT EVENT
  socket.on('disconnect', (reason) => {

    // REMOVE FROM SOCKET USERS
    _.remove(users[userId], (u) => u === socket.id);
    if (users[userId].length === 0) {
      // ISER IS OFFLINE BROAD CAST TO ALL CONNECTED USERS
      io.sockets.emit("offline", userId);
      // REMOVE OBJECT
      delete users[userId];
    }
   
    socket.disconnect(); // DISCONNECT SOCKET

    console.log(userId, "Is Offline!", socket.id);

  });
  
  socket.on("checkedTrue" , ()=>{
        socket.broadcast.emit("acknowledged")
    })

});