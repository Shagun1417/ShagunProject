// Display the current salesforce user details 'Name', 'Number' & 'EmailId' and Current Company information.
public class Script_1_7 {
    public static void main(){
        System.debug(Userinfo.getName());
        System.debug(Userinfo.getUserEmail());
        System.debug(Userinfo.getOrganizationName());
    }
}