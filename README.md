# Casa de Pepe y Julián

Pepe y Julián viven juntos, y les gusta comprar cosas. 
De cada cosa nos interesa el precio, si es comida o no, y si es un electrodoméstico o no.

## Sobre las cosas que se compran
En este modelo reducido, vamos a considerar las siguientes cosas que podrían ser interesantes para comprar: una heladera que vale 200000 pesos, una cama que sale 80000, una tira de asado que sale 3500 pesos, un paquete de fideos que sale 500 pesos, y una plancha que vale 12000 pesos. Por las dudas aclaramos: la cama no es un electrodoméstico, la plancha sí.

Implementar, además de los objetos que representan cada cosa, un objeto que represente a la casa, que entienda los siguientes mensajes:
- `comprar(cosa)`: registra que se ha comprado una cosa.
- `cantidadDeCosasCompradas()`: indica ... eso.
- `tieneComida()`: indica si compró algo que es comida al menos una vez.
- `vieneDeEquiparse()`: indica si la _última_ cosa que se compró es un electrodoméstico, o bien vale más de 50000 pesos.
- `esDerrochona()`: indica si el importe total de las cosas compradas es de 90000 pesos o más.
- `compraMasCara()`: retorna la cosa comprada de mayor valor.
- `electrodomésticosComprados()`: devuelve un objeto que contiene todas las cosas compradas que son electrodomésticos. 
- `malaEpoca()`: indica si todas las cosas compradas son comida.
- `queFaltaComprar(lista)`: recibe una lista de cosas y devuelve las cosas de esa lista que aún no se han comprado. <br>
  **Atención**: es una pregunta. No se pide que se compren. 
- `faltaComida()`: indica si se han comprado menos de 2 cosas que son comida.


## Más cosas
Agregar las siguientes cosas que pueden comprarse:
- un kilo de milanesas rebozadas: 2600 pesos.
- una botella de salsa de tomates: 900 pesos.
- un microondas: 42000 pesos.
- un kilo de cebollas: 250 pesos.
- una compu: 500 dólares. Para saber el precio en pesos, multiplicar por la cotización del dólar. Agregar un objeto `dolar` al que se le pueda preguntar el `precioDeVenta()`, alcanza con que devuelva un valor fijo. 
- un "pack comida" que incluye un plato (que puede ser tira de asado, fideos o milanesas) y un aderezo (que puede ser la botella de salsa de tomates o el kilo de cebollas. Precio: la suma del precio de sus componentes.

**Pregunta**  
para lograr que la casa pueda comprar estas cosas nuevas, ¿qué hubo que cambiar en la definición del objeto que representa la casa? Si hay que tocar poco, o nada, ¿qué concepto nos ayuda?


## Cuenta bancaria
Agreguemos al modelo objetos que representan diferentes _cuentas bancarias_. Estos objetos deben entender tres mensajes: `depositar(importe)`, `extraer(importe)`, y `saldo()`. 
Al objeto que representa la casa hay que agregarle un atributo, que es la cuenta que se va a usar para pagar los gastos que se hagan. Por lo tanto, al comprar una cosa, hay que también extraer de la cuenta el precio de la cosa comprada.     


Incluir tres cuentas:
1. una **cuenta corriente**, tiene un atributo que es el saldo, al depositar suma al saldo, al extraer resta.
1. una **cuenta con gastos**, también mantiene un saldo. Al depositar suma el importe indicado menos 200 pesos que son gastos de la operación. P.ej. si deposito 10000 pesos, el saldo aumenta en 9800. Al extraer, si se extraen 10000 pesos o menos hay un cargo de 200 pesos, si se extrae más de ese valor, la comisión es el 2% del importe a extraer. Entonces, si se extraen 5000 pesos, hay que restar 5200 del saldo, y si se extraen 20000, hay que restar 20400 (20000 más 400 que es el 2% de gastos de comisión).
1. una **cuenta combinada** que tiene dos cuentas, una _primaria_ y una _secundaria_. Si se deposita, el importe pasa a la primaria. Si se extrae es así: si la cuenta primaria tiene saldo suficiente se extrae de esa, y si no de la secundaria (vale suponer que la secundaria siempre tiene saldo). El saldo de la combinada es la suma del saldo de las dos. <br>
P.ej. supongamos que configuramos la cuenta combinada así: la primaria es la cuenta corriente, la secundaria es la cuenta con gastos. Supongamos también que la cuenta corriente tiene 30000 pesos y la cuenta con gastos tiene 2000000. Así las cosas:
	- El _saldo_ de la cuenta combinada es 2030000 pesos.
	- Si se _depositan_ 10000 pesos en la cuenta combinada, van a la cuenta corriente (porque es la primaria), al depositarse este importe, su saldo pasa a 40000. 
	- Si se _extraen_ 5000 pesos, salen de la cuenta corriente que es la primaria. Si se extraen 100000, salen de la cuenta con gastos, porque el saldo de la cuenta corriente no es suficiente.
	- **Desafío**: quién se anime a más, resolver la extracción de pesos restando el valor posible de la cuenta _primaria_ y el resto de la cuenta _secundaria_, considerando que la _primaria_ nunca pueda tener un saldo menor a 0 (cero). 

Agregar en la casa los métodos `gastar(importe)`, que hace la extracción de la cuenta que esté usando, y `dineroDisponible()`, que es el saldo de la cuenta. 
Modificar el método `comprar(cosa)` para que además de lo que esté haciendo, registre el gasto por el precio de la cosa que se está comprando. P.ej. comprar la tira de asado implica gastar 3500 pesos.

