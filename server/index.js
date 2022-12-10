// Importing from packages
const express = require("express"); // similar to importing packages in python/flutter
const mongoose = require("mongoose"); // importing mongoose

// Importing from files
const authRouter = require("./routes/auth"); // importing auth.js from routes folder

// Initializing
const PORT = 3000; // creating a port variable
const app = express(); // initializing express and saving it in a variable
const DB = "mongodb+srv://pratyush:J8k4iUMDYY9icofZ@cluster0.dmvu6di.mongodb.net/?retryWrites=true&w=majority";

// Middleware
app.use(authRouter); // using the authRouter as middleware

// Connecting to database
mongoose.connect(DB).then(()=>{ 
    console.log("Connected to database");
})
.catch((err)=>{
    console.log(err)});

// CRUD -> Create, Read, Update, Delete -> POST, GET, PUT, DELETE

app.listen(3000,()=>{
    // console.log("Server is running on port"+PORT); // old way of doing it
    console.log(`Server is running on port ${PORT}`); // new way of doing it
}); // listening to port 3000, if we do not specify the second argument, it will listen to localhost only