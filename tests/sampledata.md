# SemesterPrep PostgreSQL — Sample Data

This file contains the sample data currently used in the SemesterPrep
PostgreSQL database for testing the document retrieval flow.

---

## 1. Universities

| ID | Code | Name |
|---:|---|---|
| 1 | JNTUA | JNTU Anantapur |
| 2 | JNTUH | JNTU Hyderabad |

---

## 2. Branches

| ID | Code | Name |
|---:|---|---|
| 1 | CIVIL | Civil Engineering |
| 2 | CSE | Computer Science Engineering |
| 3 | ECE | Electronics and Communication Engineering |

---

## 3. Semesters

| ID | Year | Semester |
|---:|---:|---:|
| 1 | 1 | 1 |
| 2 | 1 | 2 |
| 3 | 2 | 1 |
| 4 | 2 | 2 |

---

## 4. Subjects

| ID | Subject Name |
|---:|---|
| 1 | Engineering Drawing |
| 2 | Engineering Mathematics |
| 3 | Engineering Physics |
| 4 | Programming in C |
| 5 | Data Structures |

---

## 5. Documents

The `documents` table contains the academic documents and connects
each document with its university, branch, semester, and subject.

| ID | File Name | University | Branch | Year | Semester | Subject | Document Type |
|---:|---|---|---|---:|---:|---|---|
| 1 | PYQ 2021.pdf | JNTUA | CIVIL | 1 | 1 | Engineering Drawing | PYQ |
| 2 | PYQ 2022.pdf | JNTUA | CIVIL | 1 | 1 | Engineering Drawing | PYQ |
| 3 | Notes.docx | JNTUA | CIVIL | 1 | 1 | Engineering Drawing | Notes |
| 4 | PYQ 2021.pdf | JNTUA | CIVIL | 1 | 1 | Engineering Mathematics | PYQ |
| 5 | Notes.docx | JNTUA | CIVIL | 1 | 1 | Engineering Mathematics | Notes |
| 6 | PYQ.pdf | JNTUA | CSE | 1 | 1 | Programming in C | PYQ |
| 7 | Notes.docx | JNTUA | CSE | 1 | 1 | Programming in C | Notes |

---

## 6. Sample File URLs

The current database uses sample Google Drive URLs for testing.

| Document ID | File Name | Sample File URL |
|---:|---|---|
| 1 | PYQ 2021.pdf | `https://drive.google.com/file/d/drive_001` |
| 2 | PYQ 2022.pdf | `https://drive.google.com/file/d/drive_002` |
| 3 | Notes.docx | `https://drive.google.com/file/d/drive_003` |
| 4 | PYQ 2021.pdf | `https://drive.google.com/file/d/drive_004` |
| 5 | Notes.docx | `https://drive.google.com/file/d/drive_005` |
| 6 | PYQ.pdf | `https://drive.google.com/file/d/drive_006` |
| 7 | Notes.docx | `https://drive.google.com/file/d/drive_007` |

> **Note:** These are sample/test URLs. They will be replaced with the
> actual Google Drive file URLs when the real SemesterPrep dataset is
> connected.

---

## 7. Sample Academic Structure

The sample data represents the following structure:

```text
JNTUA
│
├── CIVIL
│   │
│   └── Year 1
│       │
│       └── Semester 1
│           │
│           ├── Engineering Drawing
│           │   ├── PYQ 2021.pdf
│           │   ├── PYQ 2022.pdf
│           │   └── Notes.docx
│           │
│           └── Engineering Mathematics
│               ├── PYQ 2021.pdf
│               └── Notes.docx
│
└── CSE
    │
    └── Year 1
        │
        └── Semester 1
            │
            └── Programming in C
                ├── PYQ.pdf
                └── Notes.docx