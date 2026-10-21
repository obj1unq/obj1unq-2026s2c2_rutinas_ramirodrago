class Rutinas{
    var property intensidad  = 0
        method caloriasConsumidas(tiempo){
            return 100 * (tiempo - self.tiempoDeDescanso(tiempo)) * intensidad
        }
        method tiempoDeDescanso(tiempo)       
}
class Running inherits Rutinas{
        override method tiempoDeDescanso(tiempo){
            return if(tiempo > 20 ) { 5 } else {2}
     }
}
class Maraton inherits Running{
        override method caloriasConsumidas(tiempo){
            return super(tiempo) * 2
        }
}
class Remo inherits Rutinas{
    const intensidadDelRemo = 1.3
        override method caloriasConsumidas(tiempo){
            return 100 * (tiempo - self.tiempoDeDescanso(tiempo)) * intensidadDelRemo
        }
        override method tiempoDeDescanso(tiempo){
            return tiempo / 5
        }

}
class RemoCompeticion inherits Remo{
    const intensidadDeCompetencia = 1.7
        override method caloriasConsumidas(tiempo){
            return 100 * (tiempo - self.tiempoDeDescanso(tiempo)) * intensidadDeCompetencia
        }
        override method tiempoDeDescanso(tiempo){
            return ((tiempo/ 5) - 3).max(2)
        }
}
class Persona{
    var property peso = 0 
        method pesoPerdido(rutina){
            return  (rutina.caloriasConsumidas(self.tiempo()) / self.caloriasPorKilo())
        }
        method hacerRutina(rutina){
            peso = peso - self.pesoPerdido(rutina)
        }
        method caloriasPorKilo()
        method validarpuedoHacerRutina(rutina)
        method tiempo()
}
class PersonaSedentaria inherits Persona{
    var property tiempoDeLaPersona = 0
       override method caloriasPorKilo(){
        return 7000
       }
       method tiempo(){
        return tiempoDeLaPersona
       }
       override method hacerRutina(rutina){
        self.validarpuedoHacerRutina(rutina)
        super(rutina)
       }
       override method validarpuedoHacerRutina(rutina){
            if (peso <= 50){self.error("peso menos de 50 kilos, puedo seguir comiendo")}
       }
}
class PersonaAtleta inherits Persona {      
      override method pesoPerdido(rutina){
        return super(rutina) - 1
      }
      override method caloriasPorKilo(){
        return 8000
      }
      override method hacerRutina(rutina){
        self.validarpuedoHacerRutina(rutina)
        super(rutina)
      }
      override method validarpuedoHacerRutina(rutina){
       if (rutina.caloriasConsumidas(self.tiempo()) <=10000) {self.error("la rutina no consume las colorias necesarias")}
      }
       method tiempo(){
        return 90
       }  
}   