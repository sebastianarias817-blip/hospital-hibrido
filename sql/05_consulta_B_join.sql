EXPLAIN ANALYZE
SELECT p.nombre, m.nombre AS medico, h.diagnostico
FROM hospitalizacion h
JOIN paciente p ON p.id_paciente = h.id_paciente
JOIN medico m ON m.id_medico = h.id_medico
WHERE h.diagnostico = 'Arritmia';