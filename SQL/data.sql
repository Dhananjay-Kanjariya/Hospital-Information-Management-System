-- data.sql
-- Sample data for Hospital Information Management System

-- Department
INSERT INTO department VALUES ('DP001', 'Cardiology', 'Heart-related treatments');
INSERT INTO department VALUES ('DP002', 'Oncology', 'Cancer treatment and care');
INSERT INTO department VALUES ('DP003', 'Surgery', 'Surgical procedures');
INSERT INTO department VALUES ('DP004', 'Pediatrics', 'Child healthcare');
INSERT INTO department VALUES ('DP005', 'Emergency Medicine', 'Emergency care');

-- Room
INSERT INTO room VALUES ('General', 200, 5000.00);
INSERT INTO room VALUES ('VIP', 100, 10000.00);
INSERT INTO room VALUES ('ICU', 50, 15000.00);

-- Nurse
INSERT INTO nurse (N_Id, F_N, L_N, Contact_No, Dp_Id, Dp_N, Specialization) VALUES
('N901', 'Asha', 'Singh', '1234567890', 'DP001', 'Cardiology', 'Cardiac Care'),
('N902', 'Raj', 'Patel', '2345678901', 'DP002', 'Oncology', 'Cancer Care'),
('N906', 'Deepa', 'Mishra', '3456789012', 'DP002', 'Oncology', 'Chemotherapy'),
('N907', 'Vivek', 'Kumar', '9012345678', 'DP005', 'Emergency Medicine', 'Trauma Care'),
('N908', 'Anjali', 'Yadav', '8567890121', 'DP003', 'Surgery', 'Surgical Assistance'),
('N909', 'Riya', 'Sharma', '5982334567', 'DP004', 'Pediatrics', 'Pediatric Care');

-- Medicine
INSERT INTO medicine (Medicine_id, Medicine_N, Quantity, Cost_per_quantity) VALUES
('M001', 'Aspirin', 1000, 0.50),
('M002', 'Paracetamol', 2000, 0.30),
('M003', 'Insulin', 500, 10.00);

-- Lab Test
INSERT INTO lab_test (Lab_Test_Id, Lab_Test_Name, Lab_Test_Cost) VALUES
('LT01', 'Blood Test', 1000.00),
('LT02', 'X-Ray', 1500.00),
('LT03', 'MRI Scan', 5000.00);

-- Doctor
INSERT INTO doctor (Doc_Id, F_N, L_N, Contact_No, Dp_Id, Dp_N, Specialization, Available_Day, Available_Time) VALUES
('D001', 'John', 'Doe', '9876543210', 'DP001', 'Cardiology', 'Cardiologist', 'Mon-Fri', '09:00-17:00'),
('D002', 'Jane', 'Smith', '8765432109', 'DP002', 'Oncology', 'Oncologist', 'Tue-Sat', '10:00-18:00'),
('D003', 'Emily', 'Johnson', '7654321098', 'DP003', 'Surgery', 'Surgeon', 'Mon-Wed', '08:00-16:00');

-- Disease
INSERT INTO disease (Disease_id, Disease_N, Lab_Test_Id, Medicine_Id, Symptoms, Specialization, Doc_Id, N_Id) VALUES
('DS001', 'Hypertension', 'LT01', 'M001', 'High blood pressure, headache', 'Cardiology', 'D001', 'N901'),
('DS002', 'Cancer', 'LT03', 'M002', 'Fatigue, weight loss', 'Oncology', 'D002', 'N902');
