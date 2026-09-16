# 🎓 College Admission System — SQL Database Project

A relational database project built in MySQL that models a college admission workflow — from student applications to admin approvals. Includes schema design, sample data, and 25+ queries demonstrating JOINs, subqueries, aggregate functions, and wildcard operators.

---

## 📁 Database Schema

The system is built around **5 core tables**:

| Table | Description |
|---|---|
| `Student` | Stores applicant details and the course they applied for |
| `Department` | Academic departments and their Heads of Department (HODs) |
| `Course` | Courses offered, linked to departments with eligibility criteria |
| `AdminStaff` | Staff accounts with role-based access (Admin, Clerk, Reviewer) |
| `Admission` | Tracks each student's admission record and its status |

### Entity Relationships

```
Department ──< Course ──< Student
                  │
              Admission
                  │
              AdminStaff
```

---

## 🗂️ Sample Data

- **10 Departments** — Computer Science, Engineering, Business, Mathematics, and more
- **10 Courses** — BSc, BBA, BE, and BA programs (all 4-year durations)
- **10 Students** — From cities across Pakistan with varying high school marks
- **10 Admin Staff** — Distributed across Admin, Clerk, and Reviewer roles
- **10 Admission Records** — Mix of Pending, Approved, and Rejected statuses

---

## 📋 Queries Covered

### 🔹 Basic SELECT Queries
- List students who applied for BSc Computer Science
- View all departments with their HODs
- Filter courses by duration
- Retrieve approved admissions
- List female students

### 🔗 JOIN Queries
- Student names with their applied course names
- Full admission records with student and course details
- Courses with their department names
- Students with the department of their applied course

### 🔁 Subqueries (Nested Queries)
- Students who applied to the Engineering department
- Students with a Pending admission status
- Courses under a specific HOD
- Students with above-average high school marks
- Students who haven't been approved yet

### 📊 Aggregate Functions
- Average high school marks across all students
- Student count per course (`GROUP BY`)
- Total number of approved admissions
- Department with the most courses
- Highest high school marks (`MAX`)

### 🔍 Wildcard Operators (`LIKE`)
- Names starting with `'A'`
- Emails ending with `'@example.com'`
- Courses containing `'Science'`
- Departments with `'e'` as the second letter
- Admin usernames containing `'admin'`

---

## 🚀 Getting Started

### Prerequisites
- MySQL 5.7+ or MariaDB

### Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/college-admission-system.git
   cd college-admission-system
   ```

2. Open your MySQL client and run the script:
   ```bash
   mysql -u root -p < college_admission_system.sql
   ```

3. Switch to the database and start querying:
   ```sql
   USE CollegeAdmissionSystem;
   ```

---

## 📌 Example Queries

**Students with above-average marks:**
```sql
SELECT Name
FROM Student
WHERE HighSchoolMarks > (SELECT AVG(HighSchoolMarks) FROM Student);
```

**Full admission summary (JOIN):**
```sql
SELECT a.AdmissionID, s.Name, c.CourseName, a.Status
FROM Admission a
JOIN Student s ON a.StudentID = s.StudentID
JOIN Course c ON a.CourseID = c.CourseID;
```

**Count students per course:**
```sql
SELECT AppliedCourseID, COUNT(*) AS StudentCount
FROM Student
GROUP BY AppliedCourseID;
```

---

## 🛠️ Tech Stack

- **Database:** MySQL
- **Language:** SQL (DDL + DML)
- **Concepts:** Normalization, Foreign Keys, JOINs, Subqueries, Aggregation, Pattern Matching

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
