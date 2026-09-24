-- ==========================================
-- SemesterPrep Database Indexes
-- ==========================================

-- Index for university-based document lookup
CREATE INDEX idx_documents_university_id
ON documents (university_id);

-- Index for branch-based document lookup
CREATE INDEX idx_documents_branch_id
ON documents (branch_id);

-- Index for semester-based document lookup
CREATE INDEX idx_documents_semester_id
ON documents (semester_id);

-- Index for subject-based document lookup
CREATE INDEX idx_documents_subject_id
ON documents (subject_id);

-- Index for document type filtering
CREATE INDEX idx_documents_document_type
ON documents (document_type);


-- Composite index for the main document retrieval query
CREATE INDEX idx_documents_retrieval
ON documents (
    university_id,
    branch_id,
    semester_id,
    subject_id,
    document_type
);