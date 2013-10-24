package nisq;

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
    String date; //heure jour mois annee
    List<Membre> participant;
    int places; // nombres max de participants 
     
    private Activity(){}
    public Activity(
    		Key<Membre> parent,
    		String sport,
    		String localisation, 
    		String date,
    		List<Membre> participant,
    		int places )
    {
    this.parent = parent;
    this.sport = sport;
    this.localisation = localisation;
    this.date = date;
    this.participant = participant;
    this.places = places;
    	
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
	public List<Membre> getParticipant() {
		return participant;
	}
	public void setParticipant(List<Membre> participant) {
		this.participant = participant;
	}
	public int getPlaces() {
		return places;
	}
	public void setPlaces(int places) {
		this.places = places;
	} 

}
