const express = require("express");
const bodyParser = require("body-parser");
const path = require("path");
const router = express.Router();
const mysql = require("mysql2");
const cookie = require("cookie-parser");
const md5 = require("md5");


const pool = mysql.createPool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: 3306,
});

router.use(cookie());

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

router.use((req, res, next) => {
  res.set("Cache-Control", "no-store");
  next();
});

function renderDorm(dorm) {
  return `
    <div class="row dorm dorms">
        <div class="col-3">
            <img src="/img/dorm.jpg" width="100" height="100%" style="border-radius: 20px; object-fit: cover;">
        </div>
        <div class="col-9" style="border-radius: 20px;">
            <div class="row m-lg-3">
                <div class="col-md-3 text-center name-dorm">
                    ${dorm.dormName}
                </div>
            </div>
            <div class="row m-lg-3">
                <div class="col-md-5 col-5 col-sm-5 col-3">
                    ระยะทาง : ${dorm.dormDistan} กิโลเมตร
                </div>
            </div>
            <div class="line-divide"></div>
            <div class="row m-lg-3">  
                <div class="col-md-10">
                    ราคา : ${dorm.rate_price} บาท/เดือน
                </div>
                <div class="col-md-2">
                    <button class="detail-dorm">เพิ่มเติม</button>
                </div>
            </div>
        </div>
    </div>
  `;
}

// เข้า path register.mustache
router.get("/register", (req, res) => {
  res.render("member/register");
});

// สร้าง path register สำหรับลงทะเบียนผู้ใช้ และนำข้อมูลไปเก็บในฐานข้อมูล
router.post("/register", (req, res) => {
  const userType = req.body.userType;
  const { firstname, lastname, email, username, password, confirmPassword } =
    req.body;

  // ตรวจสอบว่า password และ confirmPassword ตรงกัน
  if (password !== confirmPassword) {
    res.render("member/register", { msg: "รหัสผ่านไม่ตรงกันกรุณากรอกใหม่" });
    return;
  }

  // สร้าง SQL query
  const is_landlord = userType === "owner" ? 1 : 0;
  const sql = `INSERT INTO user (firstname, lastname, email, username, password, is_landlord) VALUES (?, ?, ?, ?, ?, ?)`;

  // ส่ง query ไปยัง MySQL server
  pool.query(
    sql,
    [firstname, lastname, email, username, md5(password), is_landlord],
    (err, result) => {
      if (err) {
        console.log("Error registering user", err);
        res.render("member/register", { msg: "Error registering user" });
      } else {
        res.redirect("/login");
      }
    }
  );
});

// เข้า path homepage.mustache
router.get("/homepage", (req, res) => {
  if (req.cookies.username) {
    res.redirect("/member");
  } else {
    const sql = `SELECT dormName, dormDistan, rate_price FROM dorm`;
    pool.query(sql, (err, result) => {
      if (err) {
        console.log(err);
        res.status(500).json({ msg: "Internal server error" });
      } else {
        // แปลงหน่วนจากเมตรเป็นกิโลเมตร
        const dorms = result.map((dorm) => ({
          ...dorm,
          dormDistan: dorm.dormDistan / 1000,
        }));
        // ส่งข้อมูลไปยังเทมเพลต
        const dormsHTML = dorms.map(renderDorm).join("");
        res.render("member/homepage", { dorms: dormsHTML });
      }
    });
  }
});

// เข้า path login.mustache
router.get("/login", (req, res) => {
  if (req.cookies.username) {
    res.redirect("/member");
  } else {
    res.render("member/login");
  }
});

// เรียกใชงาน cookie และสร้าง path login สำหรับเข้าสู่ระบบ และใช้ฐานข้อมูลในการเข้าสู่ระบบ
router.post("/login", (req, res) => {
  const { username, password } = req.body;
  const sqlUser = `SELECT * FROM user WHERE BINARY username = ? AND BINARY password = ?`;

  pool.query(sqlUser, [username, md5(password)], (err, result) => {
    if (err) {
      console.log(err);
      res.render("member/login", { msg: "Error logging in" });
    } else {
      if (result.length === 0) {
        res.render("member/login", { msg: "Invalid username or password" });
      } else {
        res.cookie("username", username, {
          maxAge: 900000,
          secure: true,
          httpOnly: true,
        });
        res.redirect("/member");
      }
    }
  });
});

// เข้า path member.mustache
router.get("/member", (req, res) => {
  if (!req.cookies.username) {
    res.redirect("/homepage");
    return;
  }

  const sql = `SELECT dormName, dormDistan, rate_price FROM dorm`;
  pool.query(sql, (err, result) => {
    if (err) {
      console.log(err);
      res.status(500).json({ msg: "Internal server error" });
    } else {
      // แปลงหน่วนจากเมตรเป็นกิโลเมตร
      const dorms = result.map((dorm) => ({
        ...dorm,
        dormDistan: dorm.dormDistan / 1000,
      }));
      // ส่งข้อมูลไปยังเทมเพลต
      const dormsHTML = dorms.map(renderDorm).join("");
      const username = req.cookies.username;
      const firstChar = username.charAt(0);
      res.render("member/member", { dorms: dormsHTML, username, firstChar });
    }
  });
});

//logout ออกจากระบบ
router.get("/logout", (req, res) => {
  const username = req.cookies.username;
  if (username) {
    res.clearCookie("username");
  }
  res.redirect("/homepage");
});

//ค้นหาหอพัก
router.get("/search", (req, res) => {
  const query = req.query.query;
  const sql = `SELECT dormName, dormDistan, rate_price FROM dorm WHERE dormName LIKE ?`;
  pool.query(sql, [`${query}%`], (err, result) => {
    if (err) {
      console.log(err);
      res.status(500).json({ msg: "Internal server error" });
    } else {
      const dorms = result.map((dorm) => ({
        ...dorm,
        dormDistan: dorm.dormDistan / 1000,
      }));
      const dormsHTML = dorms.map(renderDorm).join("");
      // ตรวจสอบว่าผู้ใช้ล็อกอินหรือไม่
      if (req.cookies.username) {
        // ถ้าล็อกอินแล้ว, ส่งผู้ใช้ไปยัง 'member/member'
        const username = req.cookies.username;
        const firstChar = username.charAt(0);
        res.render("member/member", {
          dorms: dormsHTML,
          query,
          username,
          firstChar,
        });
      } else {
        // ถ้ายังไม่ได้ล็อกอิน, ส่งผู้ใช้ไปยัง 'homepage'
        res.render("member/homepage", { dorms: dormsHTML, query });
      }
    }
  });
});

module.exports = router;
