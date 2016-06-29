package ar.edu.unq.ciu.controlGastos.controller

import org.uqbar.xtrest.result.ResultFactory
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import ar.edu.unq.ciu.controlGastos.auxiliares.RepositorioDeObjetos
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.commons.model.UserException
import org.uqbar.xtrest.api.Result

@Controller
class ControlGastosController extends ResultFactory {
	
	@Extension
  	private JSONUtils jSONUtils = new JSONUtils();
  
  	private RepositorioDeObjetos repositorio;
  
  	//private Minificador minificador;
  
  new() {
    repositorio = new RepositorioDeObjetos();
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
  
  def static void main(String[] args) {
        XTRest.start(ControlGastosController, 9000)
  }
	
	
	
}