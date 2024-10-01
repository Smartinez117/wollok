//conceptos
//1 polimorfismo , al aplicarles el mismo method devuelven distintos valores
//2 bloques
//3 clases
//4 herencia 
class Persona {// clase abstracta 
    const property nombre 
    var property edad
    method presentarse(){
        return "Hola, soy " + nombre + " y tengo " + edad + " años."
    }
}
class Estudiante inherits Persona { //se pueden instanciar datos delas clases definidas con un () e igualando los valores al valor deseados ademas de usar , 
    const property materiasCursa = new Set() //no puede cursar la misma materia
    const property materiasAprobadas = new Set()
    const property tareas = new Set()
    //polimorfismo ejemplo 1
    override method presentarse(){
         return super() + " Soy estudiante."
    }//polimorfismo ejemplo 2
    method asignarTarea(tarea) {
        tareas.add(tarea)
        return nombre + " ha recibido la tarea: " + tarea
    }      

    method aprobarMateria(materia){
        materiasAprobadas.add(materia)
        materiasCursa.remove(materia)
        return "Materia aprobada: " + materia
    }   //uso de guardas
    method inscribirseMateria(materia){
        if (!materiasCursa.contains(materia)) {
            materiasCursa.add(materia)
            return "Inscripto en: " + materia
        } else {
            return "Ya está inscripto en: " + materia
        }
    }

}
class Profesor inherits Persona {
    var property alumnos = new Set()
    const property materiaQueDicta

    override method presentarse(){ //polimorfismo
         return super() + " Soy profesor"
    }

    method aprobarAlumno(alumno){
        alumno.aprobarMateria(materiaQueDicta)
        alumnos.remove(alumno)
        return alumno + "esta aprobado"
    }
    method aprobarAlumno1(alumno){
        (alumno.materiasCursa()).remove(materiaQueDicta)
    }
    method asignarTarea(tarea) {// bloques y polimorfismo
        return alumnos.map {alumnoDeMateria => alumnoDeMateria.asignarTarea(tarea)} 
    }    
}
class Curso {
    const property profesores = new Set()
    const property alumnos = new Set()

    method alumnosDeMateria(materia){
        return (alumnos.filter{alumnoDeCurso => (alumnoDeCurso.materiasCursa()).any{materiaAlumno => materiaAlumno == materia}}).map {e=>e.nombre()}
    }
    
}
//declaracion de alumnos , profersor y curso 
const tomas = new Estudiante(
    nombre= "tomas", edad =22,
    materiasCursa=["fisica","matematica","programacion","quimica"],
    materiasAprobadas=["discreta","estadistica"],
    tareas=[])
const luis  = new Estudiante(
    nombre= "luis" ,
    edad =22,
    materiasCursa=["fisica","matematica","economia"],
    materiasAprobadas=["quimica","programacion"],tareas=[])
const ana   = new Estudiante(
    nombre= "ana",
    edad =22,
    materiasCursa=["fisicaAplicada","quimica","estadistica"],
    materiasAprobadas=["discreta","legislacion"],
    tareas=[])
//se pueden declarar mas alumnos
const jorge  = new Profesor(
    nombre = "jorge",
    edad =45,
    alumnos = [tomas,luis],
    materiaQueDicta = "fisica")
const german = new Profesor(nombre = "german",
edad =42,
alumnos = [ana,tomas],
materiaQueDicta ="quimica")
//se pueden declarar mas profesor para un curso
const curso1 = new Curso(profesores = [jorge,german],alumnos = [tomas,luis,ana])

const lista1 = [1,2,3,4,5,6,7,8,9,10]
