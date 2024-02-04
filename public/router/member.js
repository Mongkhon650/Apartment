const express = require("express");
const bodyParser = require("body-parser");
const path = require("path");
const router = express.Router();
const mysql = require("mysql2");

const pool = mysql.createPool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: 3306,
});

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

router.get("/register", (req, res) => {
  res.render("member/register");
});

router.get("/homepage", (req, res) => {
  res.render("member/homepage");
});

router.get("/login", (req, res) => {
  res.render("member/login");
});

router.get("/member", (req, res) => {
  res.render("member/member");
});

router.post("/verify", (req, res) => {
  const { username, password } = req.body;
  const sql = `SELECT * FROM member WHERE username = ? AND password = ?`;

  pool.qurey(sql, [username, password], (err, result) => {
    if (err) {
      console.log(err);
      res.render("member/login");
    } else {
      if (result.length == 0) {
        res.render("member/login", { msg: "Invalid username or password" });
      } else {
        res.redirect("/member/member");
      }
    }
  });
});

module.exports = router;
