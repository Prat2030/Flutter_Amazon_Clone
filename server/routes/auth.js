const express = require("express");
const authRouter = express.Router();

authRouter.post('/api/signup', (req, res) => {
    // get the data from the client
    const {name,email,password} = req.body;
    // post the data to the database
    
    // send a response to the client
});

module.exports = authRouter;