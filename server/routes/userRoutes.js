const express = require('express')
const router = express.Router()
const userController = require('../controllers/userController')
const auth = require("../middleware/auth");
const { body } = require("express-validator");

// Get user from database
router.post(
    "/register",
    body("email").isEmail(),
    body("password").isLength({ min: 5, max: 25 }),
    userController.register
);
router.post("/login", userController.login);
router.get("/auth", auth, userController.authenticate);

module.exports = router