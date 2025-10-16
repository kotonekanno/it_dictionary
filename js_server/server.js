const express = require('express');
const mysql = require('mysql2/promise');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(bodyParser.json());

const SECRET_KEY = 'your_secret_key'; // JWTの秘密鍵
const PORT = 3000;

// MySQL接続設定
const dbConfig = {
  host: 'localhost',
  user: 'root',
  password: 'MyPass123!',
  database: 'dictionary_auth',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
};

app.get('/', (req, res) => {
  res.send('Hello World! Node.js + MySQL server is running.');
});

// ユーザー登録
app.post('/register', async (req, res) => {
  const { name, password } = req.body;
  try {
    const hashedPassword = await bcrypt.hash(password, 10);
    const connection = await mysql.createConnection(dbConfig);
    await connection.execute('INSERT INTO users (name, password) VALUES (?, ?)', [name, hashedPassword]);
    await connection.end();
    res.json({ success: true, message: 'User registered' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, message: 'Registration failed' });
  }
});

// ログイン
app.post('/login', async (req, res) => {
  const { name, password } = req.body;
  try {
    const connection = await mysql.createConnection(dbConfig);
    const [rows] = await connection.execute('SELECT * FROM users WHERE name = ?', [name]);
    await connection.end();

    if (rows.length === 0) return res.status(400).json({ success: false, message: 'User not found' });

    const user = rows[0];
    const match = await bcrypt.compare(password, user.password);
    if (!match) return res.status(401).json({ success: false, message: 'Invalid password' });

    const token = jwt.sign({ name: user.name }, SECRET_KEY, { expiresIn: '1d' }); // トークン1日有効
    res.json({ success: true, token });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, message: 'Login failed' });
  }
});

app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));
