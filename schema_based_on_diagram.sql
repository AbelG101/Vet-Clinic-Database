CREATE TABLE IF NOT EXISTS public.treatments
(
    id integer NOT NULL,
    type character varying(30) COLLATE pg_catalog."default",
    name character varying(40) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tratments_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.patients
(
    id integer NOT NULL,
    name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    date_of_birth date,
    CONSTRAINT patients_pkey PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS public.medical_histories
(
    id integer NOT NULL,
    admitted_at integer,
    patient_id integer,
    status character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT medical_histories_pkey PRIMARY KEY (id),
    CONSTRAINT fk_patient FOREIGN KEY (patient_id)
        REFERENCES public.patients (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.invoices
(
    id integer NOT NULL,
    total_amount numeric NOT NULL,
    generated_at date,
    payed_at date,
    medical_history_id integer,
    CONSTRAINT invoices_pkey PRIMARY KEY (id),
    CONSTRAINT fk_invoice FOREIGN KEY (medical_history_id)
        REFERENCES public.medical_histories (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS public.invoice_items
(
    id integer NOT NULL,
    unit_price numeric,
    quantity integer,
    total_price numeric,
    invoice_id integer,
    treatment_id integer,
    CONSTRAINT inoice_items_pkey PRIMARY KEY (id),
    CONSTRAINT fk_invoice_items FOREIGN KEY (invoice_id)
        REFERENCES public.invoices (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_treatment_id FOREIGN KEY (treatment_id)
        REFERENCES public.treatments (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS treatment_histories (
	history_id int,
	treatment_id int,
	FOREIGN KEY (history_id) REFERENCES medical_histories(id),
	FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);
