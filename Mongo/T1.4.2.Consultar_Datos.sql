# Conteo de casos
db.casos.count()

# Conteo de personas agrupadas por sexo
db.casos.find({ sexo:"F" }).count()
db.casos.find({ sexo:"M" }).count()

# Conteo de personas por ubicación
db.casos.aggregate([{"$group": {"_id":"$ciudad_municipio_nom", "count": {"$sum":1}}}])

# Conteo de enfermos, recuperados y fallecidos
db.casos.aggregate([{"$group": {"_id":"$recuperado", "count": {"$sum":1}}}])

# Casos por dia
db.casos.aggregate([{$group: {"_id": "$fecha_reporte","count": {"$sum":1}}}])

# Dia con más casos
db.casos.aggregate([{$group: {"_id": "$fecha_reporte","count": {"$sum":1}}}, { $sort:{ "count":-1 }}, {$limit:1}])

# Día con menos casos
db.casos.aggregate([{$group: {"_id": "$fecha_reporte","count": {"$sum":1}}}, { $sort:{ "count":+1 }}, {$limit:1}])

# Ciudad con mas casos
db.casos.aggregate([{$group: {"_id": "$departamento_nom","count": {"$sum":1}}}, { $sort:{ "count":-1 }}, {$limit:1}])

# Ciudad con menos casos
db.casos.aggregate([{$group: {"_id": "$departamento_nom","count": {"$sum":1}}}, { $sort:{ "count":+1 }}, {$limit:1}])

# Pais con máximo numero de exporte de casos
db.casos.aggregate([{$group: {"_id": "$pais_viajo_1_nom","count": {"$sum":1}}}, { $sort:{ "count":-1 }}, {$limit:1}])

# Pais con Minimo numero de exporte de casos
db.casos.aggregate([{$group: {"_id": "$pais_viajo_1_nom","count": {"$sum":1}}}, { $sort:{ "count":+1 }}, {$limit:1}])

# Promedio de edad por departamento
db.casos.aggregate([{$group:{ _id: "$departamento_nom", avgAge: { $avg: "$edad" }}}])