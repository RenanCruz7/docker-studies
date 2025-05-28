const mongoose = require('mongoose');

mongoose.connect("mongodb://db:27017/test", {useNewUrlParser: true})
    .then(() => {
        console.log("Connected to MongoDB");
    })
    .catch(err => {
        console.error("Error connecting to MongoDB", err);
    });