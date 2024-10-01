class Guerrero 
{ //clase abstracta
	const property nombre
	var property fuerza
	var property velocidad
	var property habilidades = new Set()
	method debilitadoPorEnfrentamiento(tiempo){
		fuerza -= fuerza*(0.1*tiempo)
		velocidad -= velocidad*(0.1*tiempo)
	}
	method ganarExperiencia(tiempo){
		fuerza += fuerza*(0.1*tiempo)
		velocidad += velocidad*(0.1*tiempo)
	}

}
class Cazador inherits Guerrero { //herencia
    const property respiracion

	method agregarHabilidades(lista){
		habilidades.addAll(lista)
	}

    method fuerzaRespiracion(){
		if (respiracion == ("solar") ){return 10 }
		else if (respiracion == "taquion"){return 14}
        else if (respiracion == "foton"){return 12}
            else {return 7}	
	}
    method fuerzaTotal(){
		return (fuerza+velocidad)*self.fuerzaRespiracion()
	}
	
	method entrenamientoPilar(tiempo){
		self.ganarExperiencia(tiempo) //el super solo funciona cuando se hace un override
		fuerza <= fuerza + 0.5*tiempo
		velocidad <= velocidad + 0.6*tiempo
		return self.fuerzaTotal()	    
	}
	
}
class Demonio inherits Guerrero {	//herencia
    const property arteDemoniaco
    var property nivel

    method fuerzaTotal(){
		return fuerza+velocidad*self.nivel()
	}

    method subirRango(){
        nivel += 2 
        return nivel
    }

    method consumirPersonas(personas){
        if (personas > 50){
            self.subirRango() 
            return nivel}
        else {return nivel}
    }
}
const matemriichi= new Cazador (nombre ="matemriichi ayanokoji",respiracion="taquion",fuerza=1000,velocidad =1500,habilidades=["marcaDeCazador","HojaCarmesi","mundoTransparente","estadoDesinteresante","ojo que todo lo recuerda","mandamiento del poder"])
const matemtaka  = new Cazador (nombre ="matemkaka tsugikuni"  ,respiracion="foton",fuerza=1000,velocidad =1500,habilidades=["marcaDeCazador","HojaCarmesi","mundoTransparente","estadoDesinteresante","ojo que todo lo recuerda","mandamiento de la verdad"])
const yoriichi   = new Cazador (nombre = "yoriichi",respiracion = "Solar",fuerza=1000,velocidad = 1500,habilidades =["marcaDeCazador","HojaCarmesi","mundoTransparente","estadoDesinteresante"])
const gyomei     = new Cazador (nombre = "gyomei",respiracion = "roca",fuerza=900,velocidad = 930,habilidades =["HojaCarmesi","mundoTransparente","marcaCazador"])
const michikatsu = new Demonio (nombre ="hermanoEnvidioso",arteDemoniaco = "creacionDEEspadas",nivel=8,fuerza=1500,velocidad = 1000)

object cofradia{
	var property listaCazadores=#{matemriichi,matemtaka,yoriichi}

	method reclutarCazadores(cazadores){
		listaCazadores.addAll(cazadores)
	}
	method empezarEntrenamientoPilar(tiempo){
		listaCazadores.map{cazador => cazador.entrenamientoPilar(tiempo)}
	}
	method fuerzaCazadores(cazadores){
		return cazadores.sum{cazador => cazador.fuerzaTotal()}
	}
	method enfrentamiento(cazadores,demonios){
	const fuerzaDemonio = demonios.sum{demonio=>demonio.fuerzaTotal()}
	const fuerzaCazador = cazadores.sum{cazador=>cazador.fuerzaTotal()}
		if( fuerzaCazador > fuerzaDemonio){
			return ( listaCazadores.filter{cazador=>cazador.nombre()} )
		 }
	    else {return (demonios.filter{demonio=>demonio.nombre()})}
	}
}