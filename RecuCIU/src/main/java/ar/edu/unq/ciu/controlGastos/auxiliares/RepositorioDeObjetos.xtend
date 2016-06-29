package ar.edu.unq.ciu.controlGastos.auxiliares

import java.util.ArrayList
import ar.edu.unq.ciu.controlGastos.dominio.Usuario
import ar.edu.unq.ciu.controlGastos.excepciones.NoExisteElUsuario
import ar.edu.unq.ciu.controlGastos.excepciones.ContraseniaIncorrecta

class RepositorioDeObjetos {
	
	ArrayList<Usuario> usuarios
	
	new(){
		usuarios = new ArrayList<Usuario>()
	}
	
	def login(String usuario, String password){
        validarExistenciaDeUsuario(usuario)
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
    	return usuarios.findFirst[usuario | usuario.usuario == user]
    }
    
    def validarExistenciaDeUsuario(String usuarioId){
        if(!(existeElUsuario(usuarioId))) {
            throw new NoExisteElUsuario
        }
    }
	
	def existeElUsuario(String user) {
		usuarios.exists[usuario| usuario.usuario == user]
	}
	
}