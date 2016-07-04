package ar.edu.unq.ciu.controlGastos.minificados

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.ciu.controlGastos.dominio.Detalle
import java.util.ArrayList

@Accessors
class IndiceMinificado {
	Integer indiceInflacion
	ArrayList<Detalle> detalles
	
	new(){
		detalles = new ArrayList<Detalle>
	}
}