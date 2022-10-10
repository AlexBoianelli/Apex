public class AccountHandler {
    //creamos un metodo que recibe como parametro un valor
    // numerico con la cantidad de cuentas que queremos crear
    public static void insertAccount(Integer newAccounts){
        // Creamos una lista nueva llamada newAcct
        List<Account> addAccounts = new List<Account>();
        //Creamos una variable numerica y le asignamos el valor 0
        Integer suma = 0;
        //Creamos un bucle con la condicion de que suma sea menor o igual a newAccounts
        while( suma <= newAccounts){
            // creamos una nueva cuenta en  la variable "acct"
            Account acct = new Account();
            //asisgamos a la cuenta un valor para la propiedad "Name"
            acct.Name = 'Acme Inc N' + suma;
            //asignamos a la cuenta un valor para la propiedad "AccountNumber"
            acct.AccountNumber = 'A000n' + suma;
            //Agregamos la cuenta a la lista 
            addAccounts.add(acct);
            //Sumamos 1 al contador sumaAc
            suma++;   
            System.debug('Cuenta creada con exito' +acct);
         }
        //Inserta las cuentas a la base de datos
        insert addAccounts;
        
}
}
