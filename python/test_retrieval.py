from retrieval import find_documents


results = find_documents(
    university="JNTUA",
    branch="CIVIL",
    year=1,
    semester=1,
    subject="Engineering Drawing",
    document_type="PYQ"
)


print("Matching documents:")

for file_name, file_url in results:
    print(f"File: {file_name}")
    print(f"URL: {file_url}")
    print()