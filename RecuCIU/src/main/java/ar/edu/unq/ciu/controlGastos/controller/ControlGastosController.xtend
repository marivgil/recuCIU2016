package ar.edu.unq.ciu.controlGastos.controller

import org.uqbar.xtrest.result.ResultFactory
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import ar.edu.unq.ciu.controlGastos.auxiliares.RepositorioDeObjetos
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.commons.model.UserException
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Put
import ar.edu.unq.ciu.controlGastos.minificados.Minificador

@Controller
class ControlGastosController extends ResultFactory {
	
	@Extension
  	private JSONUtils jSONUtils = new JSONUtils();
  
  	private RepositorioDeObjetos repositorio;
  
  	private Minificador minificador;
  
  new() {
    repositorio = new RepositorioDeObjetos();
    minificador = new Minificador
  }
  
  @Post('/login/:usuario/:password')
  	def Result login() {
  		val user = String.valueOf(usuario)
		val pass = String.valueOf(password)
		try {
			repositorio.login(user, pass)
			ok();
		} catch (UserException e) {
			notFound(e.message)
		}
	}
	
	@Put('/registracion/:nombreUsuario/:password')
	def registracion(){
		response.contentType = "application/json"
		val nomUsuario = String.valueOf(nombreUsuario)
		val contrasenia = String.valueOf(password)
		try{
			repositorio.registrarUsuario(nomUsuario, contrasenia)
			ok()
		} catch (UserException e) {
			notFound(e.message);
		}

	}	

	@Put('/nuevoGasto/:nombreUsuario/:descripcion/:monto')
	def nuevoGasto(){
		response.contentType = "application/json"
		val nomUsuario = String.valueOf(nombreUsuario)
		val desc = String.valueOf(descripcion)
		val valor = Integer.valueOf(monto)
		
		try{
			ok(minificador.minificaGasto(repositorio.registrarGasto(nomUsuario, desc, valor)).toJson)
		} catch (UserException e) {
			notFound(e.message);
		}

	}
  
  def static void main(String[] args) {
        XTRest.start(ControlGastosController, 9000)
  }
	
	
	
}