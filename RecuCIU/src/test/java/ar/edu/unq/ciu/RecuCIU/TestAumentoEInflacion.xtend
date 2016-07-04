package ar.edu.unq.ciu.RecuCIU

import org.junit.Before
import org.junit.Test
import ar.edu.unq.ciu.controlGastos.dominio.Usuario
import ar.edu.unq.ciu.controlGastos.dominio.Gasto
import ar.edu.unq.ciu.controlGastos.dominio.Detalle
import java.time.LocalDate
import static org.assertj.core.api.Assertions.*

class TestAumentoEInflacion {
	
	Usuario usuario
	Gasto gasto1
	Gasto gasto2
	Detalle detalleLuz1
	Detalle detalleLuz2
	Detalle detalleGas1
	Detalle detalleGas2
	
	@Before
    def void setUp(){
    	usuario = new Usuario
    	
    	gasto1 = new Gasto
    	gasto1.concepto = "luz"
    	
    	detalleLuz1 = new Detalle
    	detalleLuz1.anio=2016 
    	detalleLuz1.monto=200 
    	detalleLuz1.mes=LocalDate.now().month

    	detalleLuz2 = new Detalle
    	detalleLuz2.anio=2016 
    	detalleLuz2.monto=400 
    	detalleLuz2.mes=LocalDate.now().month
    	
    	gasto1.agregarDetalle(detalleLuz1)
    	gasto1.agregarDetalle(detalleLuz2)
    	
    	usuario.agregarGasto(gasto1)
    	
    	gasto2 = new Gasto
    	gasto2.concepto = "gas"
    	
    	detalleGas1 = new Detalle
    	detalleGas1.anio=2016 
    	detalleGas1.monto=600 
    	detalleGas1.mes=LocalDate.now().month
    	
    	gasto2.agregarDetalle(detalleGas1)
    	   	
    	detalleGas2 = new Detalle
    	detalleGas2.anio=2016 
    	detalleGas2.monto=600 
    	detalleGas2.mes=LocalDate.now().month
    	gasto2.agregarDetalle(detalleGas2)
    	
    	usuario.agregarGasto(gasto2)
    }

    @Test
    def void testGastadoUsuario(){
    	assertThat(usuario.totalGastado.equals(1200))
    }
    
    @Test
    def void testAumento(){
    	assertThat((usuario.gastos.get(0).detallesMensuales.get(1).aumentoParcial.equals(100)))
    	/* la cuenta es
    	 * 400-200=200/200=1*100=100
    	 */
    }
    
    @Test
    def void testIndiceInflacionario(){
    	assertThat(usuario.gastos.get(0).indiceInflacion.equals(100))
    	assertThat(usuario.gastos.get(1).indiceInflacion.equals(0))
    }
}