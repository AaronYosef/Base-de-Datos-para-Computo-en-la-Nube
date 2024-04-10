# ***Actividad de Evaluación. Practica de Agregaciones***

# ***Consultas***
## 1. Cuenta los productos de tipo “medio”, usando un método básico
### Código
``` mongosh
db.productos.count({ tipo: "medio" })
```
### Salida
![Imagen 1](https://cinecity.space/Imagenes/Captura1.jpeg)

## 2. Indicar con un distinct, las empresas (fabricantes) que hay en la colección
### Código
``` mongosh
 db.productos.distinct("fabricante")
```
![Imagen 2](https://cinecity.space/Imagenes/Captura2.jpeg)
## 3. Usando aggregate, visualizar los productos que tengan más de 80 unidades
### Código
``` mongosh
db.productos.aggregate([
    { $match: { unidades: { $gt: 80 } } }
])
```
### Salida
![Imagen 3](https://cinecity.space/Imagenes/Captura3.jpeg)

## 4. Con $project visualizar solo el nombre, unidades y precio de los productos que tengan menos de 10 unidades.
### Código
``` mongosh
db.productos.aggregate([
    { $match: { unidades: { $lt: 10 } } },
    { $project: { nombre: 1, unidades: 1, precio: 1, _id: 0 } }
])
```
### Salida
![Imagen 4](https://cinecity.space/Imagenes/Captura4.jpeg)

## 5. Con $project ponemos el fabricante, pero le cambiamos el nombre por “empresa”.
### Código
``` mongosh
db.productos.aggregate([
    { $match: { unidades: { $lt: 10 } } },
    { $project: { nombre: 1, unidades: 1, precio: 1, empresa: "$fabricante", _id: 0 } }
])
```
### Salida
![Imagen 5](https://cinecity.space/Imagenes/Captura5.jpeg)

## 6. Añadir a la consulta anterior un campo calculado que se llame total y que multiplique precio por unidades.
### Código
``` mongosh
db.productos.aggregate([
    { $match: { unidades: { $lt: 10 } } },
    { $project: { nombre: 1, unidades: 1, precio: 1, empresa: "$fabricante", total: { $multiply: ["$precio", "$unidades"] }, _id: 0 } }
])
```
### Salida
![Imagen 6](https://cinecity.space/Imagenes/Captura6.jpeg)

## 7. Hacer que el nombre salga en mayúsculas con el operador $toUpper.
### Código
``` mongosh
db.productos.aggregate([
    { $project: { nombre_en_mayusculas: { $toUpper: "$nombre" } } }
])
```
### Salida
![Imagen 7](https://cinecity.space/Imagenes/Captura7.jpeg)

## 8. Añadir un campo calculado que ponga el nombre del producto y el tipo concatenado con el operador $concat. Le llamamos al campo “completo”.
### Código
``` mongosh
db.productos.aggregate([
    { $project: { completo: { $concat: ["$nombre", " - ", "$tipo"] } } }
])
```
### Salida
![Imagen 8](https://cinecity.space/Imagenes/Captura8.jpeg)

## 9. Ordena el resultado por el campo “total”.
### Código
``` mongosh
db.productos.aggregate([
    { $sort: { total: 1 } }
])
```
### Salida
![Imagen 9](https://cinecity.space/Imagenes/Captura9.jpeg)

## 10. Haciendo una nueva consulta, averiguar el numero de productos por tipo de producto.
### Código
``` mongosh
db.productos.aggregate([
    { $group: { _id: "$tipo", count: { $sum: 1 } } }
])
```
### Salida
![Imagen 10](https://cinecity.space/Imagenes/Captura10.jpeg)

## 11. Añadir el valor mayor y el menor.
### Código
``` mongosh
db.productos.aggregate([
    { $group: { _id: null, max_precio: { $max: "$precio" }, min_precio: { $min: "$precio" } } }
])
```
### Salida
![Imagen 11](https://cinecity.space/Imagenes/Captura11.jpeg)

## 12. Añade el total de unidades por cada tipo.
### Código
``` mongosh
db.productos.aggregate([
    { $group: { _id: "$tipo", total_unidades: { $sum: "$unidades" } } }
])
```
### Salida
![Imagen 12](https://cinecity.space/Imagenes/Captura12.jpeg)

## 13. Con el operador $set y el operador “$substr” visualiza todos los datos del producto "Small Metal Tuna" y los primeros 5 caracteres del nombre.
### Código
``` mongosh
db.productos.aggregate([
    { $match: { nombre: "Small Metal Tuna" } },
    { $project: { datos_producto: "$$ROOT", primeros_5_caracteres_nombre: { $substr: ["$nombre", 0, 5] } } }
])
```
### Salida
![Imagen 13](https://cinecity.space/Imagenes/Captura13.jpeg)

## 14. Creamos una salida que tenga el nombre del articulo y el total (precio por unidades) y lo guardamos en una colección denominada productos2.
### Código
``` mongosh
db.productos.aggregate([
    { $project: { nombre: 1, total: { $multiply: ["$precio", "$unidades"] } } },
    { $out: "productos2" }
])
```
### Salida
![Imagen 14](https://cinecity.space/Imagenes/Captura14.jpeg)

## 15. Creamos una salida que tenga el nombre del articulo y el total (precio por unidades) y lo guardamos en una colección denominada productos2.
### Código
``` mongosh
db.productos.aggregate([
    { $project: { nombre: 1, total: { $multiply: ["$precio", "$unidades"] } } },
    { $out: "productos2" }
])
```
### Salida
![Imagen 15](https://cinecity.space/Imagenes/Captura15.jpeg)

## 16. Comprobamos que se ha creado.
## 17. Hacemos un find para comprobar el resultado.
### Código
``` mongosh
db.productos2.find()
```
### Salida
![Imagen 16](https://cinecity.space/Imagenes/Captura16.jpeg)