from retrieval import find_documents


def get_integer_input(prompt):
    while True:
        value = input(prompt).strip()

        try:
            return int(value)
        except ValueError:
            print("Please enter a valid number.")


print("====================================")
print("       SemesterPrep Document Finder")
print("====================================")

university = input("Enter University Code: ").strip().upper()
branch = input("Enter Branch Code: ").strip().upper()

year = get_integer_input("Enter Year: ")
semester = get_integer_input("Enter Semester: ")

subject = input("Enter Subject: ").strip()
document_type = input("Enter Document Type: ").strip().upper()


results = find_documents(
    university=university,
    branch=branch,
    year=year,
    semester=semester,
    subject=subject,
    document_type=document_type
)


print("\n====================================")
print("          Search Results")
print("====================================")


if not results:
    print("No matching document found.")

else:
    print(f"Found {len(results)} document(s):\n")

    for file_name, file_url in results:
        print(f"File Name : {file_name}")
        print(f"Drive URL : {file_url}")
        print("------------------------------------")