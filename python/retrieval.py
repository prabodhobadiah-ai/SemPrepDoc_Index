from db import get_connection


def find_documents(
    university,
    branch,
    year,
    semester,
    subject,
    document_type
):
    query = """
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
        WHERE u.code = %s
          AND b.code = %s
          AND s.year = %s
          AND s.semester = %s
          AND sub.name = %s
          AND d.document_type = %s;
    """

    with get_connection() as connection:
        with connection.cursor() as cursor:

            cursor.execute(
                query,
                (
                    university,
                    branch,
                    year,
                    semester,
                    subject,
                    document_type,
                )
            )

            results = cursor.fetchall()

    return results