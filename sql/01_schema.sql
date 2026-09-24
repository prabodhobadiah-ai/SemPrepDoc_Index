-- ============================================
-- SemesterPrep Database Schema
-- ============================================

-- 1. Universities
CREATE TABLE universities (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL
);


-- 2. Branches
CREATE TABLE branches (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL
);


-- 3. Semesters
CREATE TABLE semesters (
    id SERIAL PRIMARY KEY,
    year INTEGER NOT NULL,
    semester INTEGER NOT NULL,

    UNIQUE(year, semester)
);


-- 4. Subjects
CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);


-- 5. Documents
CREATE TABLE documents (
    id SERIAL PRIMARY KEY,
    drive_file_id VARCHAR(255) UNIQUE NOT NULL,
    file_name TEXT NOT NULL,
    file_url TEXT,
    file_type VARCHAR(20) NOT NULL,

    university_id INTEGER REFERENCES universities(id),
    branch_id INTEGER REFERENCES branches(id),
    semester_id INTEGER REFERENCES semesters(id),
    subject_id INTEGER REFERENCES subjects(id),

    document_type VARCHAR(50),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);