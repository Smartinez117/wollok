class Persona{
	var property edad
	
	method inteligencia(){
		if(edad.between(20,40)){return 12}
		else{ return 8}
	}
	
	method potencia()=20
	
	method destacada(){
		if(edad== 25){return edad== 25}
		else if (edad == 35){return edad==35}
		else {return false}
	}
	method tributo(planeta){}
	
	method valorPersona()= self.potencia()+self.inteligencia()
}
class Atleta inherits Persona{
	var property masaMuscular = 4
	var property tecnicas = 2

	override method potencia()=super()+ (masaMuscular*tecnicas)
	
	override method destacada()= super() || tecnicas > 5
	 
	method entrenar(dias)= (masaMuscular = masaMuscular + dias.div(5) ) 
	
	method aprenderTecnica()= (tecnicas = tecnicas + 1)
	
	override method tributo(planeta){planeta.construir(2)}
}

class Docente inherits Persona{
	var property cursos =0
	
	override method inteligencia()= super() + 2*cursos
	
	override method destacada()= (cursos>3)
	
	override method tributo(planeta){planeta.fundarMuseo()}
	
	override method valorPersona()= super()+5 
}
class Planeta {
	const habitantes = new Set()
	var property muralla
	var property museos 
	
	method delegacion()= return habitantes.filter{habitante=>habitante.destacada()}
		
	method culto()= (museos>=2) and habitantes.all{habitante=>habitante.inteligencia()>10}
				
	method potenciaReal()= habitantes.sum{habitante=>habitante.potencia()}	
	//mas sobre planetas
	method construir(murallas)=(muralla = muralla+ murallas)
	
	method fundarMuseo()=(museos=museos+1)
	
	method potenciaAparente()= habitantes.zise()*habitantes.max{hab=>hab.potencia()}.potencia()
	
	method reforzar()=(self.potenciaAparente()>=2*self.potenciaReal())
	
	method tributo(planeta)=habitantes.all{hab=>hab.tributo(planeta)}

    method habitantesValiosos()= habitantes.filter{hab=>hab.valorPersona()>40}
    
    method apasiguar(newPlaneta)= self.tributo(newPlaneta)
    
}
class Soldado inherits Persona{ 
	var property armas = new Set()
	
	method potenciaSoldado(soldado)= 20 + armas.sum{arma=>arma.potencia(soldado)} 
	
	override method tributo(planeta){ planeta.construir(5)}
	
}
	
class Pistolete{
	var property largo
	method potencia(soldado){
		if (soldado.edad()>30){return 3*largo}
		else{return 2*largo}
	} 
}
class Espadon inherits Pistolete{
	var property peso 
	
	override method potencia(soldado){
		if(soldado.edad()<40){return peso/2}
		else{return 6 }
	}
}	
	