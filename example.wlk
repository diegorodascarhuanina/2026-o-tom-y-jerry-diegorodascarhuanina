object pepita {
  var energy = 100

  method energy() = energy

  method fly(minutes) {
    energy = energy - minutes * 3
  }
}

//

object casa{

    var cuidador = tom
    var quilombero = pandilla

    var suciedad = 600

    method interrumpirSuenoCuidador(){  
    
    cuidador.interrumpirSueno()
      
      }    
    
    method reducirSuciedad(valor){  
    
    suciedad = suciedad - valor

    }

    method aumentarSuciedad(valor){  
    
    suciedad = suciedad + valor

    }

    method limpiar(){

      suciedad = 0

    }

    method tieneQuilombero() = quilombero != null

    method pasarDia(){

      cuidador.limpiarCasa(self)

      if(self.tieneQuilombero() && cuidador.atrapar(quilombero)){

      quilombero = null

      }

    }

    method pasarNoche(){

    cuidador.dormir() 

    if(self.tieneQuilombero()){

    quilombero.quilombo(self)

    }

    }

    method cambiarCuidador(otroCuidador){

    cuidador = otroCuidador

    }

    method quilombero(otroQuilombero){

    quilombero = otroQuilombero

    }

}



object tom{

    var energia = 400

    method energia() = energia

    method interrumpirSueno(){

    energia -= 20

    }

    method limpiarCasa(casa){
    
    casa.reducirSuciedad(100)
    energia -=40    

    } 

    method velocidad() = 5 + energia.div(10)

    method atrapar(quilombero) = self.velocidad() > quilombero.velocidad()

    method dormir(){

    energia += 50

    }


}


object jerry{


    var peso = 9

    method quilombo(casa){

    casa.aumentarSuciedad(110)
    peso += 1 

    }

    method velocidad() = 10 - peso


}

object tuffy{

    method velocidad() = 10

    method quilombo(casa){

      casa.interrumpirSuenoCuidador()

    }

}


object roboCat{

    method limpiarCasa(casa){

    casa.limpiar()

    }

    method atrapar(quilombero) = true

    method dormir(){}

    method interrumpirSueno(){}

}

object pandilla{

  var miembros = [jerry,tuffy]

  method velocidad() = miembros.map({miembro=> miembro.velocidad()}).min().div(2)

  method quilombo(casa){

    miembros.forEach({miembro => miembro.quilombo(casa)})

    if(miembros.size() > 3){
    
    casa.interrumpirSuenoCuidador() 
    
    }

  }

}