class Personas{
	var property edad 
	
	
	method inteligencia(){
		if (edad.between(20,40)){return 12}
		else {return 8}	
	}
	method potencia()= 20 
	
	method destacada(){
		if (edad == 25){return edad == 25}
		else if (edad == 35){return edad ==35}
		else {return false}
	}
	method tributo(planeta){}
	
	method valorPersona(){
		return (self.inteligencia()+self.potencia())
	}	
}
class Atleta inherits Personas{
	var property masaMuscular = 4
	var property tecnicas = 2 
	
	override method potencia() = super() + (masaMuscular*tecnicas) 
	
	override method destacada()= super() || tecnicas> 5 
	
	method entrenar(dias){ 
		masaMuscular = masaMuscular + dias.div(5) 
		return masaMuscular
	}
	method aprenderTecnica(){
		tecnicas = tecnicas + 1
		return tecnicas 
	}
	override method tributo(planeta){
		planeta.contruir(2)
	}
}
class Docente inherits Personas {
	var property cursos = 0 
	
	override method inteligencia() = super() + 2*cursos
    
    override method destacada(){
       if(cursos>3){return cursos>3}
    else {return false}
    }
    override method tributo(planeta){
		planeta.fundarMuseo()
	}
	override method valorPersona()= super()+ 5
}
class Planeta{
	var property habitantes = new Set()
	
	var property museos 
	
	var murallas
	
	method delegacion(){
		return habitantes.filter{hab=>hab.destacada()}
	}
	
	method planetaCulto(){
		return (museos>=2 and habitantes.all{hab=> hab.inteligencia() >= 10}) 
	}
	
	method potenciaReal(){
		return habitantes.sum{hab=>hab.potencia()}
	}
	///mas planetas
	method construir(cant){
		murallas = murallas + cant
	}
	method fundarMuseo(){
		museos = museos + 1 
	}
	method potenciaAparente(){
		return habitantes.size()*habitantes.max{hab=>hab.potencia()}.potencia()
	}
	method reforzamiento(){
		if(self.potenciaAparente()>= self.potenciaReal()){return self.potenciaAparente()>= self.potenciaReal()}
		else {return false}
	}
	method tributos(planeta){
		habitantes.map{hab=>hab.tributo(planeta)}
	}
	method habitantesValiosos(){
		return habitantes.filter{hab=>hab.potencia()>=40}
	}
	method apasiguar(planetax){
		const hab =self.habitantesValiosos()
	    hab.tributos(planetax)
	}
}
class Soldado{
	const armas = new Set()
	const property edad 
	method potencia(soldado){
		return 20 + armas.sum{arma=>arma.potencia(soldado)}
	}
	method tributo(planeta){
		planeta.construir(5)
	}
}
class Pistolete{
	const longitud 
	method potencia(soldado){
		if(soldado.edad()>30){return 3*longitud}
		else {return 2*longitud}
	}
}
class Espadon inherits Pistolete{
	var property peso 
	
	override method potencia(soldado){
		if (soldado.edad()<40){return peso/2}
		else {return 6}
	}
}






