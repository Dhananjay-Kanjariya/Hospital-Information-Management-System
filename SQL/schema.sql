-- schema.sql
-- Create database tables for Hospital Information Management System

CREATE TABLE department (
    Dp_id VARCHAR(50),
    Dp_N VARCHAR(50),
    Dp_desc VARCHAR(500),
    PRIMARY KEY (Dp_id, Dp_N)
);

CREATE TABLE medicine (
    Medicine_id VARCHAR(50) PRIMARY KEY,
    Medicine_N VARCHAR(100),
    Quantity INT,
    Cost_per_quantity FLOAT
);

CREATE TABLE lab_test (
    Lab_Test_Id VARCHAR(5) PRIMARY KEY,
    Lab_Test_Name VARCHAR(100),
    Lab_Test_Cost FLOAT
);

CREATE TABLE doctor (
    Doc_Id VARCHAR(100) PRIMARY KEY,
    F_N VARCHAR(50),
    L_N VARCHAR(50),
    Contact_No VARCHAR(10),
    Dp_Id VARCHAR(100),
    Dp_N VARCHAR(100),
    FOREIGN KEY (Dp_Id, Dp_N) REFERENCES department(Dp_Id, Dp_N),
    Specialization VARCHAR(100),
    Available_Day VARCHAR(30),
    Available_Time VARCHAR(100)
);

CREATE TABLE nurse (
    N_Id VARCHAR(100) PRIMARY KEY,
    F_N VARCHAR(50),
    L_N VARCHAR(50),
    Contact_No VARCHAR(10),
    Dp_Id VARCHAR(100),
    Dp_N VARCHAR(100),
    FOREIGN KEY (Dp_Id, Dp_N) REFERENCES department(Dp_Id, Dp_N),
    Specialization VARCHAR(100)
);

CREATE TABLE disease (
    Disease_id VARCHAR(50) PRIMARY KEY,
    Disease_N VARCHAR(100),
    Lab_Test_Id VARCHAR(5),
    Medicine_Id VARCHAR(50),
    Symptoms VARCHAR(500),
    Specialization VARCHAR(100),
    Doc_Id VARCHAR(100),
    N_Id VARCHAR(100),
    FOREIGN KEY (Lab_Test_Id) REFERENCES lab_test(Lab_Test_Id),
    FOREIGN KEY (Medicine_Id) REFERENCES medicine(Medicine_id),
    FOREIGN KEY (Doc_Id) REFERENCES doctor(Doc_Id),
    FOREIGN KEY (N_Id) REFERENCES nurse(N_Id)
);

CREATE TABLE room (
    RoomName VARCHAR(100) PRIMARY KEY,
    No_of_beds INT,
    BedPrice FLOAT
);

CREATE TABLE pre_registration (
    PrePt_Id VARCHAR(100) PRIMARY KEY,
    PreF_Name VARCHAR(100),
    PreM_Name VARCHAR(100),
    PreL_Name VARCHAR(100),
    PreGender VARCHAR(10),
    PreMarital_Status VARCHAR(100),
    PreDOB DATE,
    PreB_Group VARCHAR(10),
    PreIdentification_M VARCHAR(100),
    Pre_IDCard VARCHAR(100),
    Pre_IDNumber VARCHAR(100),
    PreAddress VARCHAR(100),
    PreMobileNumber VARCHAR(10),
    PreRoom_N VARCHAR(100),
    PreRef VARCHAR(100),
    PreRefInput VARCHAR(100),
    Presymptoms VARCHAR(100),
    FOREIGN KEY (PreRoom_N) REFERENCES room(RoomName)
);

CREATE TABLE normal_registration (
    NormalPt_Id INT PRIMARY KEY,
    NormalF_Name VARCHAR(100),
    NormalM_Name VARCHAR(100),
    NormalL_Name VARCHAR(100),
    NormalGender VARCHAR(10),
    NormalMarital_Status VARCHAR(100),
    NormalDOB DATE,
    NormalB_Group VARCHAR(10),
    NormalIdentification_M VARCHAR(100),
    Normal_IDCard VARCHAR(100),
    Normal_IDCardNumber VARCHAR(100),
    NormalFatherName VARCHAR(100),
    NormalMotherName VARCHAR(100),
    NormalGuardian VARCHAR(100),
    NormalAddress VARCHAR(100),
    NormalMobileNumber VARCHAR(10),
    NormalRoom_N VARCHAR(100),
    Normalsymptoms VARCHAR(100),
    FOREIGN KEY (NormalRoom_N) REFERENCES room(RoomName)
);

CREATE TABLE emergency_registration (
    EmergencyPt_Id INT PRIMARY KEY,
    EmergencyF_Name VARCHAR(100),
    EmergencyM_Name VARCHAR(100),
    EmergencyL_Name VARCHAR(100),
    EmergencyGender VARCHAR(100),
    EmergencyDOB DATE,
    EmergencyB_Group VARCHAR(10),
    EmergencyIdentification_M VARCHAR(100),
    Emergency_IDCard VARCHAR(100),
    Emergency_IDNumber VARCHAR(100),
    EmergencyAddress VARCHAR(100),
    EmergencyMobileNumber VARCHAR(10),
    EmergencyRoom_N VARCHAR(100),
    Emergencysymptoms VARCHAR(100),
    EmergencyAccompanyingFName VARCHAR(100),
    EmergencyAccompanyingMName VARCHAR(100),
    EmergencyAccompanyingLName VARCHAR(100),
    EmergencyAccompanyingMobileNumber VARCHAR(10),
    EmergencyAccompanyingGender VARCHAR(100),
    EmergencyAccompanyingIDCard VARCHAR(100),
    EmergencyAccompanyingIDCardNumber VARCHAR(100),
    EmergencyAccompanyingRelation VARCHAR(100),
    FOREIGN KEY (EmergencyRoom_N) REFERENCES room(RoomName)
);

CREATE TABLE opd_registration (
    Pt_Id VARCHAR(100) PRIMARY KEY,
    F_Name VARCHAR(100),
    M_Name VARCHAR(100),
    L_Name VARCHAR(100),
    Gender VARCHAR(100),
    DOB DATE,
    Mobile_Number VARCHAR(10),
    Specialization VARCHAR(100)
);