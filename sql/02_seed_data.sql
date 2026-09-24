-- ==========================================
-- UNIVERSITIES
-- ==========================================

INSERT INTO universities (code, name)
VALUES
    ('JNTUA', 'Jawaharlal Nehru Technological University Anantapur'),
    ('JNTUH', 'Jawaharlal Nehru Technological University Hyderabad');


-- ==========================================
-- BRANCHES
-- ==========================================

INSERT INTO branches (code, name)
VALUES
    ('CIVIL', 'Civil Engineering'),
    ('CSE', 'Computer Science and Engineering'),
    ('ECE', 'Electronics and Communication Engineering');


-- ==========================================
-- SEMESTERS
-- ==========================================

INSERT INTO semesters (year, semester)
VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (2, 2);


-- ==========================================
-- SUBJECTS
-- ==========================================

INSERT INTO subjects (name)
VALUES
    ('Engineering Drawing'),
    ('Engineering Mathematics'),
    ('Engineering Physics'),
    ('Programming in C'),
    ('Data Structures');


-- ==========================================
-- DOCUMENTS
-- ==========================================

INSERT INTO documents
(
    drive_file_id,
    file_name,
    file_url,
    file_type,
    university_id,
    branch_id,
    semester_id,
    subject_id,
    document_type
)
VALUES

-- JNTUA / CIVIL / 1-1 / Engineering Drawing

(
    'drive_001',
    'PYQ 2021.pdf',
    'https://drive.google.com/file/d/drive_001',
    'pdf',
    (SELECT id FROM universities WHERE code = 'JNTUA'),
    (SELECT id FROM branches WHERE code = 'CIVIL'),
    (SELECT id FROM semesters WHERE year = 1 AND semester = 1),
    (SELECT id FROM subjects WHERE name = 'Engineering Drawing'),
    'PYQ'
),

(
    'drive_002',
    'PYQ 2022.pdf',
    'https://drive.google.com/file/d/drive_002',
    'pdf',
    (SELECT id FROM universities WHERE code = 'JNTUA'),
    (SELECT id FROM branches WHERE code = 'CIVIL'),
    (SELECT id FROM semesters WHERE year = 1 AND semester = 1),
    (SELECT id FROM subjects WHERE name = 'Engineering Drawing'),
    'PYQ'
),

(
    'drive_003',
    'Notes.docx',
    'https://drive.google.com/file/d/drive_003',
    'docx',
    (SELECT id FROM universities WHERE code = 'JNTUA'),
    (SELECT id FROM branches WHERE code = 'CIVIL'),
    (SELECT id FROM semesters WHERE year = 1 AND semester = 1),
    (SELECT id FROM subjects WHERE name = 'Engineering Drawing'),
    'Notes'
),


-- JNTUA / CIVIL / 1-1 / Engineering Mathematics

(
    'drive_004',
    'PYQ 2021.pdf',
    'https://drive.google.com/file/d/drive_004',
    'pdf',
    (SELECT id FROM universities WHERE code = 'JNTUA'),
    (SELECT id FROM branches WHERE code = 'CIVIL'),
    (SELECT id FROM semesters WHERE year = 1 AND semester = 1),
    (SELECT id FROM subjects WHERE name = 'Engineering Mathematics'),
    'PYQ'
),

(
    'drive_005',
    'Notes.docx',
    'https://drive.google.com/file/d/drive_005',
    'docx',
    (SELECT id FROM universities WHERE code = 'JNTUA'),
    (SELECT id FROM branches WHERE code = 'CIVIL'),
    (SELECT id FROM semesters WHERE year = 1 AND semester = 1),
    (SELECT id FROM subjects WHERE name = 'Engineering Mathematics'),
    'Notes'
),


-- JNTUA / CSE / 1-1

(
    'drive_006',
    'Programming in C PYQ 2022.pdf',
    'https://drive.google.com/file/d/drive_006',
    'pdf',
    (SELECT id FROM universities WHERE code = 'JNTUA'),
    (SELECT id FROM branches WHERE code = 'CSE'),
    (SELECT id FROM semesters WHERE year = 1 AND semester = 1),
    (SELECT id FROM subjects WHERE name = 'Programming in C'),
    'PYQ'
),

(
    'drive_007',
    'Programming in C Notes.docx',
    'https://drive.google.com/file/d/drive_007',
    'docx',
    (SELECT id FROM universities WHERE code = 'JNTUA'),
    (SELECT id FROM branches WHERE code = 'CSE'),
    (SELECT id FROM semesters WHERE year = 1 AND semester = 1),
    (SELECT id FROM subjects WHERE name = 'Programming in C'),
    'Notes'
);