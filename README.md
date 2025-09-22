# Hospital Management Database

This repository contains the database schema, ER diagram description, and sample SQL queries for a Hospital Management System.

---

## ER Diagram Description

### Entities and Key Attributes

**Patients**
- `patient_id` (PK)  
- `name`  
- `age`  
- `phone`  
- `address`  

**Doctors**
- `doctor_id` (PK)  
- `name`  
- `phone`  
- `department_id` (FK → Departments.departments_id)  

**Departments**
- `departments_id` (PK)  
- `name`  

**Appointments**
- `appointment_id` (PK)  
- `patient_id` (FK → Patients.patient_id)  
- `doctor_id` (FK → Doctors.doctor_id)  
- `appointment_date`  
- `status`  

**Treatments**
- `treatment_id` (PK)  
- `appointment_id` (FK → Appointments.appointment_id)  
- `patient_id` (FK → Patients.patient_id)  
- `doctor_id` (FK → Doctors.doctor_id)  
- `description`  
- `treatment_date`  

**Medicines**
- `medicine_id` (PK)  
- `name`  
- `price`  

**Treatment_Medicines**
- `treatment_id` (FK → Treatments.treatment_id)  
- `medicine_id` (FK → Medicines.medicine_id)  
- `quantity`  

**Bills**
- `bill_id` (PK)  
- `patient_id` (FK → Patients.patient_id)  
- `total_amount`  
- `payment_status`  
- `bill_date`  

---

## Relationships

- **Patients ↔ Appointments** → One patient can have multiple appointments.  
- **Doctors ↔ Appointments** → One doctor can have multiple appointments.  
- **Departments ↔ Doctors** → One department has multiple doctors.  
- **Appointments ↔ Treatments** → One appointment can have multiple treatments.  
- **Treatments ↔ Medicines** → Many-to-many via `Treatment_Medicines`.  
- **Patients ↔ Bills** → One patient can have multiple bills.  

---

## SQL Queries & Working Explanation

### 1. Retrieve All Patients
```sql
SELECT *
FROM "Hospital_Managment".Patients;
