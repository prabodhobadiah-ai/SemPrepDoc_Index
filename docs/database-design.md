# SemesterPrep Database Design

## 1. Overview

SemesterPrep uses PostgreSQL to store and retrieve academic document
information.

The database is designed to organize academic documents using:

- University
- Branch
- Year
- Semester
- Subject
- Document Type

The current SemesterPrep reference structure contains approximately
70,000 files.

The main purpose of the database is to allow the application to find
the correct academic document based on the student's selected inputs.

---

# 2. Academic Data Structure

The academic document structure is:

```text
SemesterPrep
│
└── University
    │
    └── Branch
        │
        └── Year
            │
            └── Semester
                │
                └── Subject
                    │
                    └── Document


```
# Database Schema

┌──────────────────────┐
│     universities     │
├──────────────────────┤
│ PK id                │
│    code              │
│    name              │
└──────────┬───────────┘
           │
           │ university_id
           │
           ▼
┌─────────────────────────────────────────────┐
│                  documents                  │
├─────────────────────────────────────────────┤
│ PK id                                       │
│ UK drive_file_id                            │
│    file_name                                │
│    file_url                                 │
│    file_type                                │
│ FK university_id                            │
│ FK branch_id                                │
│ FK semester_id                              │
│ FK subject_id                               │
│    document_type                            │
│    created_at                               │
└─────────────────────────────────────────────┘
           ▲             ▲             ▲
           │             │             │
           │             │             │
      branch_id     semester_id    subject_id
           │             │             │
           │             │             │
           ▼             ▼             ▼
      branches       semesters      subjects


# Relationship Summary

documents.university_id → universities.id

documents.branch_id → branches.id

documents.semester_id → semesters.id

documents.subject_id → subjects.id


# Database Structure

semesterprep
│
├── universities
│   ├── id
│   ├── code
│   └── name
│
├── branches
│   ├── id
│   ├── code
│   └── name
│
├── semesters
│   ├── id
│   ├── year
│   └── semester
│
├── subjects
│   ├── id
│   └── name
│
└── documents
    ├── id
    ├── drive_file_id
    ├── file_name
    ├── file_url
    ├── file_type
    ├── university_id
    ├── branch_id
    ├── semester_id
    ├── subject_id
    ├── document_type
    └── created_at


# Count

Database
│
├── 5 Tables
│
├── 22 Total Columns
│
├── 5 Primary Keys
│
├── 5 Unique Constraints
│
└── 4 Foreign-Key Relationships