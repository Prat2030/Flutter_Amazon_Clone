console.log("Hello World!");

// Creating an api in Node.js
const express = require("express"); // similar to importing packages in python/flutter
const PORT = 3000; // creating a port variable
const app = express(); // initializing express and saving it in a variable


app.listen(3000, "0.0.0.0",()=>{
    // console.log("Server is running on port"+PORT); // old way of doing it
    console.log(`Server is running on port ${PORT}`); // new way of doing it
}); // listening to port 3000, if we do not specify the second argument, it will listen to localhost only