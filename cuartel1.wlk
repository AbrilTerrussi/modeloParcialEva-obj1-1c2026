object nerv {
    const evas= []
    const pilotos =[]

    method registrarEvas(eva){
        evas.add(eva)
    }
    method registrarPilotos(piloto){
        pilotos.add(piloto)
    }

    method intentarSincronizarEvaConPiloto(eva, piloto){
        if (eva.puedeSincronizarse(piloto)){
            eva.consecDeSincro()
            piloto.consecDeSincro(eva)
        }else{
            ("no se pudo sincronizar")
        }
    }

    method puedeSincronizarUnEvaYUnPiloto(eva,piloto){
        return eva.puedeSincronizarse(piloto) &&
                piloto.puedeSincronizarCon(eva)
    }

    method sincronizarUnPilotoConTodosLosEvas(piloto){
        evas.forEach({e=> self.intentarSincronizarEvaConPiloto(e, piloto)})
    }

    method sumnaDePuntosEntrenamiento(){
        return pilotos.sum({p=> p.puntosDeEntrenamieno()})
    }
    method promedioDePuntosDeEntrenPilotos(){
        return self.sumnaDePuntosEntrenamiento() / pilotos.size()
    }

    method pilotoConMayorPuntosDeEntren(){
        return pilotos.max({p=> p.puntosDeEntrenamieno()})
    }

    method listaValoresCampoAT(){
        evas.map({e=> e.campoDeFuerzaAT()})
    }

    method evasEnCondicionesDeUsarPor(piloto){
        return evas.filter({e=> self.puedeSincronizarUnEvaYUnPiloto(e, piloto)})
    }

    method todosLosPilotosPuedenUsarAlgunEva(){
        return pilotos.all({p=> self.algunEvaPuedeSerUsadoPor(p)})
    }

    method algunEvaPuedeSerUsadoPor(piloto){
        return evas.any({e=> e.puedeSincronizarse(piloto)})
    }

    method pilotoEstaSatisfecho(piloto){
        return piloto.estaSatisfecho()
    }

    method puedeSincronizarUnPilotoConTodosLosEvas(piloto){
        return evas.all({e=> self.intentarSincronizarEvaConPiloto(e, piloto)})
    }

}