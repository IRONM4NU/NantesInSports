package nisq;

import java.util.LinkedList;
import java.util.List;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.annotation.*;
 
@Entity
@Index
@Cache//utilisation de Memcache
public class Preference {
	
    @Id Long id;
    @Parent Key<Membre> parent; // qui a creer l'événement
    
    String sport1; // category 
    String localisation1; // adresse 
    
    String sport2; // category 
    String localisation2; // adresse 
    
    String sport3; // category 
    String localisation3; // adresse    
     
    private Preference(){}
    public Preference(
    		Key<Membre> parent,
    		String sport1,
    		String localisation1, 
    		String sport2,
    		String localisation2,
    		String sport3,
    		String localisation3    		
    		 )
    {
    this.parent = parent;
    this.sport1 = sport1;
    this.localisation1 = localisation1;
    this.sport2 = sport2;
    this.localisation2 = localisation2;
    this.sport3 = sport3;
    this.localisation3 = localisation3;
    }
	public Key<Membre> getParent() {
		return parent;
	}
	public void setParent(Key<Membre> parent) {
		this.parent = parent;
	}
	public String getSport1() {
		return sport1;
	}
	public void setSport1(String sport1) {
		this.sport1 = sport1;
	}
	public String getLocalisation1() {
		return localisation1;
	}
	public void setLocalisation1(String localisation1) {
		this.localisation1 = localisation1;
	}
	public String getSport2() {
		return sport2;
	}
	public void setSport2(String sport2) {
		this.sport2 = sport2;
	}
	public String getLocalisation2() {
		return localisation2;
	}
	public void setLocalisation2(String localisation2) {
		this.localisation2 = localisation2;
	}
	public String getSport3() {
		return sport3;
	}
	public void setSport3(String sport3) {
		this.sport3 = sport3;
	}
	public String getLocalisation3() {
		return localisation3;
	}
	public void setLocalisation3(String localisation3) {
		this.localisation3 = localisation3;
	}
 }
