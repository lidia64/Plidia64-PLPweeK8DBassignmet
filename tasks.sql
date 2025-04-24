-- Create Tasks Table
CREATE TABLE Tasks (
    task_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    is_completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample Data Insertion
INSERT INTO Tasks (title, description, is_completed)
VALUES
('Complete Project', 'Finish the database project', false),
('Study for Exams', 'Review notes and practice problems', false);
