 🏥 Hospital Management System

A web-based Hospital Management System built using **Java (JDBC, Servlets, JSP)** and **MySQL** to manage appointments, doctors,
and patients with role-based access control for Admins, Doctors, and Users.

 💡 Project Overview

This system facilitates efficient hospital operations by allowing:
- **Admins** to manage doctors and oversee patient activity
- **Doctors** to view and update patient information
- **Patients (Users)** to book and track appointments

---

🛠️ Technologies Used

- **Java** (Servlets, JSP, JDBC)
- **MySQL** (Database)
- **Apache Tomcat** (Server)
- **HTML/CSS/Bootstrap** (Frontend UI)
- **JDBC Driver** for MySQL connection


 🔐 User Roles and Features

 👨‍⚕️ Admin
- Secure login via admin credentials
- Add new doctors and provide their login credentials
- View, edit, or delete doctor records
- View list of registered patients and their appointment status

🩺 Doctor
- Login using credentials provided by admin
- View list of patients assigned or who booked appointments
- Update patient appointment status (e.g., Approved, Rejected, Completed)
- View and edit doctor profile (e.g., specialization, contact info)
 👤 User / Patient
- Register with basic personal details
- Login to book appointments with available doctors
- Track appointment status (Pending / Approved / Completed)

## 📁 Project Structure
Hospital_Management_System/
├── src/
│ ├── db/
│ ├── dao/
│ ├── entity/
│ ├── servlet/
├── WebContent/
│ ├──admin/
│ ├── components/
│ ├── doctor/
│ ├── img/
│ ├── login.jsp
│ ├── register.jsp
│ ├──index.jsp
├── lib/ (JDBC JAR files)
└── README.md


---

## 🗃️ Database Design (MySQL)

### Tables:
- `admin`  
- `doctor` (id, name, specialization, email, password, contact, etc.)
- `patient` (id, name, email, password, gender, age, contact, etc.)
- `appointment` (id, patient_id, doctor_id, date, status)

> Ensure to include proper foreign key constraints for relations.

---

## 🚀 How to Run the Project

1. **Clone the Repository**
   bash
   git clone https://github.com/yourusername/hospital-management-system.git


2. **Import the Project into Eclipse or any Java IDE**

3. **Set up the Database**

   * Create a database named `hospital_db`
   * Import `hospital_db.sql` from the project files to populate tables

4. **Add MySQL JDBC Connector**

   * Copy `mysql-connector-java-x.x.xx.jar` to the `lib/` directory
   * Add it to your project build path

5. **Deploy on Apache Tomcat**

   * Run on `http://localhost:8080/Hospital_Management_System`

---

## 📸 Screenshots
* Home-
![Home](https://github.com/user-attachments/assets/aeef9769-22db-4258-a1cf-20fc03f2f93f)
![hom2](https://github.com/user-attachments/assets/b2e08c37-82c4-4d87-a606-96587e647be2)
![hom3](https://github.com/user-attachments/assets/f5c2748b-cf31-4398-b931-d9a5a805459b)

* Admin Dashboard
  ![ad-log](https://github.com/user-attachments/assets/b857632f-cd40-4dd1-85fe-4b1c46b49953)
![ad-db](https://github.com/user-attachments/assets/aba07dd7-473c-440f-8b65-49283ec3ab27)
![ad-adoc](https://github.com/user-attachments/assets/5d6dfcea-5573-4b2f-aa9a-267d6032cbfe)
![ad-edoc](https://github.com/user-attachments/assets/16f09e25-29f4-48e9-8bd2-60732c14ccb8)
![ad-vdoc](https://github.com/user-attachments/assets/ac1b66e8-10fa-466f-9212-48bc3193ea6d)
![ad-pt](https://github.com/user-attachments/assets/9df5fb80-d7f6-4976-bd41-e59c107bc1df)

* Doctor Dashboard
  ![doc-log](https://github.com/user-attachments/assets/4d4c6f5c-36c8-40b9-ab58-4ee1789a09b3)
![doc-db](https://github.com/user-attachments/assets/43aaff26-1685-44ff-81ea-636d225b9d7a)
![doc-pt](https://github.com/user-attachments/assets/0f00718b-8454-47f0-b015-b831ddd4385b)
![doc-pt-c](https://github.com/user-attachments/assets/d1b55a0b-d154-482e-939f-96826d67d6d4)
![doc-vpr-chp](https://github.com/user-attachments/assets/8ff734e6-b7ba-44f1-b93f-82b236f67972)
* User Login & Appointment
  ![user-log](https://github.com/user-attachments/assets/ba7ad266-48b2-4c9a-8f59-d75d97e87a18)
   ![user-db](https://github.com/user-attachments/assets/3bcddbd5-c616-45c6-b1c4-8c6ee4875037)
  ![book-apntmnt](https://github.com/user-attachments/assets/d50790d7-b38f-4453-8490-d250e600b78b)
![apnt-list](https://github.com/user-attachments/assets/87946a08-23c8-40ea-8a84-97427f99f6ab)
![user-chp](https://github.com/user-attachments/assets/76cc1104-8ac8-4c41-a77c-a3ff5cda5dff)

---

## ✍️ Author

**Vishal Yadav**
>Email-mr.vishalyadav0311@gmail.com
>LinkedIn-https://www.linkedin.com/in/vyadav03/
---

## 📃 License

This project is open-source and free to use for learning and educational purposes.
