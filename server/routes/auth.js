const express = require("express");
const User = require("../models/user");
const authRouter = express.Router();

authRouter.post('/api/signup', async (req, res) => {
    // get the data from the client
    const {name,email,password} = req.body;
    const existingUser = await User.findOne({email}); // here findOne is a promise
    if(existingUser){
        return res.status(400).json({message: "User already exists"});
    }
    let user = new User({name,email,password});
    user = await user.save();
    res.status(201).json({message: "Account created successfully"});
    // post the data to the database
    // send a response to the client
});

module.exports = authRouter;