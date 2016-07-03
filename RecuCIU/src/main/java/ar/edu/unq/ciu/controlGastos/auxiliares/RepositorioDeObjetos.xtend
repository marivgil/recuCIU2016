package ar.edu.unq.ciu.controlGastos.auxiliares

import java.util.ArrayList
import ar.edu.unq.ciu.controlGastos.dominio.Usuario
import ar.edu.unq.ciu.controlGastos.excepciones.NoExisteElUsuario
import ar.edu.unq.ciu.controlGastos.excepciones.ContraseniaIncorrecta
import ar.edu.unq.ciu.controlGastos.excepciones.ErrorEnLongitudContrasenia
import ar.edu.unq.ciu.controlGastos.excepciones.ErrorContraseniaCaracterNumerico
import ar.edu.unq.ciu.controlGastos.excepciones.ExisteElUsuario

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
		//validarExistenciaDeUsuario(nombre)
		//validarFormatoPassword(contrasenia)
		crearUsuario(nombre, contrasenia)
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
	
	//REFACTOR
	def tieneNumeros(String contrasenia){
		val	numeros='0123456789'
		var i=0
   		for(i=0; i<contrasenia.length; i++){
   			if (numeros.indexOf(contrasenia.charAt(i),0) != -1){
   				return true
         	}
        }
   		return false;
	} 
	
	def crearUsuario(String nombre, String contrasenia){
		val usuario = new Usuario()
		usuario.nombre = nombre
		usuario.pass = contrasenia
		usuarios.add(usuario)
	}
}