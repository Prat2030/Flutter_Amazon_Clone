const express = require("express");
const User = require("../models/user");
const authRouter = express.Router();
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");

// SignUp Route
authRouter.post('/api/signup', async (req, res) => {
    try{
        // get the data from the client
        const {name,email,password} = req.body;
        const existingUser = await User.findOne({email}); // here findOne is a promise
        if(existingUser){
            return res.status(400).json({message: "User already exists"});
        }

        const hashedPassword = await bcryptjs.hash(password,8);

        let user = new User({name,email,password: hashedPassword,});
        user = await user.save();
        res.status(201).json({message: "Account created successfully"});
        // post the data to the database
        // send a response to the client
    }catch(err){
        res.status(500).json({error: err.message});
    }
});

// SignIn Route
authRouter.post('/api/signin', async (req, res) => {
    try{
        const {email,password} = req.body;
        const user = await User.findOne({email});
        if(!user){
            return res.status(400).json({message: "User not found"});
        }
        const isMatch = await bcryptjs.compare(password,user.password);
        if(!isMatch){
            return res.status(400).json({message: "Invalid Credentials"});
        }
        const token = jwt.sign({id:user._id},"passwordKey");
        res.json({token,...user._doc}); // ... is object destructuring
    }catch(e){
        res.status(500).json({error: e.message});
    }
});

module.exports = authRouter;