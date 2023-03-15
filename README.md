# JAguero_IGrane_MGonzales-Digital_Desing_Workshop-2023

A continuación se presentan 3 ejercicios prácticos, los cuales debe resolver de manera completa. En cada ejercicio muestre en la bitácora todos las pasos de diseño que llevan a la solución del problema.

### Problema 1
1. Diseñe un decodificador que permita convertir un número de 4 bits en binario a su respectiva representación en BCD (binary-coded decimal), mediante modelo de comportamiento en SystemVerilog.
2. Realice un testbech, en SystemVerilog, en el que se muestre de manera simple el funcionamiento del decodificador. Muestre el resultado de la prueba para al menos 8 valores diferentes.
3. Implemente el decodificador en la FPGA. Utilice los switches (iniciando en el cero) como entrada y un display para 7 segmentos para visualizar el funcionamiento del decodificador.

### Problema 2

1. Diseñne un sumador completo de 4 bits con modelo de estructura en VHDL. Parta del diseño un sumador completo de 1 bit.
2. Realice un testbench para el sumador del punto anterior, en VHDL. Muestre las pruebas para al menos 4 valores diferentes de operandos.
3. Implemente el sumador completo en FPGA. Utilice los switches de las tarjeta para los datos de entrada, así como los display de 7 segmentos para mostrar el resultado correcto (en hexadecimal).

### Problema 3
1. Diseñe un contador regresivo parametrizable de N bits con reset asincrónico en el lenguaje de descripción de su preferencia.
2. Realice un testbench de auto-chequeo (self-checking) para el contador del punto anterior. Muestre el resultado del testbench para 2, 4 y 6 bits.
3. Implemente el contador para 6 bits en la FPGA, utilice un botón para decrementar, un switch como reset, así como el display de 7 segmentos para visualizar el funcionamiento del contador. Además utilice los botones para establecer el valor inicial del contador regresivo.
