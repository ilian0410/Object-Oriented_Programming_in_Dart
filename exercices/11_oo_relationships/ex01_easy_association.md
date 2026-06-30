# OO Relationships — Easy

## Instructions

Model an **association** relationship between two classes.

### Classes to create

1. **`Professor`**
   - Fields: `name` (String), `department` (String)
   - Method: `teaches()` that prints `"Professor name teaches in the department department"`

2. **`Student`**
   - Fields: `name` (String), `advisor` (Professor?) — an associated professor
   - Constructor that takes `name` (advisor is optional, initially null)
   - Method: `setAdvisor(Professor p)` — sets the advisor
   - Method: `displayInfo()` — prints student name and advisor info (or "No advisor assigned")

### In `main()`:
- Create a `Professor` and two `Student` objects
- Assign the professor as advisor to one student
- Leave the other without an advisor
- Display info for both students

## Expected Output

```
Student: Alice
  Advisor: Professor Smith (Computer Science)

Student: Bob
  No advisor assigned
```
