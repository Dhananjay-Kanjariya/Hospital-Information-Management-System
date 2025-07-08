-- procedures_and_triggers.sql
-- Procedures and triggers for Hospital Information Management System

-- Procedure for Normal Registration Search
CREATE OR REPLACE PROCEDURE Normal_Reg(ptid INT) IS
    patientid INT := ptid;
    CURSOR c_patient IS SELECT * FROM normal_registration;
    r_patient c_patient%ROWTYPE;
    CURSOR c_patientdisease_on_symptoms(symptomsmatch VARCHAR) IS 
        SELECT * FROM disease WHERE Symptoms = symptomsmatch;
    r_patientdisease_on_symptoms c_patientdisease_on_symptoms%ROWTYPE;
    CURSOR c_medicine(medid VARCHAR) IS SELECT * FROM medicine WHERE Medicine_id = medid;
    r_medicine c_medicine%ROWTYPE;
    CURSOR c_lab(lid VARCHAR) IS SELECT * FROM lab_test WHERE Lab_Test_Id = lid;
    r_lab c_lab%ROWTYPE;
    CURSOR c_room(patientroom VARCHAR) IS SELECT * FROM room WHERE RoomName = patientroom;
    r_room c_room%ROWTYPE;
    CURSOR c_doctor(id VARCHAR) IS SELECT * FROM doctor WHERE Doc_id = id;
    r_doctor c_doctor%ROWTYPE;
    CURSOR c_nurse(id VARCHAR) IS SELECT * FROM nurse WHERE N_Id = id;
    r_nurse c_nurse%ROWTYPE;
BEGIN
    OPEN c_patient;
    LOOP
        FETCH c_patient INTO r_patient;
        EXIT WHEN c_patient%NOTFOUND;
        OPEN c_patientdisease_on_symptoms(r_patient.Normalsymptoms);
        LOOP
            FETCH c_patientdisease_on_symptoms INTO r_patientdisease_on_symptoms;
            EXIT WHEN c_patientdisease_on_symptoms%NOTFOUND;
            IF (patientid = r_patient.NormalPt_Id) THEN
                OPEN c_medicine(r_patientdisease_on_symptoms.Medicine_Id);
                LOOP
                    FETCH c_medicine INTO r_medicine;
                    EXIT WHEN c_medicine%NOTFOUND;
                    OPEN c_lab(r_patientdisease_on_symptoms.Lab_Test_Id);
                    LOOP
                        FETCH c_lab INTO r_lab;
                        EXIT WHEN c_lab%NOTFOUND;
                        OPEN c_room(r_patient.NormalRoom_N);
                        LOOP
                            FETCH c_room INTO r_room;
                            EXIT WHEN c_room%NOTFOUND;
                            OPEN c_doctor(r_patientdisease_on_symptoms.Doc_Id);
                            LOOP
                                FETCH c_doctor INTO r_doctor;
                                EXIT WHEN c_doctor%NOTFOUND;
                                OPEN c_nurse(r_patientdisease_on_symptoms.N_Id);
                                LOOP
                                    FETCH c_nurse INTO r_nurse;
                                    EXIT WHEN c_nurse%NOTFOUND;
                                    DBMS_OUTPUT.PUT_LINE('The patient name=> ' || r_patient.NormalF_Name || 
                                        ' and the symptoms=> ' || r_patient.Normalsymptoms || 
                                        ' and the disease=> ' || r_patientdisease_on_symptoms.Disease_N || 
                                        ' and medicine=> ' || r_medicine.Medicine_N || 
                                        ' and Lab Test=> ' || r_lab.Lab_Test_Name || 
                                        ' Room=> ' || r_room.RoomName || 
                                        ' Doctor=> ' || r_doctor.F_N || ' ' || r_doctor.L_N || 
                                        ' Available=> ' || r_doctor.Available_Day || ' ' || r_doctor.Available_Time || 
                                        ' Nurse=> ' || r_nurse.N_Id || ' ' || r_nurse.F_N || ' ' || r_nurse.L_N);
                                END LOOP;
                                CLOSE c_nurse;
                            END LOOP;
                            CLOSE c_doctor;
                        END LOOP;
                        CLOSE c_room;
                    END LOOP;
                    CLOSE c_lab;
                END LOOP;
                CLOSE c_medicine;
            END IF;
        END LOOP;
        CLOSE c_patientdisease_on_symptoms;
    END LOOP;
    CLOSE c_patient;
END;
/

-- Procedure for Billing (Normal Registration)
CREATE OR REPLACE PROCEDURE billing_Normal(patientid INT) IS
    CURSOR c_normalreg_patient IS SELECT * FROM normal_registration;
    r_normalreg_patient c_normalreg_patient%ROWTYPE;
    CURSOR c_medicine_fromspecialiazition(symptom VARCHAR) IS SELECT * FROM disease WHERE Symptoms = symptom;
    r_medicine_fromspecialiazition c_medicine_fromspecialiazition%ROWTYPE;
    CURSOR c_medicinecostfrommedicine(med_id VARCHAR) IS SELECT * FROM medicine WHERE Medicine_Id = med_id;
    r_medicinecostfrommedicine c_medicinecostfrommedicine%ROWTYPE;
    CURSOR c_labcostfromlab(lab_Id VARCHAR) IS SELECT * FROM lab_test WHERE Lab_Test_Id = lab_Id;
    r_labcostfromlab c_labcostfromlab%ROWTYPE;
    CURSOR c_roomNameandcost(Room_Name VARCHAR) IS SELECT * FROM room WHERE RoomName = Room_Name;
    r_roomNameandcost c_roomNameandcost%ROWTYPE;
    help INT := 0;
    finalhelp INT := 0;
    finalmosthelp INT := 0;
BEGIN
    OPEN c_normalreg_patient;
    LOOP
        FETCH c_normalreg_patient INTO r_normalreg_patient;
        EXIT WHEN c_normalreg_patient%NOTFOUND;
        OPEN c_medicine_fromspecialiazition(r_normalreg_patient.Normalsymptoms);
        LOOP
            FETCH c_medicine_fromspecialiazition INTO r_medicine_fromspecialiazition;
            EXIT WHEN c_medicine_fromspecialiazition%NOTFOUND;
            OPEN c_medicinecostfrommedicine(r_medicine_fromspecialiazition.Medicine_Id);
            LOOP
                FETCH c_medicinecostfrommedicine INTO r_medicinecostfrommedicine;
                EXIT WHEN c_medicinecostfrommedicine%NOTFOUND;
                OPEN c_labcostfromlab(r_medicine_fromspecialiazition.Lab_Test_Id);
                LOOP
                    FETCH c_labcostfromlab INTO r_labcostfromlab;
                    EXIT WHEN c_labcostfromlab%NOTFOUND;
                    OPEN c_roomNameandcost(r_normalreg_patient.NormalRoom_N);
                    LOOP
                        FETCH c_roomNameandcost INTO r_roomNameandcost;
                        EXIT WHEN c_roomNameandcost%NOTFOUND;
                        DBMS_OUTPUT.PUT_LINE(r_normalreg_patient.NormalF_Name || 
                            ' Cost of Medicine => ' || r_medicinecostfrommedicine.Medicine_N || 
                            ' Cost of Lab Test => ' || r_labcostfromlab.Lab_Test_Name || 
                            ' Cost of Lab Test => ' || r_labcostfromlab.Lab_Test_Cost || 
                            ',Room Name => ' || r_roomNameandcost.RoomName || 
                            ' Room Cost => ' || r_roomNameandcost.BedPrice);
                        help := help + r_medicinecostfrommedicine.Cost_per_Quantity;
                        finalhelp := help + r_labcostfromlab.Lab_Test_Cost;
                        finalmosthelp := finalmosthelp + finalhelp + r_roomNameandcost.BedPrice;
                        DBMS_OUTPUT.PUT_LINE('Total Cost => ' || finalmosthelp);
                    END LOOP;
                    CLOSE c_roomNameandcost;
                END LOOP;
                CLOSE c_labcostfromlab;
            END LOOP;
            CLOSE c_medicinecostfrommedicine;
        END LOOP;
        CLOSE c_medicine_fromspecialiazition;
    END LOOP;
    CLOSE c_normalreg_patient;
END;
/

-- Trigger for Aadhar Card Validation
CREATE OR REPLACE TRIGGER inserting_aadhar
BEFORE INSERT ON normal_registration
FOR EACH ROW
ENABLE
BEGIN
    IF (:NEW.Normal_IDCard = 'Aadhar Card') THEN
        IF (LENGTH(:NEW.Normal_IDCardNumber) <> 12) THEN
            RAISE_APPLICATION_ERROR(-20000, 'Can not add this value');
        END IF;
    ELSIF (:NEW.Normal_IDCard = 'PAN Card') THEN
        IF (LENGTH(:NEW.Normal_IDCardNumber) <> 10) THEN
            RAISE_APPLICATION_ERROR(-20000, 'Can not add this value');
        END IF;
    ELSIF (:NEW.Normal_IDCard = 'Driving Licence') THEN
        IF (LENGTH(:NEW.Normal_IDCardNumber) <> 16) THEN
            RAISE_APPLICATION_ERROR(-20000, 'Can not add this value');
        END IF;
    ELSIF (:NEW.Normal_IDCard = 'Passport') THEN
        IF (LENGTH(:NEW.Normal_IDCardNumber) <> 8) THEN
            RAISE_APPLICATION_ERROR(-20000, 'Can not add this value');
        END IF;
    END IF;
END;
/

-- Trigger for Gender Validation
CREATE OR REPLACE TRIGGER inserting_Gender
BEFORE INSERT ON normal_registration
FOR EACH ROW
ENABLE
BEGIN
    IF (:NEW.NormalGender <> 'Male' AND :NEW.NormalGender <> 'Female') THEN
        RAISE_APPLICATION_ERROR(-20010, 'Please Enter some other value for gender');
    END IF;
END;
/

-- Trigger for Mobile Number Validation
CREATE OR REPLACE TRIGGER inserting_mobile_number
BEFORE INSERT ON normal_registration
FOR EACH ROW
BEGIN
    IF (LENGTH(:NEW.NormalMobileNumber) <> 10) THEN
        RAISE_APPLICATION_ERROR(-20005, 'Please enter a ten digit mobile Number');
    END IF;
END;
/