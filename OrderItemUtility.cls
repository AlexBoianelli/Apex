//Creamos la clase
public class OrderItemUtility {
    
    //Creamos un metodo que agrega ramos de bonificacion gratis cuando la orden esta activa
    public static void addBonusBouquet(List<Order> ordersFromTrigger) {
          //TO DO 3.1: Determinar si tenemos un producto extra y obtener su ID para agregar al pedido
            // Usar SOQL para obtener el ID del ramo de bonificación y almacenarlo en una variable de sObject llamada bonusProduct
            List<Product2> bonusProductList = [SELECT Id, ProductCode FROM Product2 WHERE ProductCode = 'BOT-BB-12'];
            Product2 bonusProduct = new Product2();
            if(bonusProductList.size() > 0) {
            bonusProduct = bonusProductList[0];  
    // Usamos SOQL para obtener el ID de libro de precios asociado con el producto de bonificación y guárdamos en una variable de sObject llamada entrada
    // Todos los productos asociados al libro de precios
           List<PricebookEntry> entryList = [SELECT Id, Product2Id FROM PricebookEntry WHERE Product2Id = :bonusProduct.Id];
           PricebookEntry entry = new PricebookEntry();
           if(entryList.size() > 0) {
           entry = entryList[0];
            }
            //TO DO 2.1: Creamos una lista para almacenar nuevos ramos de bonificación
            List<OrderItem> newBouquets = new List<OrderItem>();
            //Utilizamos un "for" bucle para recorrer a través de los pedidos enviados desde un Trigger
             for(Order currentOrder : ordersFromTrigger) {
                //TO DO 2.3: Verificamos el estado de la orden
                if(currentOrder.Status == 'Activated') {
                    //TO DO 2.4: Creamos nuevos ramos y le asignamos valores
                      OrderItem freeBouquet = new OrderItem(
                      OrderId = currentOrder.id, //Esta es la orden que esta vinculada al ramo
                      PricebookEntryId = entry.id,
                      numberOfFlowers__c = 3,
                      description = 'FREE Bouquet',
                      Quantity = 1,
                      colorTheme__c = 'Spectacular Sunset',
                      percentOfOpening__c = 0,
                      UnitPrice = 0.00
                      );
                    //TO DO 2.5: Agregamos el objeto Ramo Bonificado a la lista
                    newBouquets.add(freeBouquet);
                //TO DO 2.6: Cerramos el if y el for
                   } //end if
                   } //end for
            //TO DO 3.2: Usamos DML para agregar la lista newBouquets
             insert newBouquets;
        //TO DO 3.3: Cerramos el else
            } //end else
    } //Termina el metodo
} //Termina la clase
