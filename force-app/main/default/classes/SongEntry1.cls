//Create a Custom Object Song and fields - Name, Favourite (Checkox) and lookup (Contact).
// Create some dummy records related to contacts.
// Write a script to print favourite songs first and rest of the songs later related to contacts.
public class SongEntry1 {
  //  Song__c s=new Song__c();
    public static void myMethod()
    {
      List<Song__c> con = [SELECT Name FROM Song__c order by Favorite__c desc];
      // List<Song__c> SongList = [Select Contact__r.LastName FROM Song__c]; 
      //   System.debug('hello bro');
        for(Song__c c:con ){
            System.debug(c.name);  
            }    
    }}