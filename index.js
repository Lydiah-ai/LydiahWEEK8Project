const express = require('express');
const mysql = require('mysql2');
const app = express();
const port = 3000;

app.use(express.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '.L22579323o',
    database: 'Usertasks'
});

db.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL database');
});

// CRUD operations will be added here

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});

// GET POST
app.post('/tasks', (req, res) => {
    const { title, description, status } = req.body;
    const sql = 'INSERT INTO Tasks (Title, Description, Status) VALUES (?, ?, ?)';
    db.query(sql, [title, description, status], (err, result) => {
        if (err) throw err;
        res.send('Task created successfully');
    });
});

// READ GET
app.get('/tasks', (req, res) => {
    const sql = 'SELECT * FROM Tasks';
    db.query(sql, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// UPDATE TASK
app.put('/tasks/:id', (req, res) => {
    const { id } = req.params;
    const { title, description, user_id, category_id } = req.body;
    const sql = 'UPDATE tasks SET title = ?, description = ?, user_id = ?, category_id = ? WHERE id = ?';
    db.query(sql, [title, description, user_id, category_id, id], (err, result) => {
        if (err) throw err;
        res.send(`Task updated with ID: ${id}`);
    });
});

// DELETE TASK
app.delete('/tasks/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'DELETE FROM tasks WHERE id = ?';
    db.query(sql, [id], (err, result) => {
        if (err) throw err;
        res.send(`Task deleted with ID: ${id}`);
    });
});

