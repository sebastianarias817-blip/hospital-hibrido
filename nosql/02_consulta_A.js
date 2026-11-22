use("hospital_telemetria");
const r = db.telemetria.explain("executionStats").aggregate([
  { $match: { paciente_id: 10 } },
  { $group: { _id: "$paciente_id", promedio_fc: { $avg: "$signos.fc" } } }
]);
const stats = r.stages ? r.stages[0].$cursor.executionStats : r.executionStats;
print("executionTimeMillis: " + stats.executionTimeMillis);
print("Documentos examinados: " + stats.totalDocsExamined);