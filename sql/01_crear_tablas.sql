CREATE TABLE paciente (
  id_paciente SERIAL PRIMARY KEY,
  documento VARCHAR(15) UNIQUE NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE,
  eps VARCHAR(50)
);
CREATE TABLE medico (
  id_medico SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  especialidad VARCHAR(60)
);
CREATE TABLE hospitalizacion (
  id_hosp SERIAL PRIMARY KEY,
  id_paciente INT NOT NULL REFERENCES paciente(id_paciente),
  id_medico INT NOT NULL REFERENCES medico(id_medico),
  fecha_ingreso TIMESTAMP NOT NULL,
  fecha_egreso TIMESTAMP,
  cama VARCHAR(10),
  diagnostico VARCHAR(150)
);
CREATE TABLE telemetria_pg (
  id BIGSERIAL PRIMARY KEY,
  id_paciente INT REFERENCES paciente(id_paciente),
  fecha TIMESTAMP,
  frecuencia_cardiaca INT,
  spo2 INT,
  temperatura NUMERIC(4,1)
);