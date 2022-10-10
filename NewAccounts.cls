public class NewAccounts {
    public static void sObjectsInsert(Integer value){
        Integer counter = 1;
        //crea una lista para agregar cuentas
        List<Account> teaFactoryAccounts = new List<Account>();
        while(counter <= value){
            //muestra el valor del contador
            System.debug('Counter Value before Incrementing'+ counter);
            //Crea una nueva cuenta
            Account store = new Account();
            store.Name = 'The Tea Factory' + counter;
            store.AccountNumber = '35629' + counter;
            teaFactoryAccounts.add(store);
            System.debug(teafactoryAccounts);
            //Incrementa el contador
            counter = counter + 1;
            System.debug('Counter Value after incrementing' + counter);
        }
        System.debug('Size of Account List' + teaFactoryAccounts.size());
        System.debug('Elements in Account List' + teaFactoryAccounts);
        //Agrega todas las cuentas en la lista
        insert teaFactoryAccounts;
    }

}
