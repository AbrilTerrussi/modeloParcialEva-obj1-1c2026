import evas1.*
import cuartel1.*

object asuka {
    var puntosDeEntrenamieno = 5
    var ultimoEvaSincronizado = eva01

    method puntosDeEntrenamieno() = puntosDeEntrenamieno

    method puedeSincronizarCon(unEva){
        return unEva.puedeSincronizarse(self)
    }

    method estaSatisfecho(){
        return ultimoEvaSincronizado.campoDeFuerzaAT() > 2115
    }

    method consecDeSincro(unEva){
        ultimoEvaSincronizado = unEva
        puntosDeEntrenamieno = unEva.puntosOtorgados()
    }
}

object shinji {
    const evasSincronizados =[]
    var puntosDeEntrenamieno = 2
    var estaCansado = false

    method puntosDeEntrenamieno() = puntosDeEntrenamieno

    method puedeSincronizarCon(unEva){
        return unEva.puedeSincronizarse(self) &&
                not estaCansado
    }

    method consecDeSincro(unEva){
        puntosDeEntrenamieno = unEva.puntosOtorgados()
        estaCansado = true
        evasSincronizados.add(unEva)
    }

    method estaSatisfecho(){
        return nerv.evas.all({e=> evasSincronizados.contains(e)})
    }

    method descansar(){
        estaCansado = false
    }

}

object rei {
    var puntosDeEntrenamieno = 0
    var cantidadDeSincros = 0

    method puntosDeEntrenamieno() = puntosDeEntrenamieno
    method cantidadDeSincros() = cantidadDeSincros

    method puedeSincronizarCon(unEva){
        return  unEva.puedeSincronizarse(self) &&
                unEva.campoDeFuerzaAT() <= 2110 &&
                cantidadDeSincros < 5
    }

    method consecDeSincro(unEva){
        puntosDeEntrenamieno = unEva.puntosOtorgados()
        cantidadDeSincros = cantidadDeSincros + 1
    }

    method estaSatisfecho(){
        return cantidadDeSincros > 0
    }

    method cantidadTotalDeSincrosPosibles() = 5



}