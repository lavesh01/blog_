const host = "//t4.xpertapp.link:3000";
// PASS your query parameters
const queryParams = { userId: 123 , r_var='room'};
const socket = io(host, {
    path: "/pathToConnection",
    transports: ['websocket'],  // https://stackoverflow.com/a/52180905/8987128
    upgrade: false,
    query: queryParams,
    reconnection: false,
    rejectUnauthorized: true,
    secure: true
});

document.getElementById("host").innerHTML = host;
document.getElementById("userId").innerHTML = queryParams.userId;

socket.once("connect", () => {
    
    document.getElementById("connection").innerHTML = "connected";

    // USER IS ONLINE
    socket.on("online", (userId) => {
        console.log(userId, "Is Online!"); // update online status
        document.getElementById("logs").innerHTML += "<div>" + userId + " Is Online! </div>";
    });

    // USER IS OFFLINE
    socket.on("offline", (userId) => {
        console.log(userId, "Is Offline!"); // update offline status
        document.getElementById("logs").innerHTML += "<div>" + userId + " Is Offline! </div>";
    });

    // ==== SUPPORTIVES 

    socket.on("connect_error", (err) => {
        document.getElementById("connection").innerHTML = "Connect Error - " + err.message;
        console.log(err.message);
    });
    socket.on("connect_timeout", () => {
        document.getElementById("connection").innerHTML = "Conection Time Out Please Try Again.";
    });
    socket.on("reconnect", (num) => {
        document.getElementById("connection").innerHTML = "Reconnected - " + num;
    });
    socket.on("reconnect_attempt", () => {
        document.getElementById("connection").innerHTML = "Reconnect Attempted.";
    });
    socket.on("reconnecting", (num) => {
        document.getElementById("connection").innerHTML = "Reconnecting - " + num;
    });
    socket.on("reconnect_error", (err) => {
        document.getElementById("connection").innerHTML = "Reconnect Error - " + err.message;
    });
    socket.on("reconnect_failed", () => {
        document.getElementById("connection").innerHTML = "Reconnect Failed";
    });
    socket.on("acknowledged" , ()=>{
        alert("Action acknowledged by the server");
    });

});


function changed()
{
   // Getting current state of checkbox.
   var a = document.getElementById('check').checked;
   if(a)
   {
         // Emiting the event.
      socket.emit("checkedTrue");  
    }
}