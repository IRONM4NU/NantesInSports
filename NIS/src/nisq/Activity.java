package nisq;

import java.util.LinkedList;
import java.util.List;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.*;
 
@Entity
@Index
@Cache//utilisation de Memcache
public class Activity {
    @Id Long id;
    @Parent Key<Membre> parent; // qui a creer l'événement
    
    String sport; // category 
    String localisation; // adresse 
    String dateCreation; 
    String date; // dd/mm/aaaa hh/mm
    List<Key<Membre>> participant;
    int placesRest; // nombres de places restantes
     
    private Activity(){}
    public Activity(
    		Key<Membre> parent,
    		String sport,
    		String localisation, 
    		String dateCreation,
    		String date,
    		List<Key<Membre>> participant,
    		int placesRest	)
    {
    this.parent = parent;
    this.sport = sport;
    this.localisation = localisation;
    this.date = date;
    this.dateCreation = dateCreation;
    this.participant = participant;
    this.participant.add(parent);
    this.placesRest = placesRest;
    	
    }
	public String getDateCreation() {
		return dateCreation;
	}
	public void setDateCreation(String dateCréation) {
		this.dateCreation = dateCréation;
	}
	public Key<Membre> getParent() {
		return parent;
	}
	public void setParent(Key<Membre> parent) {
		this.parent = parent;
	}
	public String getSport() {
		return sport;
	}
	public void setSport(String sport) {
		this.sport = sport;
	}
	public int getPlacesRest() {
		return placesRest;
	}
	public void setPlacesRest(int placesRest) {
		this.placesRest = placesRest;
	}
	public String getLocalisation() {
		return localisation;
	}
	public void setLocalisation(String localisation) {
		this.localisation = localisation;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public List<Key<Membre>> getParticipant() {
		return participant;
	}
	public void setParticipant(List<Key<Membre>> participant) {
		this.participant = participant;
	}


}
