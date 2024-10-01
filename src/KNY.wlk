// nota los var con las clases solo se declaran en el terminal es complicado hacer desde 
// el codigo pues hayb que usar un ovbjeto y es tedioso practicalo despues 


class Cazador {
	const property nombre 
	const respiracion 
	var property fuerza 
	var property velocidad 
	var habilidades = new Set()
	method agregarHabilidades(lista){
		habilidades.addAll(lista)
	}
	method quitarHabilidades(lista){ //elimina los elementos que estan en una lista de otra
		habilidades = habilidades.filter({x => !lista.containe(x)})
	}
	method entrenamiento(tiempo){
		fuerza = fuerza + 0.5*tiempo
		velocidad = velocidad + 0.6*tiempo 	    
	}
	method nuevoEntrenamiento(){
	   fuerza = fuerza + 0.5*fuerza
		velocidad = velocidad + 0.6*velocidad 	
	}
	
	method fuerzaRespiracion(){
		if (respiracion == "solar"){
			return 10 }	
		else if(respiracion == "lunar"){
			return 8}
			else {return 6}	
	}

	method fuerzaTotal(){
		return (fuerza+velocidad)*self.fuerzaRespiracion()
	}
	
}

class NuevoDemonio inherits Cazador {
    const property arteDemonio 
    const property nivel = 0
    override method fuerzaTotal(){
    	return fuerza+velocidad*self.nivel()
    }
 }

class Demonio {
	const property nombre 
	const property arteDemoniaco 
	var property nivel 
	var property fuerza 
	var property velocidad 
	method fuerzaTotal(){
		return fuerza+velocidad*self.nivel()
	}
	 
}

// con lso property ya se puede acceder a los datos del cazador para facilitar el uso de ellos en el calculo de poder 

const yoriichi = new Cazador (nombre = "yoriichi",respiracion = "Solar",fuerza=1000,velocidad = 1500,habilidades =["marcaDeCazador","HojaCarmesi","mundoTransparente","estadoDesinteresante"])
const gyomei = new Cazador (nombre = "gyomei",respiracion = "roca",fuerza=900,velocidad = 930,habilidades =["HojaCarmesi"])
const michikatsu = new Demonio (nombre="hermanoEnvidioso",arteDemoniaco = "creacionDEEspadas",nivel=8,fuerza=1500,velocidad = 1000)

object cofradia {
 const cazadores = [yoriichi,gyomei,michikatsu]
 method agregarCazadores(listaDeCazadores){
 	cazadores.addAll(listaDeCazadores)
 }
 method entrenamientoDePilar(tiempo){
 	return cazadores.map({cazador =>cazador.entrenamiento(tiempo)cazador})
 }// el cazador al final indica que es lo que devolveria los bloques 
 method fuerzaTotalCazadores(listaDeCazadores) {
 	return (listaDeCazadores.fold(0 ,{acumulacionDeFuerza, cazador => acumulacionDeFuerza + cazador.fuerzaTotal() }) )
 	}
 method nuevoEntrenamiento(){
 	return cazadores.map{cazador=>cazador.nuevoEntrenamiento()}
 }
 
 method enfrentamiento(cazador,demonio){
   if (cazador.fuerzaTotal()>demonio.fuerzaTotal()){
   	return cazador.nombre()}
   else {return demonio.nombre()}
 }
 // funcion mejorada para usar una lista en vez de todo uno 
 method enfrentamientoGeneral(cantidadDeCazadores,demonio){
 	if (self.fuerzaTotalCazadores(cantidadDeCazadores)>demonio.fuerzaTotal()){
 	 return cantidadDeCazadores.map( {cazadorDeLista => cazadorDeLista.nombre() } )}	
 	else {return demonio.nombre()}
 	}
// modificar esta funcion aun no funciona del todo bien
 method filtrarPor(condicion){
 	return cazadores.map(condicion) }// en la condicion debe estar definida
 
 // chequear hay algo raro pero en teoria esta bien definidas 
 method aplicarOperaciones (primera,segunda,tercera){
 	const cazadores1 = cazadores.map(primera) 
 	const cazadores2 = cazadores1.map(segunda)
 	return cazadores2.map(tercera)	
 }	
  method aplicarOperaciones1 (primera,segunda,tercera){
 	return ((cazadores.map(primera)).map(segunda)).map(tercera)	
 }
 method operaciones(primero,segundo){
 	return ((cazadores.map(primero)).map(segundo))
 }// nota no deben funcionar debido a que como se usan bloque y se le da una lista con instancias 
 //podrias crear una funcion que use bloque y aplique una funciona  cada eleemnto de la lista de cazadorea 
 
 }
//----------------------variables ya declaradas---------

