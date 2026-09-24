# EXPLAIN ANALYZE Results

## Before Indexing

Query:

```
EXPLAIN ANALYZE
SELECT
    d.file_name,
    d.file_url
FROM documents d

JOIN universities u
    ON d.university_id = u.id

JOIN branches b
    ON d.branch_id = b.id

JOIN semesters s
    ON d.semester_id = s.id

JOIN subjects sub
    ON d.subject_id = sub.id

WHERE u.code = 'JNTUA'
  AND b.code = 'CIVIL'
  AND s.year = 1
  AND s.semester = 1
  AND sub.name = 'Engineering Drawing'
  AND d.document_type = 'PYQ'; ```
  
EXPLAIN ANALYZE
SELECT
    d.file_name,
    d.file_url
FROM documents d

JOIN universities u
    ON d.university_id = u.id

JOIN branches b
    ON d.branch_id = b.id

JOIN semesters s
    ON d.semester_id = s.id

JOIN subjects sub
    ON d.subject_id = sub.id

WHERE u.code = 'JNTUA'
  AND b.code = 'CIVIL'
  AND s.year = 1
  AND s.semester = 1
  AND sub.name = 'Engineering Drawing'
  AND d.document_type = 'PYQ';  
  
  ```


# Output
```
    "Nested Loop  (cost=0.58..43.96 rows=1 width=64) (actual time=0.136..0.177 rows=2.00 loops=1)"
"  Join Filter: (sub.id = d.subject_id)"
"  Rows Removed by Join Filter: 1"
"  Buffers: shared hit=29"
"  ->  Nested Loop  (cost=0.44..35.78 rows=1 width=68) (actual time=0.123..0.155 rows=3.00 loops=1)"
"        Join Filter: (s.id = d.semester_id)"
"        Buffers: shared hit=23"
"        ->  Nested Loop  (cost=0.29..27.59 rows=1 width=72) (actual time=0.107..0.133 rows=3.00 loops=1)"
"              Join Filter: (b.id = d.branch_id)"
"              Rows Removed by Join Filter: 1"
"              Buffers: shared hit=17"
"              ->  Nested Loop  (cost=0.14..19.42 rows=1 width=76) (actual time=0.092..0.108 rows=4.00 loops=1)"
"                    Join Filter: (u.id = d.university_id)"
"                    Buffers: shared hit=9"
"                    ->  Seq Scan on documents d  (cost=0.00..11.25 rows=1 width=80) (actual time=0.037..0.041 rows=4.00 loops=1)"
"                          Filter: ((document_type)::text = 'PYQ'::text)"
"                          Rows Removed by Filter: 3"
"                          Buffers: shared hit=1"
"                    ->  Index Scan using universities_code_key on universities u  (cost=0.14..8.16 rows=1 width=4) (actual time=0.014..0.014 rows=1.00 loops=4)"
"                          Index Cond: ((code)::text = 'JNTUA'::text)"
"                          Index Searches: 4"
"                          Buffers: shared hit=8"
"              ->  Index Scan using branches_code_key on branches b  (cost=0.14..8.16 rows=1 width=4) (actual time=0.005..0.005 rows=1.00 loops=4)"
"                    Index Cond: ((code)::text = 'CIVIL'::text)"
"                    Index Searches: 4"
"                    Buffers: shared hit=8"
"        ->  Index Scan using semesters_year_semester_key on semesters s  (cost=0.15..8.17 rows=1 width=4) (actual time=0.006..0.006 rows=1.00 loops=3)"
"              Index Cond: ((year = 1) AND (semester = 1))"
"              Index Searches: 3"
"              Buffers: shared hit=6"
"  ->  Index Scan using subjects_name_key on subjects sub  (cost=0.14..8.16 rows=1 width=4) (actual time=0.006..0.006 rows=1.00 loops=3)"
"        Index Cond: ((name)::text = 'Engineering Drawing'::text)"
"        Index Searches: 3"
"        Buffers: shared hit=6"
"Planning Time: 0.879 ms"
"Execution Time: 0.277 ms"
```
## After Indexing

# Query

```
EXPLAIN ANALYZE
SELECT
    d.file_name,
    d.file_url
FROM documents d
JOIN universities u
    ON d.university_id = u.id
JOIN branches b
    ON d.branch_id = b.id
JOIN semesters s
    ON d.semester_id = s.id
JOIN subjects sub
    ON d.subject_id = sub.id
WHERE u.code = 'JNTUA'
  AND b.code = 'CIVIL'
  AND s.year = 1
  AND s.semester = 1
  AND sub.name = 'Engineering Drawing'
  AND d.document_type = 'PYQ';

  ```
# Output
```
"Nested Loop  (cost=0.58..33.79 rows=1 width=64) (actual time=0.127..0.170 rows=2.00 loops=1)"
"  Join Filter: (d.subject_id = sub.id)"
"  Rows Removed by Join Filter: 1"
"  Buffers: shared hit=29"
"  ->  Nested Loop  (cost=0.44..25.62 rows=1 width=68) (actual time=0.111..0.145 rows=3.00 loops=1)"
"        Join Filter: (d.semester_id = s.id)"
"        Buffers: shared hit=23"
"        ->  Nested Loop  (cost=0.29..17.43 rows=1 width=72) (actual time=0.097..0.124 rows=3.00 loops=1)"
"              Join Filter: (d.branch_id = b.id)"
"              Rows Removed by Join Filter: 1"
"              Buffers: shared hit=17"
"              ->  Nested Loop  (cost=0.14..9.26 rows=1 width=76) (actual time=0.083..0.099 rows=4.00 loops=1)"
"                    Join Filter: (d.university_id = u.id)"
"                    Buffers: shared hit=9"
"                    ->  Seq Scan on documents d  (cost=0.00..1.09 rows=1 width=80) (actual time=0.034..0.039 rows=4.00 loops=1)"
"                          Filter: ((document_type)::text = 'PYQ'::text)"
"                          Rows Removed by Filter: 3"
"                          Buffers: shared hit=1"
"                    ->  Index Scan using universities_code_key on universities u  (cost=0.14..8.16 rows=1 width=4) (actual time=0.013..0.013 rows=1.00 loops=4)"
"                          Index Cond: ((code)::text = 'JNTUA'::text)"
"                          Index Searches: 4"
"                          Buffers: shared hit=8"
"              ->  Index Scan using branches_code_key on branches b  (cost=0.14..8.16 rows=1 width=4) (actual time=0.005..0.005 rows=1.00 loops=4)"
"                    Index Cond: ((code)::text = 'CIVIL'::text)"
"                    Index Searches: 4"
"                    Buffers: shared hit=8"
"        ->  Index Scan using semesters_year_semester_key on semesters s  (cost=0.15..8.17 rows=1 width=4) (actual time=0.006..0.006 rows=1.00 loops=3)"
"              Index Cond: ((year = 1) AND (semester = 1))"
"              Index Searches: 3"
"              Buffers: shared hit=6"
"  ->  Index Scan using subjects_name_key on subjects sub  (cost=0.14..8.16 rows=1 width=4) (actual time=0.007..0.007 rows=1.00 loops=3)"
"        Index Cond: ((name)::text = 'Engineering Drawing'::text)"
"        Index Searches: 3"
"        Buffers: shared hit=6"
"Planning:"
"  Buffers: shared hit=37 read=5"
"Planning Time: 11.926 ms"
"Execution Time: 0.249 ms"

```

## Afer Composite Indexing
# Query
```
EXPLAIN ANALYZE
SELECT
    d.file_name,
    d.file_url
FROM documents d
JOIN universities u
    ON d.university_id = u.id
JOIN branches b
    ON d.branch_id = b.id
JOIN semesters s
    ON d.semester_id = s.id
JOIN subjects sub
    ON d.subject_id = sub.id
WHERE u.code = 'JNTUA'
  AND b.code = 'CIVIL'
  AND s.year = 1
  AND s.semester = 1
  AND sub.name = 'Engineering Drawing'
  AND d.document_type = 'PYQ';

  ```

  # Output

  ```
  "Nested Loop  (cost=0.58..33.79 rows=1 width=64) (actual time=0.195..0.231 rows=2.00 loops=1)"
"  Join Filter: (d.subject_id = sub.id)"
"  Rows Removed by Join Filter: 1"
"  Buffers: shared hit=29"
"  ->  Nested Loop  (cost=0.44..25.62 rows=1 width=68) (actual time=0.176..0.204 rows=3.00 loops=1)"
"        Join Filter: (d.semester_id = s.id)"
"        Buffers: shared hit=23"
"        ->  Nested Loop  (cost=0.29..17.43 rows=1 width=72) (actual time=0.152..0.175 rows=3.00 loops=1)"
"              Join Filter: (d.branch_id = b.id)"
"              Rows Removed by Join Filter: 1"
"              Buffers: shared hit=17"
"              ->  Nested Loop  (cost=0.14..9.26 rows=1 width=76) (actual time=0.137..0.151 rows=4.00 loops=1)"
"                    Join Filter: (d.university_id = u.id)"
"                    Buffers: shared hit=9"
"                    ->  Seq Scan on documents d  (cost=0.00..1.09 rows=1 width=80) (actual time=0.087..0.091 rows=4.00 loops=1)"
"                          Filter: ((document_type)::text = 'PYQ'::text)"
"                          Rows Removed by Filter: 3"
"                          Buffers: shared hit=1"
"                    ->  Index Scan using universities_code_key on universities u  (cost=0.14..8.16 rows=1 width=4) (actual time=0.013..0.013 rows=1.00 loops=4)"
"                          Index Cond: ((code)::text = 'JNTUA'::text)"
"                          Index Searches: 4"
"                          Buffers: shared hit=8"
"              ->  Index Scan using branches_code_key on branches b  (cost=0.14..8.16 rows=1 width=4) (actual time=0.005..0.005 rows=1.00 loops=4)"
"                    Index Cond: ((code)::text = 'CIVIL'::text)"
"                    Index Searches: 4"
"                    Buffers: shared hit=8"
"        ->  Index Scan using semesters_year_semester_key on semesters s  (cost=0.15..8.17 rows=1 width=4) (actual time=0.009..0.009 rows=1.00 loops=3)"
"              Index Cond: ((year = 1) AND (semester = 1))"
"              Index Searches: 3"
"              Buffers: shared hit=6"
"  ->  Index Scan using subjects_name_key on subjects sub  (cost=0.14..8.16 rows=1 width=4) (actual time=0.007..0.008 rows=1.00 loops=3)"
"        Index Cond: ((name)::text = 'Engineering Drawing'::text)"
"        Index Searches: 3"
"        Buffers: shared hit=6"
"Planning:"
"  Buffers: shared hit=13 read=1"
"Planning Time: 3.351 ms"
"Execution Time: 0.332 ms"

```
## Conclusion
```
The retrieval query returned the expected results for all three test cases.

The lookup tables used their existing indexes for university, branch,
semester, and subject filtering. The documents table continued to use
a sequential scan in these tests.

The composite index on the documents table was not selected by the
PostgreSQL query planner for the current sample dataset. Since the
sample dataset is very small, the results are not sufficient to
demonstrate the performance benefit of the composite index.

Further testing with a larger dataset closer to the SemesterPrep
dataset size is required to evaluate the indexing strategy under
realistic data volume.

```


## Test Cases
# Test1 - Input
```
EXPLAIN ANALYZE
SELECT
    d.file_name,
    d.file_url
FROM documents d
JOIN universities u ON d.university_id = u.id
JOIN branches b ON d.branch_id = b.id
JOIN semesters s ON d.semester_id = s.id
JOIN subjects sub ON d.subject_id = sub.id
WHERE u.code = 'JNTUA'
  AND b.code = 'CIVIL'
  AND s.year = 1
  AND s.semester = 1
  AND sub.name = 'Engineering Drawing'
  AND d.document_type = 'PYQ';

```
# Test Case 1 - Output
```
"Nested Loop (cost=0.58..33.79 rows=1 width=64) (actual time=0.173..0.212 rows=2.00 loops=1)" " Join Filter: (d.subject_id = sub.id)" " Rows Removed by Join Filter: 1" " Buffers: shared hit=29" " -> Nested Loop (cost=0.44..25.62 rows=1 width=68) (actual time=0.162..0.192 rows=3.00 loops=1)" " Join Filter: (d.semester_id = s.id)" " Buffers: shared hit=23" " -> Nested Loop (cost=0.29..17.43 rows=1 width=72) (actual time=0.149..0.172 rows=3.00 loops=1)" " Join Filter: (d.branch_id = b.id)" " Rows Removed by Join Filter: 1" " Buffers: shared hit=17" " -> Nested Loop (cost=0.14..9.26 rows=1 width=76) (actual time=0.136..0.150 rows=4.00 loops=1)" " Join Filter: (d.university_id = u.id)" " Buffers: shared hit=9" " -> Seq Scan on documents d (cost=0.00..1.09 rows=1 width=80) (actual time=0.064..0.068 rows=4.00 loops=1)" " Filter: ((document_type)::text = 'PYQ'::text)" " Rows Removed by Filter: 3" " Buffers: shared hit=1" " -> Index Scan using universities_code_key on universities u (cost=0.14..8.16 rows=1 width=4) (actual time=0.018..0.018 rows=1.00 loops=4)" " Index Cond: ((code)::text = 'JNTUA'::text)" " Index Searches: 4" " Buffers: shared hit=8" " -> Index Scan using branches_code_key on branches b (cost=0.14..8.16 rows=1 width=4) (actual time=0.004..0.005 rows=1.00 loops=4)" " Index Cond: ((code)::text = 'CIVIL'::text)" " Index Searches: 4" " Buffers: shared hit=8" " -> Index Scan using semesters_year_semester_key on semesters s (cost=0.15..8.17 rows=1 width=4) (actual time=0.005..0.005 rows=1.00 loops=3)" " Index Cond: ((year = 1) AND (semester = 1))" " Index Searches: 3" " Buffers: shared hit=6" " -> Index Scan using subjects_name_key on subjects sub (cost=0.14..8.16 rows=1 width=4) (actual time=0.005..0.006 rows=1.00 loops=3)" " Index Cond: ((name)::text = 'Engineering Drawing'::text)" " Index Searches: 3" " Buffers: shared hit=6" "Planning Time: 1.856 ms" "Execution Time: 0.538 ms"'


```

# Test Case 2 - Input
```
EXPLAIN ANALYZE
SELECT
    d.file_name,
    d.file_url
FROM documents d
JOIN universities u
    ON d.university_id = u.id
JOIN branches b
    ON d.branch_id = b.id
JOIN semesters s
    ON d.semester_id = s.id
JOIN subjects sub
    ON d.subject_id = sub.id
WHERE u.code = 'JNTUA'
  AND b.code = 'CSE'
  AND s.year = 1
  AND s.semester = 1
  AND sub.name = 'Programming in C'
  AND d.document_type = 'Notes';
```

# Test Case 2 - Output
```
"Nested Loop  (cost=0.58..33.79 rows=1 width=64) (actual time=0.274..0.279 rows=1.00 loops=1)"
"  Join Filter: (d.subject_id = sub.id)"
"  Buffers: shared hit=17"
"  ->  Nested Loop  (cost=0.44..25.62 rows=1 width=68) (actual time=0.253..0.258 rows=1.00 loops=1)"
"        Join Filter: (d.semester_id = s.id)"
"        Buffers: shared hit=15"
"        ->  Nested Loop  (cost=0.29..17.43 rows=1 width=72) (actual time=0.232..0.236 rows=1.00 loops=1)"
"              Join Filter: (d.branch_id = b.id)"
"              Rows Removed by Join Filter: 2"
"              Buffers: shared hit=13"
"              ->  Nested Loop  (cost=0.14..9.26 rows=1 width=76) (actual time=0.179..0.197 rows=3.00 loops=1)"
"                    Join Filter: (d.university_id = u.id)"
"                    Buffers: shared hit=7"
"                    ->  Seq Scan on documents d  (cost=0.00..1.09 rows=1 width=80) (actual time=0.081..0.085 rows=3.00 loops=1)"
"                          Filter: ((document_type)::text = 'Notes'::text)"
"                          Rows Removed by Filter: 4"
"                          Buffers: shared hit=1"
"                    ->  Index Scan using universities_code_key on universities u  (cost=0.14..8.16 rows=1 width=4) (actual time=0.032..0.032 rows=1.00 loops=3)"
"                          Index Cond: ((code)::text = 'JNTUA'::text)"
"                          Index Searches: 3"
"                          Buffers: shared hit=6"
"              ->  Index Scan using branches_code_key on branches b  (cost=0.14..8.16 rows=1 width=4) (actual time=0.011..0.011 rows=1.00 loops=3)"
"                    Index Cond: ((code)::text = 'CSE'::text)"
"                    Index Searches: 3"
"                    Buffers: shared hit=6"
"        ->  Index Scan using semesters_year_semester_key on semesters s  (cost=0.15..8.17 rows=1 width=4) (actual time=0.019..0.020 rows=1.00 loops=1)"
"              Index Cond: ((year = 1) AND (semester = 1))"
"              Index Searches: 1"
"              Buffers: shared hit=2"
"  ->  Index Scan using subjects_name_key on subjects sub  (cost=0.14..8.16 rows=1 width=4) (actual time=0.018..0.018 rows=1.00 loops=1)"
"        Index Cond: ((name)::text = 'Programming in C'::text)"
"        Index Searches: 1"
"        Buffers: shared hit=2"
"Planning Time: 2.223 ms"
"Execution Time: 0.407 ms"



```



# Test Case 3 - Input
```
EXPLAIN ANALYZE
SELECT
    d.file_name,
    d.file_url
FROM documents d
JOIN universities u
    ON d.university_id = u.id
JOIN branches b
    ON d.branch_id = b.id
JOIN semesters s
    ON d.semester_id = s.id
JOIN subjects sub
    ON d.subject_id = sub.id
WHERE u.code = 'JNTUA'
  AND b.code = 'CIVIL'
  AND s.year = 2
  AND s.semester = 1
  AND sub.name = 'Engineering Drawing'
  AND d.document_type = 'PYQ';
  ```

# Test Case 3 - Output
```
"Nested Loop  (cost=0.58..33.79 rows=1 width=64) (actual time=0.282..0.284 rows=0.00 loops=1)"
"  Join Filter: (d.subject_id = sub.id)"
"  Buffers: shared hit=23"
"  ->  Nested Loop  (cost=0.44..25.62 rows=1 width=68) (actual time=0.281..0.282 rows=0.00 loops=1)"
"        Join Filter: (d.semester_id = s.id)"
"        Rows Removed by Join Filter: 3"
"        Buffers: shared hit=23"
"        ->  Nested Loop  (cost=0.29..17.43 rows=1 width=72) (actual time=0.229..0.255 rows=3.00 loops=1)"
"              Join Filter: (d.branch_id = b.id)"
"              Rows Removed by Join Filter: 1"
"              Buffers: shared hit=17"
"              ->  Nested Loop  (cost=0.14..9.26 rows=1 width=76) (actual time=0.185..0.201 rows=4.00 loops=1)"
"                    Join Filter: (d.university_id = u.id)"
"                    Buffers: shared hit=9"
"                    ->  Seq Scan on documents d  (cost=0.00..1.09 rows=1 width=80) (actual time=0.081..0.085 rows=4.00 loops=1)"
"                          Filter: ((document_type)::text = 'PYQ'::text)"
"                          Rows Removed by Filter: 3"
"                          Buffers: shared hit=1"
"                    ->  Index Scan using universities_code_key on universities u  (cost=0.14..8.16 rows=1 width=4) (actual time=0.026..0.026 rows=1.00 loops=4)"
"                          Index Cond: ((code)::text = 'JNTUA'::text)"
"                          Index Searches: 4"
"                          Buffers: shared hit=8"
"              ->  Index Scan using branches_code_key on branches b  (cost=0.14..8.16 rows=1 width=4) (actual time=0.012..0.012 rows=1.00 loops=4)"
"                    Index Cond: ((code)::text = 'CIVIL'::text)"
"                    Index Searches: 4"
"                    Buffers: shared hit=8"
"        ->  Index Scan using semesters_year_semester_key on semesters s  (cost=0.15..8.17 rows=1 width=4) (actual time=0.008..0.008 rows=1.00 loops=3)"
"              Index Cond: ((year = 2) AND (semester = 1))"
"              Index Searches: 3"
"              Buffers: shared hit=6"
"  ->  Index Scan using subjects_name_key on subjects sub  (cost=0.14..8.16 rows=1 width=4) (never executed)"
"        Index Cond: ((name)::text = 'Engineering Drawing'::text)"
"        Index Searches: 0"
"Planning Time: 1.728 ms"
"Execution Time: 0.408 ms"

```