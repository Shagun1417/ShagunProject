//On Product to setup default Pricebook entry in the “Standard Pricebook” as 1$
trigger TiggerSheet_1_3 on Product2 (After insert) {
   
        List<id> st= new List<id>();

    List<Pricebook2> stand= [select id from Pricebook2 where IsStandard=true ];
    for(Pricebook2 pb2: stand){
        
        st.add(pb2.id);
        
    }
}