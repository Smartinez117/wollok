class soldado{
	var nombre = ""
	var cargo  = ""
}

object sanMartin{
	var property nombre = ""
	const ejercito = new Set() // limita las funciones de uso dependiendo de si se declara una lista o un conjunto 
	var caballos = 0
	
	method agregarSoldados(nuevosSoldados){
		ejercito.add(nuevosSoldados)}
	// porque no funciona el indexof y el removeAt???
	// nota es una version para probar otro metodo
	//method sacarSoldado(soldadonombre){
	//	var posicion = ejercito.indexOf({soldado => soldado.nombre() == soldadonombre})
	//	if (posicion != -1){ejercito.removeAt(posicion)}
	//}
	method quitarSoldado(nombreSoldado){
	 return ejercito.filter{soldado => soldado.nombre()!= nombreSoldado}
	}
	// general busca un soldado en general
	// dato en teoria al no declarar la lista sin el new SEt()
	// la funcion elem tendrtia que funcionar 
	// SUPER NOTA XD: hay funciones que se usan para listas y para conjuntos(Set()
	
	method tieneA(buscarsoldado){
     return ejercito.any({soldado => soldado.nombre() == buscarsoldado})
	}
	method suficientesCaballos(){
		return ejercito.size() == (caballos + 1) 
	}
	method superAgente(){
		return ejercito.any({soldado => soldado.nombre() == "agente86"})
	}
	method tieneCabral(){
		return ejercito.any({soldado => soldado.nombre() == "cabral"})
	}
	method malDia(){
		ejercito.clear()
	}
	method cantidad()= ejercito.size()
	
	method atacarRealistas(soldadoEnviado){
		const poder = soldadoEnviado.poder()
		general.pierdePoder(poder)
		}
			
       }    
object agente86{
	var property nombre = "agente86"
	const property poder = 1000 // vamos tiene armas 
}
object cabral {
	var property nombre = "cabral"
	var cargo = "sargento"
	const property poder = 500
}
object luisBeltran {
	var property nombre = "luis Beltran"
	var cargo = "artillero"
	var property poder =300
}
object remedios{
	var property nombre = "Remedios"
	var cargo = "esposaDeSanMartin"
	const property poder = 10
}

//-------REALISTAS 
object general {
	var ejercito = 0
	var coeficientePoder = 1231
	method poderiaTropa()= ejercito *coeficientePoder
	method masNumeroso(){
		if( sanMartin.cantidad()< ejercito ){
			return "tiene mas soldados"}
		else {return "no tiene mas soldados"
		}
	}
	method tieneMiedo(){
	   if (sanMartin.cantidad() > 100){
	   	return "tiene miedo"}
	   	else {return " tiene miedo"}
	   }
	method pierdePoder(poder){
		coeficientePoder = coeficientePoder - (poder/100)
		ejercito = ejercito - poder
	} 
	}
	
// segunda parte -------------------------------------



	

