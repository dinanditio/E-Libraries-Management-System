# E-Libraries-Management-System
SQL Database implementation of E-Libraries Management workflow

# Database Spesification
- Mission Statement
- Business Rules
- Design Requirements
- ERD

# Mission Statement
- To empower the lives of users by providing seamless, intuitive, and comprehensive access to a diverse collection of books across multiple libraries
- To bring education and entertainment through innovative digital lending experiences
- To leverage cutting-edge technology to foster a culture of reading and learning through a solid, reliable and user-friendly platform that supports community engagement and the pursuit of knowledge

# Business Rules
- Library name and location must not be null to ensure every library record has essential identifying information.
- Book title, author, and category must not be null, ensuring complete bibliographic information is always available.
- Each book copy must be linked to an existing book and library (foreign keys), and availability status must not be null, defaulting to true (available).
- Username and email must be unique and not null, preventing duplicate registrations.
- Password hash must not be null to ensure security requirements are met.
- Registration date must not be null and defaults to the current date.
- Loan and due dates must not be null, ensuring all loans have defined timeframes.
- Return date can be null if the book has not yet been returned.
- Hold placement and expiration dates must not be null to track the lifecycle of a hold effectively.

# Design Requirements

- Use Crow’s Foot Notation.
- Specify the primary key fields in each table by specifying PK beside the fields.
- Draw a line between the fields of each table to show the relationships between each table. This line should be pointed directly to the fields in each table that are used to form the relationship.
- Specify which table is on the one side of the relationship by placing a one next to the field where the line starts.
- Specify which table is on the many side of the relationship by placing a crow’s feet symbol next to the field where the line ends.

# ERD
![E-Libraries ERD](https://github.com/dinanditio/E-Libraries-Management-System/assets/70616178/3ef21176-b8e4-4f9f-9687-023ae665fa7f)


