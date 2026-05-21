object eva01 {
    var campoDeFuerzaAT = 2110
    var energia = 100

    method campoDeFuerzaAT() = campoDeFuerzaAT
    method energia() = energia

    method puedeSincronizarse(unPiloto){
        return unPiloto.puntosDeEntrenamiento() > 4 &&
                energia > 30
    }

    method puntosOtorgados() = 2

    method consecDeSincro(){
        energia = energia - 25
        campoDeFuerzaAT = (campoDeFuerzaAT + 1).min(2150)
    }

    method recargaDeEnergia(horas){
        energia = energia + 30* horas
    }

}

object eva02 {
    var energia = 100
    var modo = estandar
    
    method campoDeFuerzaAT() = 2114
    method modo() = modo
    method energia() = energia

    method puedeSincronizarse(unPiloto){
        return unPiloto.puntosDeEntrenamiento() >= 2 &&
                energia > 20
    }

    method puntosOtorgados() = modo.puntosQueDa()

    method consecDeSincro(){
        energia = energia - modo.consumo()
    }

    method recargaDeEnergia(horas){
        energia = energia + 100.min(25*horas)
    }

    method cambiarModo(unModo){
        modo = unModo
    }
}
//----- modos de combate eva 02--------
object estandar {
    method puntosQueDa() = 1
    method consumo() = 10
}
object ataque {
    method puntosQueDa() = 3
    method consumo() = 20
}
object berserk {
    method puntosQueDa() = 6
    method consumo() = 35
}
//------------------------------------

object eva00 {
    var campoDeFuerzaAT = 2100
    
    method campoDeFuerzaAT() = campoDeFuerzaAT
    method puntosOtorgados() = 1

    method puedeSincronizarse(unPiloto){
        return true
    }

    method mejorarCampoAT(unValor){
        campoDeFuerzaAT = 2150.min(campoDeFuerzaAT + unValor)
    }

    method consecDeSincro(){}
}