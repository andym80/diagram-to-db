CREATE DATABASE clinic;
CREATE TABLE patients (id INT PRIMARY KEY, name varchar(50), date_of_bith date);
CREATE TABLE medical_histories (id INT PRIMARY KEY,admitted_at TIMESTAMP, patient_id INT,status VAR
CHAR(20));
CREATE TABLE treatments (id INT PRIMARY KEY,type VARCHAR(25),name VARCHAR(50));
CREATE TABLE invoice_items (id INT PRIMARY KEY, unit_price DECIMAL,quantity INT,total_price DECIMAL,
invoice_id INT,treatment_id INT);
CREATE TABLE invoices (id INT PRIMARY KEY, total_amount DECIMAL, generated_at TIMESTAMP,payed_at TI
MESTAMP,medical_history_id INT);

--
ALTER TABLE medical_histories ADD CONSTRAINT pk_patient_id FOREIGN KEY(patient_id) REFERENCES  patients(id);
ALTER TABLE invoices ADD CONSTRAINT pk_medical_history_id FOREIGN KEY(medical_history_id) REFERENCES  medical_histories(id);
ALTER TABLE invoice_items ADD CONSTRAINT pk_invoice_id FOREIGN KEY(invoice_id) REFERENCES  invoices(id);
ALTER TABLE treatments ADD COLUMN medical_histories_id INT;
ALTER TABLE treatments ADD CONSTRAINT pk_medical_histories_id FOREIGN KEY(medical_histories_id) REFERENCES medical_histories(id);
ALTER TABLE treatments ADD COLUMN invoice_items_id INT;
ALTER TABLE treatments ADD CONSTRAINT pk_invoice_items_id FOREIGN KEY (invoice_items_id) REFERENCES invoice_items(id);

CREATE TABLE medical_histories_has_treatments (
    medical_history_id int references medical_histories(id),
    treatment_id int references treatments(id)
    );

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON medical_histories_has_treatments (medical_history_id);
CREATE INDEX ON medical_histories_has_treatments (treatment_id);

-- Path: schema_based_on_diagram.sql




