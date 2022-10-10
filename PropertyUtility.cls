//Buscamos las propiedades por nombre, los dias que llevan en venta, y el email del agente a cargo
public class PropertyUtility {
    public static void newListedProperties(){
        List<Property__c> newPropList = [SELECT Name,Days_On_Market__c, Broker__r.Email__c FROM Property__c Where Days_On_Market__c <= 30];    
              for (Property__c pro : newPropList){
              String propEmail = pro.Name + ':' + pro.Broker__r.Email__c;
              system.debug(propEmail);  
                }
    }
    

}
