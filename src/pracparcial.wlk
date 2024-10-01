class Persona20A40 {
	var edad 
	method potencia()= 20
	
	method inteligencia() {
		if (edad.between(20,40)){return 12}
			else {return 8}
		
	}
	
	method personaDestacada(){
		if(edad == 25){ return edad == 25}
		else if (edad == 35){ return edad == 35}
		else {return false}
	 }
	method darTributo(planeta)
	{return "no hago tributo"}
	method caracteristica()
	{return "personacomun"}
	
	method valorPersona(){
		return self.potencia()+ self.inteligencia()
	}

}

class Atletas inherits Persona20A40 {
	var property masaMuscular = 4
	var property cantidadTecnicas = 2 

	override method potencia(){
		return (super() + (masaMuscular*cantidadTecnicas)) }
	
	override method personaDestacada(){ 
		return super()|| self.cantidadTecnicas() > 5 } 
	
	method entrenar(dias){
	  masaMuscular = masaMuscular + (dias.div(5))
	 	}
	 
	method aprenderTecnica(){cantidadTecnicas= cantidadTecnicas + 1

	}
	
	override method caracteristica()= "atleta"
	
	override method darTributo(planeta)=
		return planeta.construirMurallas(2)
	

	}
	

class Docente inherits Persona20A40{ 
	var cantidadCursos = 0 
	override method inteligencia()= super()+ 2*cantidadCursos 

	override method personaDestacada(){
		if (cantidadCursos >3){return cantidadCursos >3}
		else {return false }
	}
	override method caracteristica()= "docente"
	
	override method darTributo(planeta)= planeta.fundarMuseo()
	
	override method valorPersona(){return super()+ 5 }
	

}
class Planeta {
	const personas = new Set()
	var property museos 
	var property potenciaMax =0 
	var property longitudMurallas
	method delegacionDiplomatica(){
		return personas.filter{persona => persona.personaDestacada()}
	}
	method masMuseos(){ 	
		if(museos >=2){return museos >=2 }
		else {return false}}
	method esCulto(){
		return (self.masMuseos() || personas.all{persona => persona.inteligencia()>10 } 
    )}
	method potenciaReal(){
		return personas.fold(0,{acumulacion,persona=>acumulacion + persona.potencia()})
	}
	// mas sobre planetas
    method construirMurallas(cantidad){
    	longitudMurallas = longitudMurallas + cantidad 
	}
	method fundarMuseo(){museos = museos +1
	}
	method maspotente(){
		return personas.max{persona=> persona.potencia()}
	}
	method potenciaAparente() = personas.size() * personas.max {hab => hab.potencia()}.potencia()
	
	method reforzamiento(){
		if (self.potenciaAparente()>=self.potenciaReal())
		{return self.potenciaAparente()>=self.potenciaReal() }
		else {return false}
	}
	
	method tributoAtleta(){
		longitudMurallas= longitudMurallas +2
	}

	method tributoDocente(){
		museos = museos +1 
	}
	method tributoPersona(){
		museos = museos +1-1
	}

	method recibirTributos(persona){
		if (persona.caracteristica()=="docente"){
			self.tributoDocente()
		}
		else if( persona.caracteristica()== "atleta"){
			self.tributoAtleta()
		}
		else{self.tributoPersona()}
		}
	method habitantesValiosos(){
		return personas.filter{hab=>hab.valorPersona()>=40}
	}	
	method apaciguarPlaneta(planeta){
		return self.habitantesValiosos().darTributo()
	}
			
}
class Soldado inherits Persona20A40{
	const armas = new Set()
	var property peso
	var edadSoldado

	method potenciaArmas(){
		 return {armas.fold(0,{arma=>arma.potenciaArma()})}
	}
	override method potencia( )
	{return (super() + self.potenciaArmas())}

	}



class pistolete{
	var longitud
	method potenciaArma(soldado){
		if (soldado.edadSoldado()>	30){
			return longitud*3}
		else {return longitud *2}
	                            }
	}
class Espadon{
	var pesoEspadon 
	method potenciaArma(soldado){
		if (soldado.edadSoldado()<40){return (soldado.peso())/2}
	 else {return 6}
		}
	}
