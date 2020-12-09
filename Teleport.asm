.model small
.stack
.data                                          
   Instrucciones dw '  ',0ah,0dh
dw ' ',0ah,0dh
dw ' ',0ah,0dh
dw '           ====================================================',0ah,0dh
dw '          ||                                                  ||',0ah,0dh                                        
dw '          ||        Instituto Tecnologico de Costa Rica       ||',0ah,0dh
dw '          ||                                                  ||',0ah,0dh
dw '          ||        Ingenieria En Computacion                 ||',0ah,0dh
dw '          ||                                                  ||',0ah,0dh
dw '          ||        Proyecto Ensamblador 8086                 ||',0ah,0dh
dw '          ||                                                  ||',0ah,0dh          
dw '          ||        Elias Mena Segura                         ||',0ah,0dh
dw '          ||                                                  ||',0ah,0dh 
dw '          ||        Sede San Carlos                           ||',0ah,0dh 
dw '          ||                                                  ||',0ah,0dh 
dw '          ||        2017                                      ||',0ah,0dh 
dw '          ||                                                  ||',0ah,0dh 
dw '          ||        Presione una tecla para empezar           ||',0ah,0dh
dw '           ====================================================',0ah,0dh
dw '$',0ah,0dh                   
Cadena db '-$' 
Cadena2 db " $"
Coloractivo dw ".$" 
Colors dw "  Colors: R/B/G/Y/W $"
Fila db 11
Columna db 40 
Fila2 dw 0000
Columna2 dw 0000 
Filam db 00 
Line dw "==$"
Columnam db 00
Divisor db 8  
Color db 1111b
Reset db "- Space to reset -$"
Quit db "Q to Quit$"                      
Mover db 0
Mover2 db 0
Vacio db " $" 
Colorciclo db 0
Bandera db 0 

.code          

     mov ax, @data
     mov ds,ax
     
            ;Inicia el modo grafico.
     mov ah,00h
     mov al,03h
     int 10h
     mov cx,1
     mov si,0
     
Leer:          ;Impresion de las instrucciones.
     mov ah, 02h
     mov dh, 01
     mov dl, 00
     int 10h   
     mov ah, 09h
     mov dx, offset [Instrucciones]
     int 21h     
                               
     mov ah,07h  ;Entrada del caracter a utilizar.
     int 21h
     
Imprimir:       ;Etiqueta de impresion del digito en centro de pantalla.
     mov dl,al  ;Ingresa a Dl el caracter ingresado anteriormente.
     mov ah,02h 
     int 21h    ;Interrupcion para escribir un caracter.
     
     mov Cadena[si],al 
     mov ah,00h
     mov al,03h ;Obtencion de la posicion del cursor.
     int 10h                                  
     
     mov ah,02h  ; Registro de impresion. 
     mov dh,Fila ; Posicion de filas.
     mov dl,Columna ;Posicion de coolumnas.
     mov bx,00h
     int 10h  
     
     mov ah,09h    
     mov dx,offset[Cadena] ;Imprecion del caracter seleccionado.
     int 21h
        
     mov ah, 02h
     mov dh, 23 ;Establece la posicion de impresion de datos informativos.
     mov dl, 00
     int 10h
     
     mov ah, 09h
     mov dx, offset [Colors] ;String de Colores
     int 21h  
  
     
     mov ah, 02h
     mov dh, 22
     mov dl, 00
     int 10h  
     
     mov cx, 80 ;Contador de loop siguente.
;________________________________________________________________________________________________________     
   
        
ImpresionLinea: ; Etiqueta encargada de generar parametro de pantalla de juego.      
     mov ah,09h
     mov dx, offset [Line] ; Variable de lineaa impresa.
     int 21h
     sub cx, 1 ; Decremento del contador
     add dl, 1 ; Incremento de la pocicion de la linea para generar patron.
     loop ImpresionLinea ; Ciclo

;________________________________________________________________________________________________________     
   
     
ImprimirReset: ; Etiqueta encargada de imprimir informacion de reset.
     mov ah, 02h
     mov dh, 23
     mov dl, 33
     int 10h
  
     mov ah, 09h
     mov dx, offset [Reset]
     int 21h

;________________________________________________________________________________________________________     
   
   
ImprimirQuit: ;Etiqueta encargada de imprimir informacion de quitar.
     mov ah, 02h
     mov dh, 23
     mov dl, 60                                                         
     int 10h
  
     mov ah, 09h
     mov dx, offset [Quit]
     int 21h 
;________________________________________________________________________________________________________     
   
                    
ColorActual:       
     mov Coloractivo,"C" ; Imprecion de digito demostrativo de color en uso.
     mov ah,02h    
     mov dh,23  ;Posiciones de imprecion. 
     mov dl,20
     mov bx,00h
     int 10h   
     mov bl,Color ; Asigna color en uso.
     mov ah,09h
     mov cx, 1
     mov al,offset[Coloractivo]
     int 10h  
                    
     mov Coloractivo,"o" ; Imprecion de digito demostrativo de color en uso.
     mov ah,02h    
     mov dh,23  ;Posiciones de imprecion. 
     mov dl,21
     mov bx,00h
     int 10h   
     mov bl,Color ; Asigna color en uso.
     mov ah,09h
     mov cx, 1
     mov al,offset[Coloractivo]
     int 10h   
            
     mov Coloractivo,"l" ; Imprecion de digito demostrativo de color en uso.
     mov ah,02h    
     mov dh,23  ;Posiciones de imprecion. 
     mov dl,22
     mov bx,00h
     int 10h   
     mov bl,Color ; Asigna color en uso.
     mov ah,09h
     mov cx, 1
     mov al,offset[Coloractivo]
     int 10h  
     
     mov Coloractivo,"o" ; Imprecion de digito demostrativo de color en uso.
     mov ah,02h 
     mov dh,23  ;Posiciones de imprecion. 
     mov dl,23
     mov bx,00h
     int 10h   
     mov bl,Color ; Asigna color en uso.
     mov ah,09h
     mov cx, 1
     mov al,offset[Coloractivo]
     int 10h 
     
     mov Coloractivo,"r" ; Imprecion de digito demostrativo de color en uso.
     mov ah,02h  
     mov dh,23 ;Posiciones de imprecion. 
     mov dl,24
     mov bx,00h
     int 10h   
     mov bl,Color ; Asigna color en uso.
     mov ah,09h
     mov cx, 1
     mov al,offset[Coloractivo]
     int 10h  
;________________________________________________________________________________________________________     

MOVIMIENTOS PROC NEAR
    
    cmp Mover,1
    je Izquierda
    
    cmp Mover,2
    je Abajo
    
    cmp Mover,3
    je Derecha
    
    cmp Mover,5
    je Arriba
          

Arriba:  
    mov ax,0003h ; Funcion para solicitar infomacion del mause.
    int 33h 
    
    mov Fila2,dx ; Asignacion de posicion a filas.
    mov Columna2,cx  ; Asignacion de posicion a columnas.  
    
    mov al,0 ; Limpieza de registro para evitar posibles errores.
    
    cmp bx,1 ; Comparacion de Click izquierdo activo.
    je ImprimeColor ; Salto a imprimir color por ingreso de mause.
    
    cmp bx, 2 ; Comparacion de Click derecho activo.
    je Borrar ; Salto a borraar caracter por ingreso de mause.
     
    
     mov ah,02h  ; Registro de impresion. 
     mov dh,Fila ; Posicion de filas.
     mov dl,Columna ;Posicion de coolumnas.
     int 10h  
 
     mov ah, 09h ; Borrado de caracter en caso de cumplimiento de condicionales.
     mov al,OFFSET[Vacio] ;Permite que el caracter se mueva sin copiarlo seguidamente
     mov bl,07h
     mov cx,0001b
     int 10h
     
     sub Fila, 1             ;movimiento  hacia arriba
     cmp Fila,0
     je  Derecha
     mov Mover,5
      
     mov ah,2
     mov dh,Fila             ;Pone el caracter en el movimiento actual
     mov dl,Columna
     int 10h
     
     mov ah,08h              ;lee caracter actual
     int 10h
     
     mov ah,09h
     mov al,OFFSET[cadena]
     mov bl,color;le asigna el color en uso
     mov cx,1
     int 10h
    
    
    mov ah,06 ; Servicio de teclado
    mov dl,255
    int 21h   ; Interrupcion para obtener el signo de teclado en buffer.  
    
    
    
     cmp al,"3"
     je Derecha
     
     cmp al,"2"
     je Abajo
    
     cmp al,"1"
     je Izquierda 
     
     
    
    cmp al,"R" ; Conjunto de comparaciones de entradas de teclado con colores seleccionados.
    je TeclaR 
    
    cmp al,"B"
    je TeclaB
     
    cmp al,"G"
    je TeclaG
    
    cmp al,"Y"
    je TeclaY 
    
    cmp al,"W"
    je TeclaW
    
    cmp al,"r" ; Conjunto de comparaciones de entradas de teclado con colores seleccionados.
    je TeclaR 
    
    cmp al,"b"
    je TeclaB
     
    cmp al,"g"
    je TeclaG
    
    cmp al,"y"
    je TeclaY 
    
    cmp al,"w"
    je TeclaW   
    
        
   
    cmp al," " ; Comparacion de entrada de teclado con espacio para generar reset del juego.
    je Resetear
     
    cmp al,"Q" ; Comparacion de entrada de teclado con Q para generar salidaa del juego.
    je Salir 
    
    cmp al,"q" ; Comparacion de entrada de teclado con Q para generar salidaa del juego.
    je Salir
    
    cmp al,00  ; Validacion de tecla incorrecta ingresada .
    jne Sonido
                                             
    cmp Bandera, 1 ; Validaciones de ciclos.
    je Rojo
    cmp Bandera, 2
    je Azul
    cmp Bandera, 3
    je Amarillo
    cmp Bandera, 4
    je Verde
    
    jmp Arriba  ;Retorna a el ciclo principal.  
;________________________________________________________________________________________________________     
                                                    

Abajo:
  
    mov ax,0003h ; Funcion para solicitar infomacion del mause.
    int 33h 
    
    mov Fila2,dx ; Asignacion de posicion a filas.
    mov Columna2,cx  ; Asignacion de posicion a columnas.  
    
    mov al,0 ; Limpieza de registro para evitar posibles errores.
    
    cmp bx,1 ; Comparacion de Click izquierdo activo.
    je ImprimeColor ; Salto a imprimir color por ingreso de mause.
    
    cmp bx, 2 ; Comparacion de Click derecho activo.
    je Borrar ; Salto a borraar caracter por ingreso de mause.
     
    
     mov ah,02h  ; Registro de impresion. 
     mov dh,Fila ; Posicion de filas.
     mov dl,Columna ;Posicion de coolumnas.
     int 10h  
 
     mov ah, 09h ; Borrado de caracter en caso de cumplimiento de condicionales.
     mov al,OFFSET[Vacio]
     mov bl,07h
     mov cx,0001b
     int 10h
     
     add Fila, 1 
     cmp Fila,21
     je  Izquierda
     mov Mover,2
     
     mov ah,2
     mov dh,Fila
     mov dl,Columna
     int 10h
     
     mov ah,08h
     int 10h 
     
     
     mov ah,09h
     mov al,OFFSET[cadena]
     mov bl,color
     mov cx,1
     int 10h 
    
    
    mov ah,06 ; Servicio de teclado
    mov dl,255
    int 21h   ; Interrupcion para obtener el signo de teclado en buffer.  
    
    
    
     cmp al,"3"
     je Derecha
     
     cmp al,"1"
     je Izquierda
    
     cmp al,"5"
     je Arriba 
     
    
    cmp al,"R" ; Conjunto de comparaciones de entradas de teclado con colores seleccionados.
    je TeclaR 
    
    cmp al,"B"
    je TeclaB
     
    cmp al,"G"
    je TeclaG
    
    cmp al,"Y"
    je TeclaY 
    
    cmp al,"W"
    je TeclaW
    
    cmp al,"r" ; Conjunto de comparaciones de entradas de teclado con colores seleccionados.
    je TeclaR 
    
    cmp al,"b"
    je TeclaB
     
    cmp al,"g"
    je TeclaG
    
    cmp al,"y"
    je TeclaY 
    
    cmp al,"w"
    je TeclaW  
     
       
   
    cmp al," " ; Comparacion de entrada de teclado con espacio para generar reset del juego.
    je Resetear
     
    cmp al,"Q" ; Comparacion de entrada de teclado con Q para generar salidaa del juego.
    je Salir
    
    cmp al,"q" ; Comparacion de entrada de teclado con Q para generar salidaa del juego.
    je Salir
    
    cmp al,00  ; Validacion de tecla incorrecta ingresada .
    jne Sonido
                                             
    cmp Bandera, 1 ; Validaciones de ciclos.
    je Rojo
    cmp Bandera, 2
    je Azul
    cmp Bandera, 3
    je Amarillo
    cmp Bandera, 4
    je Verde
    
    JMP ABAJO  ;Retorna a el ciclo principal.  

;________________________________________________________________________________________________________     
   
   
Derecha:
  
    mov ax,0003h ; Funcion para solicitar infomacion del mause.
    int 33h 
    
    mov Fila2,dx ; Asignacion de posicion a filas.
    mov Columna2,cx  ; Asignacion de posicion a columnas.  
    
    mov al,0 ; Limpieza de registro para evitar posibles errores.
    
    cmp bx,1 ; Comparacion de Click izquierdo activo.
    je ImprimeColor ; Salto a imprimir color por ingreso de mause.
    
    cmp bx, 2 ; Comparacion de Click derecho activo.
    je Borrar ; Salto a borraar caracter por ingreso de mause.
     
    
     mov ah,02h  ; Registro de impresion. 
     mov dh,Fila ; Posicion de filas.
     mov dl,Columna ;Posicion de coolumnas.
     int 10h  
 
     mov ah, 09h ; Borrado de caracter en caso de cumplimiento de condicionales.
     mov al,OFFSET[Vacio]
     mov bl,07h
     mov cx,0001b
     int 10h
     
     add columna, 1         ;movimiento a la derecha
     cmp columna,80         ;valida colicion con pantalla
     je Abajo
     mov Mover,3
     
     mov ah,2
     mov dh,Fila
     mov dl,Columna
     int 10h
     
     mov ah,08h
     int 10h
     
     mov ah,09h
     mov al,OFFSET[cadena]
     mov bl,color                ;imprime caracter
     mov cx,1
     int 10h
    
    mov ah,06 ; Servicio de teclado
    mov dl,255
    int 21h   ; Interrupcion para obtener el signo de teclado en buffer.  
    
    
    
     cmp al,"1"
     je Izquierda
     
     cmp al,"2"
     je Abajo
    
     cmp al,"5"
     je Arriba 
     
    
    cmp al,"R" ; Conjunto de comparaciones de entradas de teclado con colores seleccionados.
    je TeclaR 
    
    cmp al,"B"
    je TeclaB
     
    cmp al,"G"
    je TeclaG
    
    cmp al,"Y"
    je TeclaY 
    
    cmp al,"W"
    je TeclaW
    
    cmp al,"r" ; Conjunto de comparaciones de entradas de teclado con colores seleccionados.
    je TeclaR 
    
    cmp al,"b"
    je TeclaB
     
    cmp al,"g"
    je TeclaG
    
    cmp al,"y"
    je TeclaY 
    
    cmp al,"w"
    je TeclaW  
       
   
    cmp al," " ; Comparacion de entrada de teclado con espacio para generar reset del juego.
    je Resetear
     
    cmp al,"Q" ; Comparacion de entrada de teclado con Q para generar salidaa del juego.
    je Salir
    
    cmp al,"q" ; Comparacion de entrada de teclado con Q para generar salidaa del juego.
    je Salir
    
    cmp al,00  ; Validacion de tecla incorrecta ingresada .
    jne Sonido
                                             
    cmp Bandera, 1 ; Validaciones de ciclos.
    je Rojo
    cmp Bandera, 2
    je Azul
    cmp Bandera, 3
    je Amarillo
    cmp Bandera, 4
    je Verde
    
    jmp Derecha  ;Retorna a el ciclo principal.  
;________________________________________________________________________________________________________     
   
   
Izquierda:
  
    mov ax,0003h ; Funcion para solicitar infomacion del mause.
    int 33h 
    
    mov Fila2,dx ; Asignacion de posicion a filas.
    mov Columna2,cx  ; Asignacion de posicion a columnas.  
    
    mov al,0 ; Limpieza de registro para evitar posibles errores.
    
    cmp bx,1 ; Comparacion de Click izquierdo activo.
    je ImprimeColor ; Salto a imprimir color por ingreso de mause.
    
    cmp bx, 2 ; Comparacion de Click derecho activo.
    je Borrar ; Salto a borraar caracter por ingreso de mause.
     
    
     mov ah,02h  ; Registro de impresion. 
     mov dh,Fila ; Posicion de filas.
     mov dl,Columna ;Posicion de coolumnas.
     int 10h  
 
     mov ah, 09h ; Borrado de caracter en caso de cumplimiento de condicionales.
     mov al,OFFSET[Vacio]
     mov bl,07h
     mov cx,0001b
     int 10h
     
     sub columna, 1 ; Movimiento de izquierda.
     cmp columna,0
     je Arriba ;Si llega al final de la pantalla por el lado izq el caracter se ira hacia arriba
     mov Mover,1
     
     mov ah,2
     mov dh,Fila
     mov dl,Columna
     int 10h
     
     mov ah,08h
     int 10h
     
     mov ah,09h
     mov al,OFFSET[cadena]
     mov bl,color
     mov cx,1
     int 10h
    
    mov ah,06 ; Servicio de teclado
    mov dl,255
    int 21h   ; Interrupcion para obtener el signo de teclado en buffer.  
    
    
    
     cmp al,"3"
     je Derecha
     
     cmp al,"2"
     je Abajo
    
     cmp al,"5"
     je Arriba 
     
    
    cmp al,"R" ; Conjunto de comparaciones de entradas de teclado con colores seleccionados.
    je TeclaR 
    
    cmp al,"B"
    je TeclaB
     
    cmp al,"G"
    je TeclaG
    
    cmp al,"Y"
    je TeclaY 
    
    cmp al,"W"
    je TeclaW 
    
    cmp al,"r" ; Conjunto de comparaciones de entradas de teclado con colores seleccionados.
    je TeclaR 
    
    cmp al,"b"
    je TeclaB
     
    cmp al,"g"
    je TeclaG
    
    cmp al,"y"
    je TeclaY 
    
    cmp al,"w"
    je TeclaW 
    
       
   
    cmp al," " ; Comparacion de entrada de teclado con espacio para generar reset del juego.
    je Resetear
     
    cmp al,"Q" ; Comparacion de entrada de teclado con Q para generar salidaa del juego.
    je Salir
    
    cmp al,"q" ; Comparacion de entrada de teclado con Q para generar salidaa del juego.
    je Salir
    
    cmp al,00  ; Validacion de tecla incorrecta ingresada .
    jne Sonido
                                             
    cmp Bandera, 1 ; Validaciones de ciclos.
    je Rojo
    cmp Bandera, 2
    je Azul
    cmp Bandera, 3
    je Amarillo
    cmp Bandera, 4
    je Verde
    
    jmp Izquierda  ;Retorna a el ciclo principal                                              
                                                 
    MOVIMIENTOS ENDP                                             
;________________________________________________________________________________________________________                                               


TeclaR: ; Etiqueta encargada de generar el cambio de color a rojo.
    mov Color,0100b
    mov ax ,0C00h ; Servicio de cambio de color de un objeto string.
    int 21h 
    jmp ColorActual     
    
TeclaB: ; Etiqueta encargada de generar el cambio de color a azul.
    mov Color,0001b
    mov ax ,0C00h ; Servicio de cambio de color de un objeto string.
    int 21h
     
    jmp ColorActual  

TeclaG: ; Etiqueta encargada de generar el cambio de color a verde.
    mov Color,0010b
    mov ax ,0C00h ; Servicio de cambio de color de un objeto string.
    int 21h
     
    jmp ColorActual   

TeclaY:  ; Etiqueta encargada de generar el cambio de color a amarillo.
    mov color,1110b
    mov ax ,0C00h ; Servicio de cambio de color de un objeto string.
    int 21h
     
    jmp ColorActual

TeclaW: ; Etiqueta encargada de generar el cambio de color a blanco.
 
    mov color,1111b
    mov ax ,0C00h ; Servicio de cambio de color de un objeto string.
    int 21h  
    
    jmp ColorActual ; Ingreso a etiqueta para cambio del color del indicador de color usado. 
     


;________________________________________________________________________________________________________

White:
     mov bandera,0
     mov ah,02h  ; Registro de impresion. 
     mov dh,Fila ; Posicion de filas.
     mov dl,Columna ;Posicion de coolumnas.
     mov bx,00h
     int 10h
     
     mov ah,09h    
     mov al,vacio ;Imprecion del caracter seleccionado.
     mov bl,07h
     mov cx,0001b
     int 10h
     
     mov ah,09h    
     mov dx,offset[Cadena] ;Imprecion del caracter seleccionado.
     int 21h       
     je call movimientos

    
     je call movimientos
     
;________________________________________________________________________________________________________     
     
Rojo:
    
     mov bandera, 1 
     mov ah,02h  ; Registro de impresion. 
     mov dh,Fila ; Posicion de filas.
     mov dl,Columna ;Posicion de coolumnas.
     mov bx,00h
     int 10h
     
     mov ah,09h    
     mov al,vacio ;Imprecion del caracter seleccionado.
     mov bl,07h
     mov cx,0001b
     int 10h
     
     
     add columna, 1
     cmp columna,81
     je ResetMovimientoR
     
     
     mov ah,02h  ; Registro de impresion. 
     mov dh,Fila ; Posicion de filas.
     mov dl,Columna ;Posicion de coolumnas.
     mov bx,00h
     int 10h
     
     mov ah, 08h      ;toma el caracter actual y su color
     int 10h
     cmp ah, 0001b
     je Azul
     cmp ah, 1110b          ;validaciones durante ciclo de movimiento
     je Amarillo
     cmp ah, 0010b
     je Verde
     cmp ah, 1111b
     je White
     
     mov ah,09h    
     mov dx,offset[Cadena] ;Imprecion del caracter seleccionado.
     int 21h       
     je call movimientos
     
;________________________________________________________________________________________________________

Azul:
    
     mov bandera, 2 
     mov ah,02h  ; Registro de impresion. 
     mov dh,Fila ; Posicion de filas.
     mov dl,Columna ;Posicion de coolumnas.
     mov bx,00h
     int 10h
     
     mov ah,09h    
     mov al,vacio ;Imprecion del caracter seleccionado.
     mov bl,07h
     mov cx,0001b
     int 10h
     
     
     
     sub columna, 1
     cmp columna,1
     je ResetMovimientoA ;pone el caracter al otro lado de la pantalla
     
     
     mov ah,02h  ; Registro de impresion. 
     mov dh,Fila ; Posicion de filas.
     mov dl,Columna ;Posicion de coolumnas.
     mov bx,00h
     int 10h
     
     mov ah, 08h       ;toma caracter actual
     int 10h
     cmp ah, 0100b
     je Rojo        ;validacion de colores durante el ciclo
     cmp ah, 1110b
     je Amarillo
     cmp ah, 0010b
     je Verde
     cmp ah, 1111b
     je White
     
     mov ah,09h    
     mov dx,offset[Cadena] ;Imprecion del caracter seleccionado.
     int 21h       
     je call movimientos
     
;________________________________________________________________________________________________________     
     
Amarillo:
    
     mov bandera, 3 
     mov ah,02h  ; Registro de impresion. 
     mov dh,Fila ; Posicion de filas.
     mov dl,Columna ;Posicion de coolumnas.
     mov bx,00h
     int 10h
     
     mov ah,09h    
     mov al,vacio ;Imprecion del caracter seleccionado.
     mov bl,07h
     mov cx,0001b
     int 10h
          
     add Fila, 1
     cmp Fila,22
     je ResetMovimientoY ;pone el caracter al otro lado de la pantalla
     
     
     mov ah,02h  ; Registro de impresion. 
     mov dh,Fila ; Posicion de filas.
     mov dl,Columna ;Posicion de coolumnas.
     mov bx,00h
     int 10h
     
     mov ah, 08h        ;toma caracter actual
     int 10h
     cmp ah, 0100b
     je Rojo
     cmp ah, 0001b
     je Azul        ;valida colores durante ciclo de movimiento
     cmp ah, 0010b
     je Verde 
     cmp ah, 1111b
     je White
     
     mov ah,09h    
     mov dx,offset[Cadena] ;Imprecion del caracter seleccionado.
     int 21h       
     je call movimientos
 
;________________________________________________________________________________________________________ 
 
Verde:
    
     mov bandera, 4 
     mov ah,02h  ; Registro de impresion. 
     mov dh,Fila ; Posicion de filas.
     mov dl,Columna ;Posicion de coolumnas.
     mov bx,00h
     int 10h
     
     mov ah,09h    
     mov al,vacio ;Imprecion del caracter seleccionado.
     mov bl,07h
     mov cx,0001b
     int 10h
          
     sub Fila, 1
     cmp Fila,1
     je ResetMovimientoV ;pone el caracter al otro lado de la pantalla
     
     
     mov ah,02h  ; Registro de impresion. 
     mov dh,Fila ; Posicion de filas.
     mov dl,Columna ;Posicion de coolumnas.
     mov bx,00h
     int 10h
     
     mov ah, 08h        ;toma el caracter actual y guarda su color en ah
     int 10h
     cmp ah, 0100b
     je Rojo
     cmp ah, 0001b
     je Azul        ;validacion de colores durante el ciclo
     cmp ah, 1110b
     je Amarillo
     cmp ah, 1111b
     je White
     
     mov ah,09h    
     mov dx,offset[Cadena] ;Imprecion del caracter seleccionado.
     int 21h       
     je call movimientos   
;________________________________________________________________________________________________________     

ResetMovimientoA:
     mov Columna,80
     jmp Azul 
     
ResetMovimientoR:           ;Validaciones para el movimiento del ciclo
     mov columna,0
     jmp Rojo
     
ResetMovimientoY:
     mov fila, 1
     jmp Amarillo
     
ResetMovimientoV:
     mov fila, 21
     jmp Verde
     
     
;________________________________________________________________________________________________________     
     
Sonido:  ; Etiqueta de sonido al ingresar tecla que no corresponda al programa.
    mov ah,2
    mov dl,07h
    int 21h
    call movimientos
               
;________________________________________________________________________________________________________

Borrar: ; Etiqueta encargada de generar el borrado de digitos no deseados.

    mov ax,Fila2
    div Divisor ; Divide los pixeles de pantalla entre los espacios de impresion.
    
    mov ah,00
    mov Filam,al 
    mov ax,Columna2 
    div Divisor ; Divide los pixeles de pantalla entre los espacios de impresion.
    
    mov ah,00      ; Almacenamiento de informacion de pociciones(Filas*Columnas) en medida caracteres.
    mov Columnam,al
    mov ah,02h    
    mov dh,Filam  
    mov dl,Columnam
    mov bx,00h
    int 10h 
    
    mov ah,08h
    int 10h
    cmp ah,color
    je Teleport
    
     
    cmp Filam, 22 ; Restriccion de linea de division de juego y set de informacion.
    je call movimientos
    
    cmp Filam, 23 ; Restricciones de borrado de strings de set de innformacion.
    je call movimientos
    cmp Filam, 24
    je call movimientos
    cmp Filam, 25
    je call movimientos
    
    mov ah, 08h  ; Restriccion de borrado de caracter de juego.
    int 10h
    cmp al, Cadena
    je call movimientos
    
    mov ah, 09h ; Borrado de caracter en caso de cumplimiento de condicionales.
    mov cx, 1
    mov al, 00
    int 10h
    
    call movimientos
;________________________________________________________________________________________________________    

ImprimeColor:  ; Etiqueta de impresion de marca de color.  

    mov ax,Fila2
    div Divisor ; Divide los pixeles de pantalla entre los espacios de impresion.
    mov ah,00
    mov Filam,al 
    
    mov ax,Columna2 ; Divide los pixeles de pantalla entre los espacios de impresion.
    div Divisor
    mov ah,00
    mov Columnam,al

    mov ah,02h    ; Extraccion de informacion de pociciones(Filas*Columnas) en medida caracteres.
    mov dh,Filam  
    mov dl,Columnam
    mov bx,00h
    int 10h    
    
    cmp Filam, 22 ; Restriccion de linea de division de juego y set de informacion. 
    je call movimientos  
    
    cmp Filam, 23 ; Restricciones de borrado de strings de set de innformacion.
    je call movimientos
    cmp Filam, 24
    je call movimientos
    cmp Filam, 25
    je call movimientos
    
    mov ah,08h  ; Restriccion de borrado de caracter de juego.
    int 10h
    cmp al,Cadena
    je call movimientos  
     
    mov bl,Color  ; Genera la impresion con anteriores caracteristicas y restricciones.
    mov ah,09h
    mov cx, 1
    mov al,offset[Cadena2]
    int 10h
     
	call movimientos
;________________________________________________________________________________________________________    

Resetear:
    xor ax, ax
    xor bx, bx
    xor dx, dx
    xor cx, cx
    mov fila, 11
    mov columna, 40
    mov fila2, 0000
    mov columna2, 0000
    mov color, 1111b
    mov colorciclo, 0000
    mov bandera, 0          ;Reset
    jmp
    
;______________________________________________________________________________
 Teleport:
     
    
    
    
    mov al,0 ; Limpieza de registro para evitar posibles errores.
    
    
     mov ah,02h  ; Registro de impresion. 
     mov dh,Fila ; Posicion de filas.
     mov dl,Columna ;Posicion de coolumnas.
     int 10h  
 
     mov ah, 09h ; Borrado de caracter en caso de cumplimiento de condicionales.
     mov al,OFFSET[Vacio]
     mov bl,07h
     mov cx,0001b
     int 10h       
             
             
     mov ax,Fila2
     div Divisor ; Divide los pixeles de pantalla entre los espacios de impresion.
     mov ah,00
     mov Filam,al 
    
     mov ax,Columna2 ; Divide los pixeles de pantalla entre los espacios de impresion.
     div Divisor
     mov ah,00
     mov Columnam,al

     mov ah,02h    ; Extraccion de informacion de pociciones(Filas*Columnas) en medida caracteres.
     mov dh,Filam  
     mov dl,Columnam 
     mov bx,00h
     int 10h         
     
     mov ah,filam
     mov al,columnam
     mov fila,ah
     mov columna,al
     
     
     
     
    
     CALL MOVIMIENTOS


;______________________________________________________________________________ 

Salir: 
    int 20h ; Finaliza el programa
.exit        
 end