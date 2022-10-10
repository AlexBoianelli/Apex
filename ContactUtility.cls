// Practica SOQL Para Salesforce
public class ContactUtility {
    public static void viewContacts(){
        //Almacenamos en una lista, los datos requeridos en la base de datos
        //para el Objeto "Contact" Los campos requeridos son FirstName, LastName
        List<Contact> listOfContacts = [SELECT FirstName, LastName FROM Contact];
        //Recorremos la lista de contactos- Contact es el tipo de dato, con la variable
        for (Contact con : listOfContacts){
            //Concatenamos el apellido y el nombre en una variable
             String fullName = 'First Name: ' + con.FirstName + ' , ' + 'Last Name: ' + con.LastName;
             system.debug(fullName);
            
        }
    }

}
