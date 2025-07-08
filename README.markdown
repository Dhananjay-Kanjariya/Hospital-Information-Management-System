# Hospital Information Management System

This repository contains the source code for a Hospital Information Management System developed as part of the CSE250 Database Management System course (Winter Semester 2024) under Prof Shefali Naik. The system facilitates patient registration, appointment scheduling, and billing management for a hospital, based on an entity-relationship (ER) model.

## ER Diagram
The entity-relationship (ER) diagram illustrates the database schema, including entities such as `department`, `doctor`, `nurse`, `medicine`, `lab_test`, `disease`, `room`, and various registration tables, along with their relationships and attributes. View the ER diagram here:

[ER Diagram](https://www.canva.com/design/DAGBtpKfFSc/Zt4WWm3Dq6rOreFLWTBx7g/edit?utm_content=DAGBtpKfFSc&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)

## Project Structure
```
hospital-management-system/
├── SQL/
│   ├── schema.sql                    # Database table creation scripts
│   ├── data.sql                      # Sample data for tables
│   └── procedures_and_triggers.sql   # Database procedures and triggers
├── WEB/
│   ├── CSS/
│   │   └── styles.css                # CSS styling for the website
│   ├── HTML/
│   │   ├── index.html                # Main website page
│   │   ├── registration.html         # Registration type selection page
│   │   ├── opd_registration.html     # OPD registration form
│   │   ├── normal_registration.html  # Normal registration form
│   │   ├── pre_registration.html     # Pre-registration form
│   │   ├── emergency_registration.html # Emergency registration form
│   │   ├── about.html                # About page
│   │   ├── search.html               # Patient information search page
│   │   └── billing.html              # Billing page
│   ├── PHP/
│   │   ├── opd_registration.php      # PHP for OPD registration
│   │   ├── normal_registration.php   # PHP for normal registration
│   │   ├── pre_registration.php      # PHP for pre-registration
│   │   └── emergency_registration.php # PHP for emergency registration
└── Project_Report.pdf                # Report of the Project
└── README.markdown                         # Setup and usage instructions
``` 

## Setup Instructions
1. **Database Setup**:
   - Create a MySQL database named `hospital_db`.
   - Execute `sql/schema.sql` to create the tables.
   - Execute `sql/data.sql` to populate the tables with sample data.
   - Execute `sql/procedures_and_triggers.sql` to set up stored procedures and triggers.

2. **Web Server Setup**:
   - Place the `web/` folder in your web server's root directory (e.g., `htdocs` for XAMPP).
   - Ensure PHP and MySQL are installed and configured.
   - Update the database connection details (server, username, password) in the PHP files (`web/php/*.php`) if necessary.

3. **Access the Application**:
   - Open a web browser and navigate to `http://localhost/web/html/index.html`.
   - Use the navigation menu to access registration, patient information, and billing pages.

## Notes
- The ER diagram is hosted on Canva and accessible via the link above. Ensure the link is set to "Anyone with the link can view" for accessibility.
- The `search.html` and `billing.html` pages are placeholders and require backend logic to integrate with the database (e.g., calling `Normal_Reg` and `billing_Normal` procedures).
- The system assumes a MySQL database and a PHP-enabled web server.
- Font Awesome icons are referenced in HTML files; ensure an internet connection or include a local copy of Font Awesome for offline use.

## Acknowledgments
- Developed by Shlok, Bhishmadevsinh and Dhananjay.
- Special thanks to Dr. Bharat Gadhvi and the HCG Group of Hospitals for their support.
