-- Tabla Paciente 
CREATE TABLE Paciente (
    id_paciente SERIAL PRIMARY KEY,
    dpi VARCHAR(13),
    direccion VARCHAR(200),
    genero VARCHAR(10),
    nombre VARCHAR(100),
    fecha_nacimiento DATE,
    correo VARCHAR(100)
);

-- Tabla Contacto_Medico 
CREATE TABLE Contacto_Medico (
    carne VARCHAR(20) PRIMARY KEY,
    correo VARCHAR(100),
    telefono VARCHAR(10),
    nombre_medico VARCHAR(100)
);

-- Tabla Historial_Clinico con clave foránea
CREATE TABLE Historial_Clinico (
    id_historial SERIAL PRIMARY KEY,
    id_paciente INT,
    enfermedades VARCHAR(500),
    alergias VARCHAR(500),
    cirugias VARCHAR(500),
    inmunizaciones VARCHAR(500),
    medicamentos VARCHAR(500),
    resultados_examenes_fisicos VARCHAR(500),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);

-- Tabla Seguro_Medico con clave foránea
CREATE TABLE Seguro_Medico (
    no_poliza VARCHAR(50) PRIMARY KEY,
    id_paciente INT,
    compania_seguros VARCHAR(100),
    reclamos_seguro_medico VARCHAR(500),
    informacion_relevante VARCHAR(500),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);

-- Tabla Laboratorios 
CREATE TABLE Laboratorios (
    id_laboratorio SERIAL PRIMARY KEY,
    nombre_clinica VARCHAR(100),
    direccion_clinica VARCHAR(500),
    telefono_clinica VARCHAR(20),
    nombre_encargado VARCHAR(100),
    tipo_laboratorio VARCHAR(50)
);

-- Tabla Análisis con clave foránea
CREATE TABLE Analisis (
    id_analisis SERIAL PRIMARY KEY,
    id_paciente INT,
    id_laboratorio INT,
    tipo_analisis VARCHAR(500),
    fecha_realizacion DATE,
    monto NUMERIC(10, 2),
    resultados VARCHAR(500),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_laboratorio) REFERENCES Laboratorios(id_laboratorio)
);
ALTER TABLE Analisis ADD COLUMN estado VARCHAR(500);
ALTER TABLE Analisis ADD COLUMN fecha_inicio DATE;
ALTER TABLE Analisis ADD COLUMN fecha_fin DATE;

-- Tabla Factura con clave foránea
CREATE TABLE Factura (
    id_factura SERIAL PRIMARY KEY,
    no_poliza VARCHAR(50),
    nit VARCHAR(20),
    total NUMERIC(10, 2),
    FOREIGN KEY (no_poliza) REFERENCES Seguro_Medico(no_poliza)
);

-- Tabla intermedia para la relación muchos a muchos entre Paciente y Contacto_Medico
CREATE TABLE Paciente_Contacto_Medico (
    id_paciente INT,
    carne VARCHAR(20),
    PRIMARY KEY (id_paciente, carne),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (carne) REFERENCES Contacto_Medico(carne)
);

-- Inserts existentes 
INSERT INTO Paciente (id_paciente,dpi, direccion, genero, nombre, fecha_nacimiento, correo) 
VALUES 
(1,'1569784896325', 'ciudad quetzal, san juan sacatepequez', 'hombre', 'iker Escobar', '2006-05-31', 'ikeresc@gmail.com'),
(2, '5896324789561', 'mixco, guatemala', 'mujer', 'paula rodriguez', '2000-11-12', 'paulette04@gmail.com'),
(3, '2059784563218', 'san rafael, villa nueva', 'hombre', 'maynor escobar', '2000-11-05', 'maykkkesc@gmail.com'),
(4, '1234567890123', 'ciudad de guatemala', 'hombre', 'Juan Pérez', '1995-09-15', 'juanperez@gmail.com'),
(5, '9876543210987', 'antigua guatemala', 'mujer', 'María González', '1988-03-20', 'mariagonzalez@gmail.com'),
(6, '4567890123456', 'quetzaltenango', 'hombre', 'Pedro López', '1976-07-10', 'pedrolopez@gmail.com'),
(7, '7890123456789', 'flores, petén', 'mujer', 'Sofía Ramírez', '2002-12-03', 'sofiaramirez@gmail.com'),
(8, '2345678901234', 'cobán, alta verapaz', 'hombre', 'Luis García', '1990-04-28', 'luisgarcia@gmail.com'),
(9, '3456789012345', 'escuintla, escuintla', 'mujer', 'Ana Martínez', '1985-08-22', 'anamartinez@gmail.com'),
(10, '8765432109876', 'chichicastenango', 'hombre', 'Carlos Hernández', '1979-01-05', 'carloshernandez@gmail.com');

INSERT INTO Contacto_Medico (carne, correo, telefono, nombre_medico) 
VALUES
('12345', 'juanperezz@gmail.com', '1234567890', 'Dr. Juan Pérez'),
('67890', 'anastaciag@gmail.com', '0987654321', 'Dra. Ana Gómez'),
('54321', 'pezcadoruiz@gmail.com', '1122334455', 'Dr. Carlos Ruiz'),
('24680', 'luisramirez@gmail.com', '9876543210', 'Dr. Luis Ramírez'),
('13579', 'mariagonzalez@gmail.com', '5544332211', 'Dra. María González'),
('97531', 'pedromartinez@gmail.com', '9988776655', 'Dr. Pedro Martínez'),
('86420', 'sofiaramirez@gmail.com', '6677889900', 'Dra. Sofía Ramírez'),
('31415', 'carloshernandez@gmail.com', '2233445566', 'Dr. Carlos Hernández'),
('27182', 'lauragarcia@gmail.com', '1111222233', 'Dra. Laura García'),
('81920', 'joselopez@gmail.com', '4455667788', 'Dr. José López');

INSERT INTO Historial_Clinico (id_paciente, enfermedades, alergias, cirugias, inmunizaciones, medicamentos, resultados_examenes_fisicos) VALUES
(1 ,'Artritis', 'Aspirina', 'Reemplazo de cadera', 'Vacuna Antigripal', 'Ibuprofeno', 'Movilidad reducida en la articulación afectada, No signos de infección'),
(2 ,'Depresión', 'Ninguna', 'Ninguna', 'Vacuna Antidepresiva', 'Sertralina', 'Estado de ánimo estable, No signos de suicidio'),
(3 ,'Gastritis', 'Lactosa', 'Ninguna', 'Vacuna contra la Acidez', 'Omeprazol', 'Digestión normal, No sangrado gastrointestinal'),
(4 ,'Epilepsia', 'Ninguna', 'Lobectomía temporal', 'Vacuna contra la Epilepsia', 'Carbamazepina', 'Frecuencia de convulsiones reducida, No signos de epilepsia no controlada'),
(5 ,'Cáncer de mama', 'Ninguna', 'Mastectomía radical', 'Vacuna contra el Cáncer', 'Tamoxifeno', 'No signos de recurrencia, No signos de metástasis'),
(6 ,'Hipertensión', 'Ninguna', 'Ninguna', 'Vacuna contra la Hipertensión', 'Enalapril', 'Presión arterial controlada, No signos de complicaciones'),
(7 ,'Diabetes tipo 2', 'Insulina', 'Bypass gástrico', 'Vacuna contra la Diabetes', 'Insulina, Metformina', 'Niveles de azúcar en sangre controlados, Pérdida de peso adecuada'),
(8 ,'Asma', 'Polvo', 'Ninguna', 'Vacuna Antiasmática', 'Salbutamol, Beclometasona', 'Función pulmonar estable, No exacerbaciones recientes'),
(9 ,'Osteoporosis', 'Ninguna', 'Ninguna', 'Vacuna Osteoporótica', 'Alendronato', 'Densidad ósea estable, No fracturas recientes'),
(10 ,'Síndrome de intestino irritable', 'Ninguna', 'Ninguna', 'Vacuna Digestiva', 'Loperamida, Simeticona', 'Síntomas gastrointestinales controlados, No signos de inflamación');

INSERT INTO Seguro_Medico (no_poliza, id_paciente, compania_seguros, reclamos_seguro_medico, informacion_relevante) 
VALUES
('POL123456', 1, 'Seguros Vida S.A.', 'Reclamo por cirugía de rodilla en 2022', 'Cobertura completa en clínicas afiliadas'),
('POL789012', 2, 'Salud Total Ltda.', 'Reclamo por tratamiento de cáncer en 2021', 'Descuento en medicinas genéricas'),
('POL345678', 3, 'Aseguradora Nacional', 'Reclamo por fractura de brazo en 2020', 'Cobertura internacional limitada'),
('POL654321', 4, 'Vida Segura S.A.', 'Reclamo por cirugía de cadera en 2023', 'Asistencia en viajes'),
('POL987654', 5, 'Salud Familiar Ltda.', 'Reclamo por exámenes de laboratorio en 2022', 'Descuento en consultas médicas'),
('POL321987', 6, 'Seguros Integrales', 'Reclamo por tratamiento de diabetes en 2021', 'Cobertura dental básica'),
('POL654987', 7, 'Salud y Vida S.A.', 'Reclamo por hospitalización en 2023', 'Seguro de vida incluido'),
('POL123789', 8, 'Vida Saludable Ltda.', 'Reclamo por tratamiento de hipertensión en 2022', 'Cobertura de emergencias'),
('POL789456', 9, 'Aseguradora Familiar', 'Reclamo por cirugía ocular en 2021', 'Descuento en ópticas afiliadas'),
('POL456123', 10, 'Seguros Médicos Integrales', 'Reclamo por tratamiento de asma en 2023', 'Cobertura en medicinas alternativas');

INSERT INTO Laboratorios (nombre_clinica, direccion_clinica, telefono_clinica, nombre_encargado, tipo_laboratorio) 
VALUES
('Laboratorios Análisis Clínicos', 'Zona 10, Ciudad de Guatemala', '23748956', 'Dr. Alberto López', 'Bioquímico'),
('Laboratorios MedLab', 'Zona 1, Ciudad de Guatemala', '22345678', 'Dra. Gabriela Martínez', 'Microbiológico'),
('Laboratorios Salud y Vida', 'Zona 9, Ciudad de Guatemala', '23659874', 'Dr. Mario Pérez', 'Hematológico'),
('Laboratorios Clínicos Especializados', 'Zona 15, Ciudad de Guatemala', '24567892', 'Dra. Carolina Ruiz', 'Genético'),
('Laboratorios BioAnálisis', 'Zona 7, Ciudad de Guatemala', '22659874', 'Dr. Luis García', 'Inmunológico'),
('Laboratorios Central', 'Zona 11, Ciudad de Guatemala', '23748957', 'Dr. Ana Morales', 'Toxicología'),
('Laboratorios Santa Fe', 'Zona 8, Ciudad de Guatemala', '22345679', 'Dr. Julio Fernández', 'Parasitología'),
('Laboratorios MegaLab', 'Zona 5, Ciudad de Guatemala', '23659875', 'Dra. Sonia López', 'Química Clínica'),
('Laboratorios Clínicos Avanzados', 'Zona 13, Ciudad de Guatemala', '24567893', 'Dra. Patricia González', 'Endocrinología'),
('Laboratorios BioSalud', 'Zona 4, Ciudad de Guatemala', '22659875', 'Dr. Jorge Ramírez', 'Bacteriología');


INSERT INTO Analisis (id_paciente, id_laboratorio, tipo_analisis, fecha_realizacion, monto, resultados, estado, fecha_inicio, fecha_fin) 
VALUES
(1, 1, 'analisis de sangre', '2023-04-01', 250.00, 'Valores dentro de rangos normales', 'completado', '2023-01-01', '2023-12-31'),
(2, 2, 'analisis de orina', '2023-05-15', 300.00, 'Colesterol alto, Triglicéridos elevados', 'no completado', '2023-01-01', '2023-12-31'),
(3, 3, 'analisis de heces', '2023-06-20', 150.00, 'Niveles de glucosa elevados', 'completado', '2023-01-01', '2023-12-31'),
(4, 4, 'cultivos microbiologicos', '2023-07-10', 500.00, 'Mutación en el gen BRCA1', 'no completado', '2023-01-01', '2023-12-31'),
(5, 5, 'Prueba de diagnostico molecular', '2023-08-05', 200.00, 'Anticuerpos presentes', 'no completado', '2023-01-01', '2023-12-31'),
(6, 1, 'pruebas de imagenologia', '2023-09-12', 250.00, 'Valores dentro de rangos normales', 'completado', '2023-01-01', '2023-12-31'),
(7, 2, 'Ppruebas de diagnostico especializado', '2023-10-08', 300.00, 'Colesterol dentro de límites aceptables', 'no completado', '2023-01-01', '2023-12-31'),
(8, 3, 'Prueba de alergia', '2023-11-01', 150.00, 'Niveles de glucosa normales', 'completado', '2023-01-01', '2023-12-31'),
(9, 4, 'Pruebas de función Hroide', '2023-12-20', 500.00, 'No se encontraron mutaciones', 'no completado', '2023-01-01', '2023-12-31'),
(10, 5, 'Prueba de ETS', '2023-11-30', 200.00, 'Anticuerpos ausentes', 'completado', '2023-01-01', '2023-12-31');




INSERT INTO Factura (no_poliza, nit, total) 
VALUES
('POL123456', '123456789', 1000.00),
('POL789012', '987654321', 1500.00),
('POL345678', '456123789', 1200.00),
('POL654321', '789456123', 1800.00),
('POL987654', '321654987', 900.00),
('POL321987', '654987321', 1100.00),
('POL654987', '789123456', 1300.00),
('POL123789', '321987654', 1400.00),
('POL789456', '987321654', 1600.00),
('POL456123', '123789456', 1700.00);

INSERT INTO Paciente_Contacto_Medico (id_paciente, carne) 
VALUES
(1, '12345'),
(2, '67890'),
(3, '54321'),
(4, '24680'),
(5, '13579'),
(6, '97531'),
(7, '86420'),
(8, '31415'),
(9, '27182'),
(10, '81920');

--a
SELECT *
FROM Analisis
WHERE EXTRACT(MONTH FROM fecha_realizacion) = 5;

--b
SELECT tipo_analisis, COUNT(*) AS veces_contratado
FROM Analisis
GROUP BY tipo_analisis;

--c
SELECT *
FROM Analisis
WHERE estado != 'completado';

--d
SELECT CM.nombre_medico AS profesional_encargado,
       A.tipo_analisis AS servicio_realizado
FROM Analisis A
JOIN Laboratorios L ON A.id_laboratorio = L.id_laboratorio
JOIN Contacto_Medico CM ON L.nombre_encargado = CM.nombre_medico;

--e
WITH ServiciosPorClinica AS (
    SELECT L.nombre_clinica, A.tipo_analisis, COUNT(*) AS total_contratado
    FROM Analisis A
    JOIN Laboratorios L ON A.id_laboratorio = L.id_laboratorio
    GROUP BY L.nombre_clinica, A.tipo_analisis
),
RangoServiciosPorClinica AS (
    SELECT nombre_clinica, tipo_analisis, total_contratado,
           RANK() OVER(PARTITION BY nombre_clinica ORDER BY total_contratado DESC) AS rango
    FROM ServiciosPorClinica
)
SELECT nombre_clinica, tipo_analisis, total_contratado
FROM RangoServiciosPorClinica
WHERE rango = 1;

--f
SELECT SUM(A.monto) AS monto_total
FROM Analisis A
WHERE A.fecha_realizacion BETWEEN '2023-01-01' AND '2023-12-31';

--g
SELECT 
    DATE_TRUNC('month', fecha_realizacion) AS mes,
    COUNT(*) AS cantidad_servicios
FROM 
    Analisis
WHERE 
    resultados IS NOT NULL
GROUP BY 
    mes
ORDER BY 
    mes;
   
--h
SELECT
    SUM(CASE WHEN Factura.no_poliza IS NULL THEN Analisis.monto ELSE 0 END) AS monto_pagado_cliente,
    SUM(CASE WHEN Factura.no_poliza IS NOT NULL THEN Analisis.monto ELSE 0 END) AS monto_pagado_seguro
FROM
    Analisis
LEFT JOIN Seguro_Medico ON Analisis.id_paciente = Seguro_Medico.id_paciente
LEFT JOIN Factura ON Seguro_Medico.no_poliza = Factura.no_poliza;

--i
WITH MontosTotales AS (
    SELECT
        SUM(CASE WHEN Factura.no_poliza IS NULL THEN Analisis.monto ELSE 0 END) AS monto_cliente,
        SUM(CASE WHEN Factura.no_poliza IS NOT NULL THEN Analisis.monto ELSE 0 END) AS monto_seguro
    FROM
        Analisis
    LEFT JOIN Seguro_Medico ON Analisis.id_paciente = Seguro_Medico.id_paciente
    LEFT JOIN Factura ON Seguro_Medico.no_poliza = Factura.no_poliza
    WHERE
        Analisis.fecha_realizacion BETWEEN '2024-01-01' AND '2024-12-31'
)
SELECT
    CASE WHEN monto_cliente + monto_seguro = 0 THEN 0 ELSE (monto_cliente / (monto_cliente + monto_seguro)) * 100 END AS porcentaje_cliente,
    CASE WHEN monto_cliente + monto_seguro = 0 THEN 0 ELSE (monto_seguro / (monto_cliente + monto_seguro)) * 100 END AS porcentaje_seguro
FROM
    MontosTotales;
   
--j
SELECT 
    Paciente.nombre AS nombre_paciente,
    Analisis.fecha_realizacion AS fecha_completado,
    Analisis.monto,
    CASE 
        WHEN Paciente_Contacto_Medico.carne IS NOT NULL THEN 'Referido por médico'
        ELSE 'No referido'
    END AS referido_por_medico
FROM 
    Analisis
JOIN 
    Paciente ON Analisis.id_paciente = Paciente.id_paciente
LEFT JOIN 
    Paciente_Contacto_Medico ON Analisis.id_paciente = Paciente_Contacto_Medico.id_paciente;

 --k
ALTER TABLE Analisis
ALTER COLUMN monto TYPE NUMERIC(12, 2);

UPDATE Analisis
SET monto = monto * 1.02;

--l

UPDATE Analisis
SET tipo_analisis = UPPER(tipo_analisis);


--m
UPDATE Analisis
SET estado = 'inactivo'
WHERE id_analisis = 4;


--n
SELECT MAX(fecha_realizacion) AS ultima_fecha
FROM Analisis
WHERE tipo_analisis = 'analisis de sangre';

--o
SELECT MAX(fecha_realizacion) AS fecha_mas_reciente
FROM Analisis;

--p
SELECT nombre_medico
FROM (
    SELECT nombre_medico, COUNT(*) AS cantidad_referidos
    FROM Contacto_Medico
    GROUP BY nombre_medico
    ORDER BY cantidad_referidos DESC
    LIMIT 1
) AS medico_con_mas_referidos;

--q
SELECT no_poliza
FROM (
    SELECT no_poliza, COUNT(*) AS cantidad_utilizada
    FROM Factura
    GROUP BY no_poliza
    ORDER BY cantidad_utilizada DESC
    LIMIT 1
) AS seguro_mas_utilizado;

--para eliminar tablas
DROP TABLE  analisis, contacto_medico, factura, historial_clinico, laboratorios, paciente, paciente_contacto_medico, seguro_medico ;

