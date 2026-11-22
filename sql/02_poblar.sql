INSERT INTO paciente (documento, nombre, fecha_nacimiento, eps)
SELECT '10' || LPAD(g::text, 8, '0'), 'Paciente ' || g,
       DATE '1940-01-01' + (random()*25000)::int,
       (ARRAY['Sura','Sanitas','Nueva EPS','Compensar'])[1 + (random()*3)::int]
FROM generate_series(1,1000) g;

INSERT INTO medico (nombre, especialidad)
SELECT 'Dr. ' || g,
       (ARRAY['Cardiología','Medicina Interna','Neumología','Urgencias'])[1 + (random()*3)::int]
FROM generate_series(1,20) g;

INSERT INTO hospitalizacion (id_paciente, id_medico, fecha_ingreso, cama, diagnostico)
SELECT g, 1 + (random()*19)::int, NOW() - (random()*30 || ' days')::interval, 'C' || g,
       (ARRAY['Neumonía','Arritmia','Diabetes','Insuficiencia renal'])[1 + (random()*3)::int]
FROM generate_series(1,1000) g;