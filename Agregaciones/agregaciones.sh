-Agrupación y conteo de documentos por un campo específico;
db.collection.aggregate([
    { $group: { _id: "$field", count: { $sum: 1 } } }
]);

Agrupación y sumarización de valores:;
db.collection.aggregate([
    { $group: { _id: "$field", total: { $sum: "$value" } } }
]);

Filtrado antes de la agregación:;
db.collection.aggregate([
    { $match: { field: "value" } },
    { $group: { _id: "$anotherField", count: { $sum: 1 } } }
]);

Ordenamiento de resultados de agregación:;
db.collection.aggregate([
    { $group: { _id: "$field", count: { $sum: 1 } } },
    { $sort: { count: -1 } }
]);

Proyección de campos en la salida:;
db.collection.aggregate([
    { $group: { _id: "$field", count: { $sum: 1 } } },
    { $project: { _id: 0, field: "$_id", count: 1 } }
]);

-agregación match y project ;
[
{
$match:
{
editorial: "Biblio",
},
},
{
$project:
{
id: 0, 
titulo:
1, 
precio: 1,
NombreEditorial: "$editorial",
},
},
];

-agregación group sort;

[{
$group:
{
_id: "$editorial",
"Numero l
Documentos": {
$count: {},
},
},
$sort:
{
"Numero Documentos": 1,
},
},
];

-Match y project sort;
[{
Smatch:
{
editorial: “Biblio”,
},
},
{
$project:
{

_id: 0, titulo:
1,
precio: 1,
cantidad: 1,
"Nombre Editorial": "$editorial",
"Total Ganancia": {
$multiply: ["$precio", "$cantidad"],
},
},
},
{
$sort:
{
precio: 1,
},
},
];

-maximun group;
[{
$group:
{
_id: "$editorial",
"Numero de Documentos:": {
$count: {},
},
media: {
$avg: "$precio",
｝，
"Precio Maximo": {
$max: "$precio",
},
},
},
{
$sort:
{
"Precio Maximo": 1,
},
},
];

-set out;
[{
$group:
{
_id: "$editorial",
Numero:{
$count: {},
},
media: {
$avg: "$precio",
｝，
},
},
{
$set:
{
“Media Total”: {
$trunc: [“$media”, 2],
},
},
},
{
$out: “Media_Editoriales”,
},
];

-set unset;
[{
$group:
{
_id: "$editorial",
Numero:{
$count: {},
},
media: {
$avg: "$precio",
｝，
},
},
{
$set:
{
“Media Total”: {
$trunc: [“$media”, 2],
},
},
},
{
$unset: “media”,
},
];