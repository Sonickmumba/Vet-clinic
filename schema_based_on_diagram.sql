CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL,
    date_of_birth DATE NOT NULL,
    PRIMARY KEY(id) 
);

CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL NOT NULL,
    generated_at TIMESTAMP NOT NULL,
    payed_at TIMESTAMP NOT NULL,
    medical_history_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(medical_history_id)
    REFERENCES medical_histories (id)
    ON DELETE CASCADE
);

CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INT NOT NULL,
    status VARCHAR(250) NOT NULL, 
    PRIMARY KEY(id),
    FOREIGN KEY(patient_id)
    REFERENCES patients (id)
    ON DELETE CASCADE
);

CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(250) NOT NULL,
    name VARCHAR(250) NOT NULL,
    PRIMARY KEY(id) 
);

CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_ptice DECIMAL NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL NOT NULL,
    invoice_id INT NOT NULL,
    treatment_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (invoice_id)
    REFERENCES invoices (id)
    ON DELETE CASCADE,
    FOREIGN KEY(treatment_id)
    REFERENCES treatments (id)
    ON DELETE CASCADE 
);

-- Many to Many Relationship Table
CREATE TABLE treatments_medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    treatment_id INT NOT NULL,
    medical_history_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY(treatment_id)
    REFERENCES treatments (id)
    ON DELETE CASCADE
    FOREIGN KEY (medical_history_id)
    REFERENCES medical_histories (id)
    ON DELETE CASCADE, 
);

/*created Index for every foreing key */
CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON treatments_medical_histories (medical_history_id);
CREATE INDEX ON treatments_medical_histories (treatment_id);