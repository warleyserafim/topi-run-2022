/**
 * @author warleyalmeida - topi-brq
 */

 public virtual class Customer {

    //Modificadores Tipo nomeVariavel
    //private
    //public
    //protected -> so posso utilizar protected quando minha classe for virtual

    // dentro do Apex nao temos os tipos primitivos.

    protected String name;

    private String email;

    private Integer age;

    private Date birthDate;

    private Datetime creatdDate;
    
    private Decimal totalAmount;

    List<Contact> contacts;

    Set<Address> addresses;

    Map<String, Address> addressesByRegion;

    Map<String, List<Address>> addressesGroupedByRegion;

    public Customer() {

        // Sobrecarga = E o mesmo que fazer a mesma operaçao so que de um jeito diferente

       // contacts = new List<Contact> (); posso utilizar assim sem passar argumentos

       // posso utilizar passando Argumentos ja na instancia do objeto como feito abaixo
       contacts = new List<Contact> {
            new Contact (FirstName = 'Warley Serafim')
       };

       addresses = new Set<Address> {
            new Address()
            ,new Address()
            ,new Address()
       };

    }

    public Customer(String name) {
     this.name = name;
    }

     public Customer(String name, String email) {
        this(name);
        this.email = email;
    }

    virtual
    public void print() {
     System.debug('Customer: ' + this.name);
    }

    virtual

    public Boolean isValid() {
     return this.name == null;
    }

    /**
    public Contact findContactByEmail(){
     List<Contact> contacts = repository.findByEmail(this.email);
     return !contacts.isEmpty() ? contacts.get(0) : null;
    }
     */
}
