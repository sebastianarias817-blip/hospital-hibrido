INSERT INTO telemetria_pg (id_paciente, fecha, frecuencia_cardiaca, spo2, temperatura)
SELECT 1 + (random()*999)::int, NOW() - (random()*30 || ' days')::interval,
       60 + (random()*60)::int, 88 + (random()*12)::int, 35.5 + (random()*3)::numeric(3,1)
FROM generate_series(1,100000);