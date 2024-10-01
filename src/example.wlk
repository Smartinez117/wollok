class Matematica{
	const cantLibros = 50
	method copiasDeCadauno() = 5
}
class Fisica inherits Matematica {
	const autores = 5
	method nuevaCantidad(librosAgregados)= return self.copiasDeCadauno()*(autores + librosAgregados)
}
class Python inherits Fisica{
	override method nuevaCantidad(librosDigitales) = return super(super (librosDigitales))
	override method copiasDeCadauno() = 1000
}
class Discreta inherits Fisica(autores = 100){}
// un poco flashero la cantidad pero cualquiera de primero no lo veria raro xd 


