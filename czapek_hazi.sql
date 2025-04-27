CREATE USER proba_felhasznalo IDENTIFIED BY 'jelszo123';

ALTER TABLE UGYFEL
ALTER COLUMN EMAIL ADD MASKED WITH (FUNCTION = 'email()');

ALTER TABLE UGYFEL
ALTER COLUMN NEV ADD MASKED WITH (FUNCTION = 'partial(1, "*****", 1)');

ALTER TABLE UGYFEL
ALTER COLUMN CIM ADD MASKED WITH (FUNCTION = 'partial(5, "*****", 5)');

CREATE VIEW maszkolt_ugyfel_tabla AS
SELECT
    [LOGIN],
    EMAIL,
    NEV,
    SZULEV,
    CASE 
        WHEN NEM = 'F' THEN '👩‍💻'
        WHEN NEM = 'M' THEN '👨‍💻'
    END AS NEM,
    CIM
FROM UGYFEL;

GRANT SELECT ON maszkolt_ugyfel_tabla TO proba_felhasznalo;


SELECT * FROM maszkolt_ugyfel_tabla;