class Pajaros {
	var property ira
	var property cantIra
	
	method fuerza()= 2*ira 
	
	method enojarse()= (ira = 2*ira)
	

	method alterarIra(cant)=( ira= ira+(cant))
			
}
class Red inherits Pajaros{
	
	override method fuerza()= ira*10*cantIra
	
	override method enojarse()=(cantIra=cantIra+1)
			
}
class Bomb inherits Pajaros{
	var property tope = 9000
	
	
	override method fuerza(){
		if(super()<=tope){return super()}
		else {return ira}
	}
}
class Chuck inherits Pajaros{
	var property velocidad
	
	override method fuerza(){
		if(velocidad<=80){return 150}
		else {return (150 + velocidad.div(5))}
	}
	override method enojarse()=(velocidad = 2*velocidad)
	 
	 
}
class Terence inherits Pajaros{
	var property multiplicador
	override method fuerza()= (ira+cantIra)* multiplicador
	
	override method enojarse(){
		 ira = 2*ira
		 cantIra = cantIra+1
		 return ira
	}
}
class Matilda inherits Pajaros {
	var property huevos 
	
	override method fuerza()= 2*ira + 2*huevos
	
	override method enojarse()=(huevos= huevos+ 2)
		 
}

const pajaro1 = new Pajaros(ira =20,cantIra=1)
const red1 = new Red(cantIra=2,ira=25,cantIra=1)
const bomb1 = new Bomb(ira= 25,cantIra=1)
const chuck1 = new Chuck(velocidad=80,ira=20,cantIra=1)
const terence1 = new Terence(multiplicador = 10,ira = 25,cantIra=1)
const matilda1 = new Matilda(ira = 15,huevos=0,cantIra=1)


object islaPajaro{
	const habPajaros = [pajaro1,red1,bomb1,chuck1,terence1,matilda1]
	
	method sesionDeIra(){
		 habPajaros.map{pajaro =>pajaro.alterarIra(-5)}
	}
	method invasionCerdo(cantcerdos){
		habPajaros.map{pajaro=>pajaro.alterarIra(cantcerdos.div(100))}
	}
	
	}
	
const cerdo1 = new CerdosObreros()
const cerdo2 = new CerdosObreros()

const cerdoarm1 = new CerdosArmados(resisCasco=5,resisEscudo = 8)
const cerdoarm2 = new CerdosArmados(resisCasco=5,resisEscudo = 8)

const paredVidrio1 = new Vidrio(anchoPared = 5 )
const paredMadera1 = new Madera(anchoPared = 10)
const paredPiedra1 = new Piedra(anchoPared = 5 )


object islaCerdito{
	//const habCerdos =[cerdo1,cerdo2,cerdoarm1,cerdoarm2]
	const obstaculos =[paredVidrio1,paredMadera1,paredPiedra1] 
	
	method colision(pared,pajaro){
		if (pajaro.fuerza()>pared.resistencia()){obstaculos.filter{pared}}
	    else {}
	    
	
	}
	
}

	
//obtaculos 
class Vidrio{
	var anchoPared
	method resistencia()= 10*anchoPared
}
class Madera inherits Vidrio{
	override method resistencia()= 25*anchoPared
}
class Piedra inherits Vidrio{
	override method resistencia()= 50*anchoPared
}

// cerdos 
class CerdosObreros {
	method resistencia()= 50
}

class CerdosArmados inherits CerdosObreros{
	var resisCasco
	var resisEscudo
	override method resistencia() =( resisCasco*10 + resisEscudo*10) 
			
}









