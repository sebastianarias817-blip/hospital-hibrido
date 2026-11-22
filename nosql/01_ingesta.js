use("hospital_telemetria");
db.telemetria.drop();
const inicio = Date.now();
for (let lote = 0; lote < 10; lote++) {
  const docs = [];
  for (let i = 0; i < 10000; i++) {
    const d = {
      paciente_id: 1 + Math.floor(Math.random() * 1000),
      dispositivo: ["reloj","parche","oximetro"][Math.floor(Math.random()*3)],
      fecha: new Date(Date.now() - Math.random() * 30 * 86400000),
      signos: {
        fc: 60 + Math.floor(Math.random() * 60),
        spo2: 88 + Math.floor(Math.random() * 12),
        temp: +(35.5 + Math.random() * 3).toFixed(1)
      }
    };
    if (Math.random() < 0.2) d.alerta = "FC elevada";
    if (Math.random() < 0.1) d.signos.presion = { sis: 120, dia: 80 };
    docs.push(d);
  }
  db.telemetria.insertMany(docs);
}
print("Tiempo ingesta Mongo (ms): " + (Date.now() - inicio));
print("Total documentos: " + db.telemetria.countDocuments());