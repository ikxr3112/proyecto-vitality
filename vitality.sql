-- Tabla Paciente
CREATE TABLE Paciente (
    id_paciente SERIAL PRIMARY KEY,
    nombre VARCHAR(30),
    genero VARCHAR(15),
    direccion VARCHAR(50),
    dpi VARCHAR(13),
    fecha_nacimiento DATE,
    correo VARCHAR(50)
);

-- Tabla Contacto Médico
CREATE TABLE Contacto_Medico (
    id_contacto SERIAL PRIMARY KEY,
    carne VARCHAR(20),
    telefono VARCHAR(20),
    correo VARCHAR(50),
    nombre_medico VARCHAR(30),
    id_paciente INT REFERENCES Paciente(id_paciente) -- Relación con Paciente
);

-- Tabla Historial Clínico
CREATE TABLE Historial_Clinico (
    id_historial SERIAL PRIMARY KEY,
    enfermedades VARCHAR(100),
    alergias VARCHAR(100),
    cirugias VARCHAR(100),
    inmunizaciones VARCHAR(100),
    medicamentos VARCHAR(100),
    resultados_examenes VARCHAR(100),
    id_paciente INT REFERENCES Paciente(id_paciente) -- Relación con Paciente
);

-- Tabla Seguro Médico
CREATE TABLE Seguro_Medico (
    id_seguro SERIAL PRIMARY KEY,
    compania_seguros VARCHAR(255),
    no_poliza VARCHAR(25),
    reclamaciones VARCHAR(250),
    informacion_relevante VARCHAR(250),
    id_paciente INT REFERENCES Paciente(id_paciente) -- Relación con Paciente
);

CREATE TABLE Laboratorios (
    id_laboratorio SERIAL PRIMARY KEY,
    nombre_clinica VARCHAR(60),
    direccion_clinica VARCHAR(60),
    telefono_clinica VARCHAR(20),
    responsable VARCHAR(255),
    nombre_encargado VARCHAR(255),
    tipo_laboratorio VARCHAR(255)
);
ALTER TABLE laboratorios  ALTER COLUMN nombre_clinica TYPE VARCHAR(100);

-- Tabla de Relación entre Laboratorios y Análisis
CREATE TABLE Laboratorio_Analisis (
    id_laboratorio INT REFERENCES Laboratorios(id_laboratorio),
    id_analisis INT REFERENCES Analisis(id_analisis),
    PRIMARY KEY (id_laboratorio, id_analisis)
);

-- Tabla Análisis
CREATE TABLE Analisis (
    id_analisis SERIAL PRIMARY KEY,
    tipo_analisis VARCHAR(60),
    fecha_realizacion DATE,
    resultados VARCHAR(250),
    monto DECIMAL(10, 2),
    id_paciente INT REFERENCES Paciente(id_paciente), -- Relación con Paciente
    id_laboratorio INT REFERENCES Laboratorios(id_laboratorio), -- Relación con Laboratorios
    estado VARCHAR(100)
    );


ALTER TABLE Analisis ADD COLUMN fecha_inicio DATE;
ALTER TABLE Analisis ADD COLUMN fecha_fin DATE;
ALTER TABLE Analisis ADD COLUMN ultima_fecha_venta DATE;

-- Tabla Factura
CREATE TABLE Factura (
    id_factura SERIAL PRIMARY KEY,
    nit VARCHAR(20),
    total DECIMAL(10, 2),
    id_paciente INT REFERENCES Paciente(id_paciente), -- Relación con Paciente
    id_seguro INT REFERENCES Seguro_Medico(id_seguro) -- Relación con Seguro Médico
);


-- Insertar usuarios ficticios en la tabla Paciente
INSERT INTO Paciente (nombre, genero, direccion, dpi, fecha_nacimiento, correo)
VALUES
    ('Ana Martínez', 'Femenino', 'Calle Principal, Ciudad A', '1234567890101', '1990-05-15', 'ana@example.com'),
    ('Juan López', 'Masculino', 'Avenida Central, Ciudad B', '2345678901011', '1985-08-23', 'juan@example.com'),
    ('María García', 'Femenino', 'Calle Secundaria, Ciudad C', '3456789010112', '1976-12-10', 'maria@example.com'),
    ('Pedro Rodríguez', 'Masculino', 'Paseo Peatonal, Ciudad D', '4567890101123', '1995-02-28', 'pedro@example.com'),
    ('Luisa Pérez', 'Femenino', 'Bulevar Principal, Ciudad E', '5678901011234', '1988-07-07', 'luisa@example.com'),
    ('Carlos Sánchez', 'Masculino', 'Avenida Principal, Ciudad F', '6789010112345', '1979-09-03', 'carlos@example.com'),
    ('Laura Hernández', 'Femenino', 'Calle Principal, Ciudad G', '7890101123456', '1992-04-19', 'laura@example.com'),
    ('Miguel González', 'Masculino', 'Avenida Central, Ciudad H', '8901011234567', '1983-11-26', 'miguel@example.com'),
    ('Sofía Díaz', 'Femenino', 'Calle Secundaria, Ciudad I', '9010112345678', '1998-08-14', 'sofia@example.com'),
    ('Daniel Vargas', 'Masculino', 'Paseo Peatonal, Ciudad J', '0101123456789', '1972-03-30', 'daniel@example.com'),
    ('Paola Ramírez', 'Femenino', 'Bulevar Principal, Ciudad K', '1011234567890', '1987-06-25', 'paola@example.com'),
    ('Jorge Martínez', 'Masculino', 'Avenida Principal, Ciudad L', '1112345678901', '1993-09-17', 'jorge@example.com'),
    ('Verónica Castro', 'Femenino', 'Calle Principal, Ciudad M', '1223456789012', '1980-12-03', 'veronica@example.com'),
    ('Ricardo Ruiz', 'Masculino', 'Avenida Central, Ciudad N', '2334567890123', '1975-05-08', 'ricardo@example.com'),
    ('Gabriela Sosa', 'Femenino', 'Calle Secundaria, Ciudad O', '3445678901234', '1990-02-12', 'gabriela@example.com');

-- Insertar información ficticia en otras tablas relacionadas
-- Para simplificar, se asignará información ficticia de manera aleatoria.

-- Contacto Médico
INSERT INTO Contacto_Medico (carne, telefono, correo, nombre_medico, id_paciente)
VALUES
    ('CM123', '555-1234', 'doctor1@example.com', 'Dr. González', 1),
    ('CM456', '555-5678', 'doctor2@example.com', 'Dra. Ramírez', 2),
    ('CM789', '555-9012', 'doctor3@example.com', 'Dr. Pérez', 3),
    ('CM012', '555-3456', 'doctor4@example.com', 'Dra. García', 4),
    ('CM345', '555-7890', 'doctor5@example.com', 'Dr. Martínez', 5),
    ('CM678', '555-2345', 'doctor6@example.com', 'Dra. López', 6),
    ('CM901', '555-6789', 'doctor7@example.com', 'Dr. Sánchez', 7),
    ('CM234', '555-0123', 'doctor8@example.com', 'Dra. Hernández', 8),
    ('CM567', '555-4567', 'doctor9@example.com', 'Dr. Vargas', 9),
    ('CM890', '555-7890', 'doctor10@example.com', 'Dra. Díaz', 10),
    ('CM123', '555-1234', 'doctor11@example.com', 'Dr. Ruiz', 11),
    ('CM456', '555-5678', 'doctor12@example.com', 'Dra. Castro', 12),
    ('CM789', '555-9012', 'doctor13@example.com', 'Dr. Ramírez', 13),
    ('CM012', '555-3456', 'doctor14@example.com', 'Dra. Martínez', 14),
    ('CM345', '555-7890', 'doctor15@example.com', 'Dr. Sosa', 15);

INSERT INTO Historial_Clinico (enfermedades, alergias, cirugias, inmunizaciones, medicamentos, resultados_examenes, id_paciente)
VALUES
    ('Hipertensión', 'Penicilina', 'Apéndice', 'Vacuna contra la influenza', 'Ibuprofeno', 'Exámenes de sangre normales', 1),
    ('Diabetes tipo 2', 'Ninguna', 'Cataratas', 'Vacuna contra el tétanos', 'Metformina', 'Niveles de glucosa elevados', 2),
    ('Asma', 'Ninguna', 'Ninguna', 'Vacuna contra la varicela', 'Albuterol', 'Radiografía de tórax normal', 3),
    ('Artritis reumatoide', 'Ninguna', 'Reemplazo de cadera', 'Vacuna contra el neumococo', 'Prednisona', 'Análisis de líquido sinovial', 4),
    ('Cáncer de mama', 'Ninguna', 'Mastectomía', 'Vacuna contra la hepatitis B', 'Tamoxifeno', 'Biopsia confirmatoria', 5),
    ('Enfermedad renal crónica', 'Ninguna', 'Trasplante renal', 'Vacuna contra la hepatitis A', 'Tacrolimus', 'Función renal normal', 6),
    ('Depresión', 'Ninguna', 'Ninguna', 'Vacuna contra la fiebre amarilla', 'Sertralina', 'Evaluación psicológica normal', 7),
    ('Enfermedad de Parkinson', 'Ninguna', 'Ninguna', 'Vacuna contra la influenza', 'Levodopa', 'Imágenes cerebrales normales', 8),
    ('Gastritis crónica', 'Ninguna', 'Ninguna', 'Vacuna contra el tétanos', 'Omeprazol', 'Endoscopia gástrica normal', 9),
    ('Hipotiroidismo', 'Ninguna', 'Ninguna', 'Vacuna contra la varicela', 'Levotiroxina', 'Niveles de hormona tiroidea bajos', 10),
    ('Esquizofrenia', 'Ninguna', 'Ninguna', 'Vacuna contra la hepatitis B', 'Clozapina', 'Evaluación psiquiátrica normal', 11),
    ('EPOC', 'Ninguna', 'Ninguna', 'Vacuna contra la influenza', 'Salbutamol', 'Pruebas de función pulmonar anormales', 12),
    ('Síndrome del intestino irritable', 'Ninguna', 'Ninguna', 'Vacuna contra el neumococo', 'Loperamida', 'Colonoscopia normal', 13),
    ('Hipotiroidismo', 'Ninguna', 'Ninguna', 'Vacuna contra la hepatitis A', 'Levotiroxina', 'Niveles de hormona tiroidea bajos', 14),
    ('Hipertensión', 'Ninguna', 'Ninguna', 'Vacuna contra la fiebre amarilla', 'Losartán', 'Presión arterial elevada', 15);

-- Seguro Médico
INSERT INTO Seguro_Medico (compania_seguros, no_poliza, reclamaciones, informacion_relevante, id_paciente)
VALUES
    ('Seguros Médicos ABC', 'SM123456', 'Ninguna', 'Ninguna', 1),
    ('Seguros XYZ', 'SM987654', 'Ninguna', 'Ninguna', 2),
    ('Seguros de Salud DEF', 'SM135792', 'Ninguna', 'Ninguna', 3),
    ('Seguros GHI', 'SM246801', 'Ninguna', 'Ninguna', 4),
    ('Seguros JKL', 'SM987654', 'Ninguna', 'Ninguna', 5),
    ('Seguros MNO', 'SM012345', 'Ninguna', 'Ninguna', 6),
    ('Seguros de Vida PQR', 'SM987654', 'Ninguna', 'Ninguna', 7),
    ('Seguros STU', 'SM123456', 'Ninguna', 'Ninguna', 8),
    ('Seguros de Salud VWX', 'SM098765', 'Ninguna', 'Ninguna', 9),
    ('Seguros YZA', 'SM135792', 'Ninguna', 'Ninguna', 10),
    ('Seguros BCD', 'SM246801', 'Ninguna', 'Ninguna', 11),
    ('Seguros EFG', 'SM987654', 'Ninguna', 'Ninguna', 12),
    ('Seguros HIJ', 'SM012345', 'Ninguna', 'Ninguna', 13),
    ('Seguros KLM', 'SM987654', 'Ninguna', 'Ninguna', 14),
    ('Seguros de Vida NOP', 'SM123456', 'Ninguna', 'Ninguna', 15);


INSERT INTO Analisis (tipo_analisis, fecha_realizacion, resultados, monto, id_paciente, id_laboratorio, estado, fecha_inicio, fecha_fin, ultima_fecha_venta)
VALUES
    ('Análisis de sangre', '2023-01-05', 'Valores dentro de los rangos normales', 150.00, 1, 1, 'completado', '2023-01-01', '2023-12-31', '2023-01-05'),
    ('Radiografía de tórax', '2023-02-10', 'Sin anormalidades detectadas', 200.00, 2, 2, 'no completado', '2023-01-01', '2023-12-31', '2023-02-10'),
    ('Tomografía computarizada', '2023-03-15', 'Presencia de lesiones en el pulmón izquierdo', 300.00, 3, 3, 'completado', '2023-01-01', '2023-12-31', '2023-03-15'),
    ('Resonancia magnética', '2023-04-20', 'Evidencia de deterioro en las articulaciones', 400.00, 4, 4, 'no completado', '2023-01-01', '2023-12-31', '2023-04-20'),
    ('Ecografía abdominal', '2023-05-25', 'Presencia de cálculos biliares', 250.00, 5, 5, 'completado', '2023-01-01', '2023-12-31', '2023-05-25'),
    ('Electrocardiograma', '2023-06-30', 'Ritmo cardíaco regular', 180.00, 6, 6, 'no completado', '2023-01-01', '2023-12-31', '2023-06-30'),
    ('Colonoscopia', '2023-07-05', 'Presencia de pólipos benignos', 350.00, 7, 7, 'completado', '2023-01-01', '2023-12-31', '2023-07-05'),
    ('Mamografía', '2023-08-10', 'Nódulos mamarios benignos', 220.00, 8, 8, 'no completado', '2023-01-01', '2023-12-31', '2023-08-10'),
    ('Análisis de orina', '2023-09-15', 'Presencia de proteínas en la orina', 120.00, 9, 9, 'completado', '2023-01-01', '2023-12-31', '2023-09-15'),
    ('Hemograma completo', '2023-10-20', 'Recuento de células sanguíneas normal', 170.00, 10, 10, 'no completado', '2023-01-01', '2023-12-31', '2023-10-20'),
    ('Biopsia de piel', '2023-11-25', 'Células cutáneas normales', 280.00, 11, 11, 'completado', '2023-01-01', '2023-12-31', '2023-11-25'),
    ('Papanicolaou', '2023-12-30', 'Células cervicales normales', 190.00, 12, 12, 'no completado', '2023-01-01', '2023-12-31', '2023-12-30'),
    ('Prueba de glucosa en sangre', '2024-01-05', 'Niveles de glucosa elevados', 160.00, 13, 13, 'completado', '2023-01-01', '2023-12-31', '2024-01-05'),
    ('Análisis de líquido cefalorraquídeo', '2024-02-10', 'Presencia de células inflamatorias', 370.00, 14, 14, 'no completado', '2023-01-01', '2023-12-31', '2024-02-10'),
    ('Prueba de función renal', '2024-03-15', 'Función renal dentro de los límites normales', 250.00, 15, 15, 'completado', '2023-01-01', '2023-12-31', '2024-03-15');



-- Laboratorios
INSERT INTO Laboratorios (nombre_clinica, direccion_clinica, telefono_clinica, responsable, nombre_encargado, tipo_laboratorio)
VALUES
    ('Laboratorio Médico ABC', 'Calle Principal 123, Ciudad A', '555-1234', 'Dr. López', 'María Rodríguez', 'Laboratorio clínico'),
    ('Centro de Imágenes XYZ', 'Avenida Central 456, Ciudad B', '555-5678', 'Dra. Martínez', 'Carlos Pérez', 'Centro de diagnóstico por imágenes'),
    ('Clínica Diagnóstico DEF', 'Calle Secundaria 789, Ciudad C', '555-9012', 'Dr. Sánchez', 'Laura Gómez', 'Centro de diagnóstico médico'),
    ('Laboratorio Clínico GHI', 'Paseo Peatonal 1011, Ciudad D', '555-3456', 'Dra. García', 'Miguel Torres', 'Laboratorio de análisis clínicos'),
    ('Centro de Imágenes JKL', 'Bulevar Principal 1213, Ciudad E', '555-7890', 'Dr. González', 'Sofía López', 'Centro de diagnóstico por imágenes'),
    ('Clínica de Análisis MNO', 'Avenida Principal 1415, Ciudad F', '555-2345', 'Dra. Ramírez', 'Daniel García', 'Laboratorio de análisis médicos'),
    ('Laboratorio Biomédico PQR', 'Calle Principal 1617, Ciudad G', '555-6789', 'Dr. Pérez', 'Paola Martínez', 'Centro de análisis biológicos'),
    ('Centro de Diagnóstico STU', 'Avenida Central 1819, Ciudad H', '555-0123', 'Dra. Hernández', 'Jorge González', 'Centro de diagnóstico clínico'),
    ('Laboratorio de Investigación VWX', 'Calle Secundaria789, Ciudad I', '555-4567', 'Dra. Díaz', 'Verónica Castro', 'Laboratorio de investigación biomédica'),
    ('Centro de Diagnóstico YZA', 'Paseo Peatonal 2021, Ciudad J', '555-8901', 'Dr. Vargas', 'Ricardo Ruiz', 'Centro de diagnóstico clínico'),
    ('Laboratorio Clínico BCD', 'Bulevar Principal 2223, Ciudad K', '555-2345', 'Dra. Castro', 'Gabriela Sosa', 'Laboratorio de análisis clínicos'),
    ('Centro de Imágenes EFG', 'Calle Principal 2425, Ciudad L', '555-6789', 'Dr. Ramírez', 'Ana Martínez', 'Centro de diagnóstico por imágenes'),
    ('Clínica de Análisis HIJ', 'Avenida Central 2627, Ciudad M', '555-0123', 'Dra. Martínez', 'Juan López', 'Laboratorio de análisis médicos'),
    ('Laboratorio Médico KLM', 'Calle Secundaria 2829, Ciudad N', '555-4567', 'Dr. Sosa', 'María García', 'Laboratorio clínico'),
    ('Centro de Imágenes NOP', 'Paseo Peatonal 3031, Ciudad O', '555-8901', 'Dra. Ramírez', 'Pedro Rodríguez', 'Centro de diagnóstico por imágenes');
   
   -- Insertar datos ficticios en la tabla Factura
INSERT INTO Factura (nit, total, id_paciente, id_seguro)
VALUES
    ('123456789', 150.00, 1, NULL),
    ('987654321', 200.00, 2, 1),
    ('135792468', 300.00, 3, NULL),
    ('246801357', 400.00, 4, 2),
    ('987654321', 250.00, 5, NULL),
    ('123456789', 180.00, 6, 3),
    ('987654321', 220.00, 7, NULL),
    ('135792468', 350.00, 8, 4),
    ('246801357', 120.00, 9, NULL),
    ('987654321', 170.00, 10, 5),
    ('123456789', 280.00, 11, 1),
    ('987654321', 190.00, 12, NULL),
    ('135792468', 160.00, 13, 2),
    ('246801357', 370.00, 14, NULL),
    ('987654321', 250.00, 15, 3);

   
   --A
   SELECT *
FROM Analisis
WHERE EXTRACT(MONTH FROM fecha_realizacion) = 1;
--B
SELECT tipo_analisis, COUNT(*) AS veces_contratado
FROM Analisis
GROUP BY tipo_analisis;

--C
SELECT *
FROM Analisis
WHERE estado != 'completado';
--D
SELECT a.tipo_analisis, l.responsable
FROM Analisis a
JOIN Laboratorios l ON a.id_laboratorio = l.id_laboratorio;
--E
SELECT l.nombre_clinica, a.tipo_analisis, COUNT(*) AS veces_contratado
FROM Analisis a
JOIN Laboratorios l ON a.id_laboratorio = l.id_laboratorio
GROUP BY l.nombre_clinica, a.tipo_analisis
ORDER BY COUNT(*) DESC
LIMIT 1;
--F
SELECT SUM(monto) AS monto_total
FROM Analisis
WHERE estado = 'completado' 
  AND fecha_realizacion BETWEEN '2023-01-01'AND '2023-12-31'
  AND id_paciente = 1;

--G
SELECT EXTRACT(MONTH FROM fecha_realizacion) AS mes, COUNT(*) AS cantidad_servicios_completados
FROM Analisis
WHERE estado = 'completado'
GROUP BY EXTRACT(MONTH FROM fecha_realizacion);
--H
SELECT SUM(CASE WHEN id_seguro IS NULL THEN total ELSE 0 END) AS monto_pagado_cliente,
       SUM(CASE WHEN id_seguro IS NOT NULL THEN total ELSE 0 END) AS monto_pagado_seguro
FROM Factura;
--I
SELECT (SUM(CASE WHEN id_seguro IS NULL THEN total ELSE 0 END) / SUM(total)) * 100 AS porcentaje_pagado_cliente,
       (SUM(CASE WHEN id_seguro IS NOT NULL THEN total ELSE 0 END) / SUM(total)) * 100 AS porcentaje_pagado_seguro
FROM Factura
WHERE id_paciente IN (
    SELECT id_paciente
    FROM Analisis
    WHERE fecha_realizacion BETWEEN '2023-01-01' AND '2023-12-31'
);
--J
SELECT p.nombre, a.fecha_realizacion, a.monto, 
       CASE WHEN cm.nombre_medico IS NOT NULL THEN 'Referido por médico' ELSE 'No referido por médico' END AS referencia_medica
FROM Analisis a
JOIN Paciente p ON a.id_paciente = p.id_paciente
LEFT JOIN Contacto_Medico cm ON p.id_paciente = cm.id_paciente;
--K
UPDATE Analisis
SET monto = monto * 1.02;
--L
UPDATE Analisis
SET tipo_analisis = UPPER(tipo_analisis);
--M
UPDATE Analisis
SET estado = 'inactivo'
WHERE id_analisis = 1;


--N
SELECT MAX(fecha_realizacion) AS ultima_fecha_venta
FROM Analisis
WHERE tipo_analisis = tipo_analisis ;

--O
SELECT tipo_analisis, MAX(fecha_inicio  - fecha_fin) AS tiempo_tardado
FROM Analisis
GROUP BY tipo_analisis;

--P
SELECT cm.nombre_medico, COUNT(*) AS cantidad_referidos
FROM Contacto_Medico cm
GROUP BY cm.nombre_medico
ORDER BY COUNT(*) DESC
LIMIT 1;

--Q
SELECT sm.compania_seguros, COUNT(*) AS veces_utilizado
FROM Seguro_Medico sm
GROUP BY sm.compania_seguros
ORDER BY COUNT(*) DESC
LIMIT 1;

--para eliminar tablas
DROP TABLE  analisis, contacto_medico, factura, historial_clinico, laboratorios, paciente, paciente_contacto_medico, seguro_medico ;
