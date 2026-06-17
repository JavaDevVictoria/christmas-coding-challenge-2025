This project was developed within the framework of the Christmas Coding Challenge 2025, organised by Women Coding Community.

---

## Day 1 — Employee Details Management

**Language:** JavaScript (HTML5/DOM)

A browser-based employee management dashboard. Displays a list of employees using `map` and `join`, calculates total salaries with `reduce`, and supports searching by employee ID or specialization. Employee records include id, name, age, department, salary, and specialization.

---

## Day 2 — Unit Converter

**Language:** JavaScript, HTML5, CSS3

A multi-unit conversion tool with real-time calculations. Supports:
- Celsius to Fahrenheit
- Kilograms to pounds
- Kilometres to miles

---

## Day 3 — To-Do List Application

**Language:** JavaScript (inline HTML)

A task management app with dynamic DOM manipulation. Users can add new tasks (with input validation), edit existing tasks via a prompt dialog, and delete tasks. Tasks are rendered as list items with associated action buttons.

---

## Day 4 — Simple Interest Calculator

**Language:** JavaScript, HTML5, CSS3

A financial calculator that computes simple interest using the formula `Principal × Years × Rate / 100`. Features input validation for positive principal amounts, a range slider for the interest rate with live updates, and formatted result display.

---

## Day 5 — Portfolio / Profile Website

**Language:** JavaScript, HTML5, CSS3

A personal portfolio website with a recommendations section. Visitors can read existing recommendations and submit new ones via a popup confirmation flow. Includes a profile picture, project images, and responsive layout.

---

## Day 6 — Form Validation

**Language:** JavaScript (inline HTML)

A contact form with client-side validation. Validates that the name and email fields are not empty, manages focus on error, prevents form submission when validation fails, and supports form reset.

---

## Day 7 — Sales & Receipt Generator

**Language:** JavaScript (Node.js compatible)

A console-based sales and inventory tool. Calculates the total sales amount from an array of items, generates a formatted itemised receipt, and reports inventory stock levels showing in-stock vs out-of-stock status.

---

## Day 8 — Basic Spring Boot Application

**Language:** Java 21, Spring Boot 4.0.0

A minimal REST API starter project. Exposes a single `GET /` endpoint that returns `"Hello, Spring Boot!"` using `@RestController`. Serves as an introduction to Spring Boot project structure.

---

## Day 9 — Job Portal REST API

**Language:** Java 21, Spring Boot 4.0.0

A job listing service with in-memory storage. Endpoints:
- `GET /jobs` — returns all job listings
- `GET /jobs/search/{query}` — searches jobs by title or description

Tracks last access date and view counts per job. Data is seeded on startup via `@PostConstruct`.

---

## Day 10 — Library Management REST API

**Language:** Java 21, Spring Boot

A full CRUD library management system. Features:
- Book management: list, get by ID, create, update, delete, search by title or author (case-insensitive)
- Member management: full CRUD
- Borrowing records: borrow and return books, automatic 14-day due date calculation, available copy tracking

All endpoints are served under the `/api` path. Uses SLF4J for logging.

---

## Day 11 — Spring Course Lab Skeleton

**Language:** Java / Spring Boot (template)

A skeleton project structure used as a starting template for Spring Boot course labs. Contains a `library/` directory with a course directory layout and a `README.md` describing the lab structure.

---

## Day 12 — MVC Web Demo

**Language:** Java, Spring Boot MVC, Thymeleaf

A server-side template rendering demo. Controller exposes:
- `GET /` — renders `index.html`
- `GET /registration` — renders `registration.html`

Demonstrates the Spring MVC + Thymeleaf pattern for returning view names from a controller.

---

## Day 13 — MVC Web Demo (Extended)

**Language:** Java, Spring Boot MVC, Thymeleaf

A continuation of the Day 12 MVC demo, reinforcing the same Spring MVC + Thymeleaf approach with the same routing structure (`/` and `/registration`).

---

## Day 14 — Registration Form with Validation

**Language:** Java, Spring Boot, Thymeleaf, CSS

A user registration form with server-side validation. Endpoints:
- `GET /` — home page
- `GET /registration` — display registration form
- `POST /register` — process and validate submission

Validates: first name, last name, country, date of birth (must be in the past), email format, and annual income. Uses `@Valid` and `BindingResult`. A success page displays the submitted data upon passing validation.

---

## Day 15 — Secure Authentication Application

**Language:** Java, Spring Boot Security

Introduces Spring Security for user authentication. Features:
- User registration endpoint
- Login and logout functionality
- Custom `UserDetailsService` for loading user credentials
- `SecurityContext` integration
- A protected greeting page accessible only to authenticated users

---

## Day 16 — Quiz Application (Final Project)

**Language:** Java, Spring Boot Security

A role-based quiz management system. Key features:
- Admin and User roles with separate views and permissions
- Admin: create, edit, and delete quizzes and manage questions
- User: view and take quizzes
- User authentication with username/password
- Role-based routing using Spring Security

---

## Day 17 — Role-Based Authentication (Admin / Staff)

**Language:** Java, Spring Boot Security

A multi-role authentication application extending Day 15. Users register with username, first name, last name, email, password, and role. Supports `ROLE_ADMIN` and `ROLE_STAFF` with different routing after login. Unauthenticated users are redirected to the login page.

---

## Day 18 — JDBC Database Connection

**Language:** Java, JDBC, MySQL, Maven

Demonstrates raw JDBC connectivity to a MySQL database (`MY_DATABASE`). Covers:
- Establishing a connection and executing `SELECT` queries
- Filtering with `WHERE`, ordering with `ORDER BY DESC`, limiting results
- `GROUP BY` aggregation, `INNER JOIN` operations, and `NULL` value checks
- Iterating over and displaying `ResultSet` data

---

## Day 19 — SQL Exercises

**Language:** SQL (MySQL)

A collection of SQL DDL and DML exercises. Covers:
- Creating databases and tables
- `ALTER TABLE` to add columns
- `INSERT` (single and multiple records)
- `SELECT` with various clauses
- `UPDATE` with `WHERE` conditions
- `DELETE` operations
