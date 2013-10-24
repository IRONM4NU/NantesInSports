package nisq;

import com.googlecode.objectify.annotation.*;
import java.util.*;

@Entity
@Index
@Cache//utilisation de Memcache
public class Membre {
		
		public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public List<String> getPreference() {
		return preference;
	}

	public void setPreference(List<String> preference) {
		this.preference = preference;
	}

		@Id String id;
	    String nom;
	    List<String> preference;
	    
	    
	    private Membre() {} // Obligatoire pour Objectify
	 
	    public Membre(String nickNameGoogle, String idGoogle) {
	    	this.id = idGoogle; // id fournit par google ( user.getUserId )
	        this.nom = nickNameGoogle;
	    }
}




