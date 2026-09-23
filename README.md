# SemPrepDoc_Index

PostgreSQL indexing and Python retrieval flow for SemesterPrep.

## Objective

Build an efficient PostgreSQL-based document retrieval system where a student provides:

- University
- Branch
- Year
- Semester
- Subject
- Document Type

The system retrieves the matching SemesterPrep document and returns its Google Drive URL.

## Project Structure

- `sql/` - PostgreSQL schema, indexing and test queries
- `python/` - PostgreSQL connection and retrieval program
- `tests/` - Test cases
- `results/` - EXPLAIN ANALYZE results
- `docs/` - Project/database documentation