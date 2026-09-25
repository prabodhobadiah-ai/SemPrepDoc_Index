# SemesterPrep PostgreSQL Database Indexing
## Implementation Progress

---

## 1. Project Objective

The objective of this project is to build a PostgreSQL-based document
retrieval system for SemesterPrep.

The system should allow a student to enter:

1. University
2. Branch
3. Year
4. Semester
5. Subject
6. Document Type

The application will send these values to PostgreSQL, retrieve the
matching document, and return the corresponding Google Drive/file URL.

The main objective is to retrieve the correct SemesterPrep document
quickly using PostgreSQL indexing.

---

# 2. Database Structure

The database is named:

`semesterprep`

The main tables are:

- universities
- branches
- semesters
- subjects
- documents

The `documents` table stores the document information and references
the related university, branch, semester, and subject.

---

# 3. Database Tables

## 3.1 universities

Stores university information.

Main columns:

- id
- code
- name

Primary key:

`id`

Unique constraint:

`code`

---

## 3.2 branches

Stores branch information.

Main columns:

- id
- code
- name

Primary key:

`id`

Unique constraint:

`code`

---

## 3.3 semesters

Stores year and semester combinations.

Main columns:

- id
- year
- semester

Primary key:

`id`

Unique constraint:

`(year, semester)`

---

## 3.4 subjects

Stores subject information.

Main columns:

- id
- name

Primary key:

`id`

Unique constraint:

`name`

---

## 3.5 documents

Stores the actual document metadata.

Main columns:

- id
- drive_file_id
- file_name
- file_url
- file_type
- university_id
- branch_id
- semester_id
- subject_id
- document_type
- created_at

Primary key:

`id`

Unique constraint:

`drive_file_id`

The following columns reference other tables:

- university_id → universities.id
- branch_id → branches.id
- semester_id → semesters.id
- subject_id → subjects.id

---

# 4. Database Relationships

The relationship can be represented as:

```text
universities
      │
      │ university_id
      ▼
   documents
      ▲
      │ branch_id
   branches

   documents
      ▲
      │ semester_id
   semesters

   documents
      ▲
      │ subject_id
   subjects

```

## EXPLAIN ANALYZE Comparison

| Stage | Planning Time | Execution Time | Documents Scan | Composite Index Used |
|---|---:|---:|---|---|
| Before Indexing | 0.879 ms | 0.277 ms | Sequential Scan | No |
| After Individual Indexes | 11.926 ms | 0.249 ms | Sequential Scan | No |
| After Composite Index | 3.351 ms | 0.332 ms | Sequential Scan | No |

### Analysis

- Before indexing, PostgreSQL used a sequential scan on the `documents`
  table.
- After creating the individual indexes, PostgreSQL still used a
  sequential scan on the `documents` table.
- After creating the composite index, PostgreSQL also continued to use
  a sequential scan on the current small dataset.
- The lookup tables continued to use their existing indexes.
- The current dataset is too small to demonstrate the performance
  benefit of the composite index.
- A larger dataset is required for a meaningful indexing comparison.

