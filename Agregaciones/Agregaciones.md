# ***Agregación Match y Project***
## Este conjunto de comandos realiza una agregación en la colección, primero filtrando los documentos con la editorial "Biblio" y luego proyectando solo los campos específicos.
* $match:
    * Filtra los documentos con la editorial "Biblio".
* $project:
    * Proyecta los campos especificados, omitiendo el campo "id" y mostrando el título, el precio y el nombre de la editorial.
´´´
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
´´´
# ***Agregación Group Sort***
## Este conjunto de comandos realiza una agregación en la colección, agrupando por editorial y contando el número de documentos, luego ordenando por el número de documentos de manera ascendente.
* $group:
    * Agrupa los documentos por editorial y cuenta el número de documentos.
* $sort:
    * Ordena los resultados por el número de documentos en orden ascendente.

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

# ***Match, Project y Sort***
## Este conjunto de comandos realiza una agregación en la colección, primero filtrando los documentos con la editorial "Biblio", luego proyectando campos específicos y calculando la ganancia total por documento, y finalmente ordenando por el precio de manera ascendente.
* $match:
    * Filtra los documentos con la editorial "Biblio".
* $project:
    * Proyecta los campos especificados y calcula la ganancia total.
* $sort:
    * Ordena los resultados por el precio en orden ascendente.

[
  {
    $match: {
      editorial: "Biblio"
    }
  },
  {
    $project: {
      _id: 0,
      titulo: 1,
      precio: 1,
      cantidad: 1,
      "Nombre Editorial": "$editorial",
      "Total Ganancia": {
        $multiply: ["$precio", "$cantidad"]
      }
    }
  },
  {
    $sort: {
      precio: 1
    }
  }
]

# ***Maximum Group***
## Este conjunto de comandos realiza una agregación en la colección, agrupando por editorial y calculando el número de documentos, el precio promedio y el precio máximo, luego ordena por el precio máximo de manera ascendente.
* $group:
    * Agrupa los documentos por editorial y calcula el número de documentos, el precio promedio y el precio máximo.
* $sort:
    * Ordena los resultados por el precio máximo en orden ascendente.

[
  {
    $group: {
      _id: "$editorial",
      "Numero de Documentos": {
        $count: {}
      },
      media: {
        $avg: "$precio"
      },
      "Precio Maximo": {
        $max: "$precio"
      }
    }
  },
  {
    $sort: {
      "Precio Maximo": 1
    }
  }
]

# ***Set Out***
## Este conjunto de comandos realiza una agregación en la colección, agrupando por editorial y calculando el número de documentos y el precio promedio, luego redondea la media y guarda los resultados en una nueva colección llamada "Media_Editoriales".
* $set:
    * Redondea la media a dos decimales.
* $out:
    * Guarda los resultados en una nueva colección llamada "Media_Editoriales".

[
  {
    $group: {
      _id: "$editorial",
      Numero: {
        $count: {}
      },
      media: {
        $avg: "$precio"
      }
    }
  },
  {
    $set: {
      "Media Total": {
        $trunc: ["$media", 2]
      }
    }
  },
  {
    $out: "Media_Editoriales"
  }
]

# ***Set Unset***
## Este conjunto de comandos realiza una agregación en la colección, agrupando por editorial y calculando el número de documentos y el precio promedio, luego elimina el campo "media" del resultado final.
* $unset:
    * Elimina el campo "media" del resultado final.

[
  {
    $group: {
      _id: "$editorial",
      Numero: {
        $count: {}
      },
      media: {
        $avg: "$precio"
      }
    }
  },
  {
    $set: {
      "Media Total": {
        $trunc: ["$media", 2]
      }
    }
  },
  {
    $unset: "media"
  }
]
