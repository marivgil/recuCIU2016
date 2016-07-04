package ar.edu.unq.ciu.controlGastos.auxiliares

import ar.edu.unq.ciu.controlGastos.dominio.Detalle
import ar.edu.unq.ciu.controlGastos.dominio.Gasto
import ar.edu.unq.ciu.controlGastos.dominio.Usuario
import ar.edu.unq.ciu.controlGastos.excepciones.ContraseniaIncorrecta
import ar.edu.unq.ciu.controlGastos.excepciones.ErrorContraseniaCaracterNumerico
import ar.edu.unq.ciu.controlGastos.excepciones.ErrorEnLongitudContrasenia
import ar.edu.unq.ciu.controlGastos.excepciones.ErrorValorNulo
import ar.edu.unq.ciu.controlGastos.excepciones.ExisteElUsuario
import ar.edu.unq.ciu.controlGastos.excepciones.NoExisteElUsuario
import java.util.ArrayList
import java.time.LocalDate

class RepositorioDeObjetos {
	
	ArrayList<Usuario> usuarios
	
	new(){
		usuarios = new ArrayList<Usuario>()
	}
	
	def login(String usuario, String password){
        validarInexistenciaDeUsuario(usuario)
        validarPassword(usuario, password)
    }
    
    def validarPassword(String usuario, String password){
    	val user = buscarUsuario(usuario)
    	if (!(user.pass == password))
    		throw new ContraseniaIncorrecta
    }
    
    /**
     * PRE: el usuario existe
     */
    def buscarUsuario(String user){
    	return usuarios.findFirst[usuario | usuario.nombre == user]
    }
    
    def validarInexistenciaDeUsuario(String usuarioId){
        if(!(existeElUsuario(usuarioId))) {
            throw new NoExisteElUsuario
        }
    }

    def validarExistenciaDeUsuario(String usuarioId){
        if(existeElUsuario(usuarioId)) {
            throw new ExisteElUsuario
        }
    }
	
	def existeElUsuario(String user) {
		usuarios.exists[usuario| usuario.nombre == user]
	}
	
	def registrarUsuario(String nombre, String contrasenia){
		validarValoresNulos(nombre, contrasenia)
		validarExistenciaDeUsuario(nombre)
		validarFormatoPassword(contrasenia)
		crearUsuario(nombre, contrasenia)
	}
	
	def validarValoresNulos(String nom, String pass) {
		validarCampoNulo(nom)
		validarCampoNulo(pass)
	}
	
	def validarCampoNulo(String valor) {
		if (valor == '' || valor==null){
			throw new ErrorValorNulo(valor)
		}
	}
	
	def validarFormatoPassword(String contrasenia){
		validarLongitud(contrasenia)
		validarCaracterNumerico(contrasenia)
	}
	
	/**
	 * PRO: La contrasenia debe tener al menos 5 caracteres
	 */
	def validarLongitud(String contrasenia){
		if (contrasenia.length<5){
			throw new ErrorEnLongitudContrasenia	
		}
	}
	
	/**
	 * PRO: La contrasenia debe contener por lo menos un caracter numerico 
	 */
	def validarCaracterNumerico(String contrasenia){
		if(!tieneNumeros(contrasenia)){
			throw new ErrorContraseniaCaracterNumerico
		}
	}

	def tieneNumeros(String pass) {
		var i=0
    	for(i=0; i < pass.length(); i++) {
        	var caracter = pass.charAt(i);
        	if(!Character.isLetterOrDigit(caracter)) {
        		return false;
        	}
    }
    return true;
}
	
	def crearUsuario(String nombre, String contrasenia){
		val usuario = new Usuario()
		usuario.nombre = nombre
		usuario.pass = contrasenia
		usuarios.add(usuario)
	}
	
	def registrarGasto(String usuario, String descripcion, Integer monto) {
		val user = buscarUsuario(usuario)
		if (!(existeGastoParaUsuario(user, descripcion))){
			user.agregarGasto(nuevoGasto(descripcion,monto), monto)
		}else{
			val gasto = buscarGasto(user, descripcion)
			gasto.agregarDetalle(nuevoDetalle(monto))
		}
		user
	}
	
	def existeGastoParaUsuario(Usuario usuario, String concepto) {
		usuario.gastos.exists[gasto| gasto.concepto == concepto]
	}
	
	def buscarGasto(Usuario user, String desc){
    	user.gastos.findFirst[gasto| gasto.concepto == desc]
    }
	
	def nuevoGasto(String descripcion, Integer monto){
		val gasto = new Gasto
		gasto.concepto = descripcion
		val detalle = nuevoDetalle(monto)
		gasto.agregarDetalle(detalle)
		gasto
	}
	
	def nuevoDetalle(Integer monto){
		val fecha = LocalDate.now()
		val detalle = new Detalle
		detalle.monto = monto
		detalle.anio = fecha.year
		detalle.mes = fecha.month
		detalle
	}
	
	def buscarDescripcion(String nomUsuario, String descripcion) {
		val user = buscarUsuario(nomUsuario)
		val gasto = buscarGasto(user, descripcion)
		gasto
	}
	
	def buscarIndiceInflacion(String nomUser, String desc, Long fecha){
		
	}
	
}