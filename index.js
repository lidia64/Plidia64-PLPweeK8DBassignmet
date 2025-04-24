const express = require('express');
const mysql = require('mysql2');
const app = express();
const PORT = 3000;

// Setup MySQL connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',  // Use your MySQL username
    password: '',  // Use your MySQL password
    database: 'task_manager'
});

db.connect(err => {
    if (err) throw err;
    console.log("Connected to MySQL database");
});

// Middleware to parse JSON data
app.use(express.json());

// Create a new task
app.post('/tasks', (req, res) => {
    const { title, description, is_completed } = req.body;
    const query = 'INSERT INTO Tasks (title, description, is_completed) VALUES (?, ?, ?)';
    db.query(query, [title, description, is_completed], (err, results) => {
        if (err) throw err;
        res.status(201).json({ message: 'Task created', task_id: results.insertId });
    });
});

// Get all tasks
app.get('/tasks', (req, res) => {
    db.query('SELECT * FROM Tasks', (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Update a task
app.put('/tasks/:id', (req, res) => {
    const { id } = req.params;
    const { title, description, is_completed } = req.body;
    const query = 'UPDATE Tasks SET title = ?, description = ?, is_completed = ? WHERE task_id = ?';
    db.query(query, [title, description, is_completed, id], (err, results) => {
        if (err) throw err;
        res.json({ message: 'Task updated' });
    });
});

// Delete a task
app.delete('/tasks/:id', (req, res) => {
    const { id } = req.params;
    db.query('DELETE FROM Tasks WHERE task_id = ?', [id], (err, results) => {
        if (err) throw err;
        res.json({ message: 'Task deleted' });
    });
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
