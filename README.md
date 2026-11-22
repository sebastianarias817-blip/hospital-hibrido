# Ecosistema hibrido hospitalario (PostgreSQL + MongoDB)

Curso: Bases de Datos II - Unidad 3
Integrantes: Sebastian Arias Saldarriaga

## Arquitectura
- PostgreSQL (ACID): paciente, medico, hospitalizacion.
- MongoDB (BASE): telemetria de wearables.
- Vinculo: id_paciente (PostgreSQL) = paciente_id (MongoDB).

## Como ejecutar
PostgreSQL (carpeta sql, en orden): 01_crear_tablas, 02_poblar, 03_ingesta_masiva, 04_consulta_A, 06_indice, 05_consulta_B_join.
MongoDB (carpeta nosql, en orden): 01_ingesta.js, 02_consulta_A.js, 03_indice.js, 04_flexibilidad.js.

## Resultados
| Operacion | PostgreSQL | MongoDB |
|---|---|---|
| Ingesta 100k | 799 ms | 825 ms |
| Consulta A sin indice | 6.7 ms | 122 ms |
| Consulta A con indice | 0.38 ms | 6 ms |
| JOIN | 0.445 ms | No aplica |
