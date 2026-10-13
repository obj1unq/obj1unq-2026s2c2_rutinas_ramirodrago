class Rutinas{
    var property intensidad
    var property tiempo
        method caloriasConsumidas(){
            return 100 * (tiempo - self.tiempoDeDescanso()) * intensidad
        }
        method tiempoDeDescanso()        
}
class Running inherits Rutinas{
        override method tiempoDeDescanso(){
            return if(tiempo > 20 ) { 5 } else {2}
     }
}
class Maraton inherits Running{
        override method caloriasConsumidas(){
            return super() * 2
        }
}
class Remo inherits Rutinas{
    const intensidadDelRemo = 1.3
        override method caloriasConsumidas(){
            return 100 * (tiempo - self.tiempoDeDescanso()) * intensidadDelRemo
        }
        override method tiempoDeDescanso(){
            return tiempo / 5
        }

}
class RemoCompeticion inherits Remo{
    const intensidadDeCompetencia = 1.7
        override method caloriasConsumidas(){
            return 100 * (tiempo - self.tiempoDeDescanso()) * intensidadDeCompetencia
        }
        override method tiempoDeDescanso(){
            return (tiempo - 3).max(2)
        }
}
class Persona{
    var peso 
    var rutina = null
        method pesoPerdido(){
            return rutina.caloriasConsumidas() / self.caloriasPorKilo()
        }
        method hacerRutina(){
            peso = peso - self.pesoPerdido()
        }
        method agregarRutina(_rutina){
            rutina = _rutina
        }
        method caloriasPorKilo()
}
class Sedentaria inherits Persona{
       override method caloriasPorKilo(){
        return 7000
       }
       override method hacerRutina(){
        if (peso >= 50) {super()}
       }
       method tiempoQueVoyAEntrenar(_tiempo){
        rutina.tiempo(_tiempo)
       }
}
class Atleta inherits Persona {     
      override method pesoPerdido(){
        return super() - 1
      }
      override method caloriasPorKilo(){
        return 8000
      }
      override method hacerRutina(){
        if(rutina.caloriasConsumidas() > 10000) {super()}
      }
      override method agregarRutina(_rutina){
        rutina = _rutina
        rutina.tiempo(90)
      }  
}   