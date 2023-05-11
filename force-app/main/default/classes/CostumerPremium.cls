/**
 * @author warleyalmeida
 */

public class CostumerPremium extends Customer {

    private List<Award> awards;
    public CostumerPremium() {

    }

    public CostumerPremium(String name) {
        super(name);
    }

    override
    public void print() {
        System.debug(this.name);
    }

    public class Award {

    }
}


// Resume 

/**
 * Para que uma classe possa ser herdadada e necessario utilizar o modificador Virtual
 * Herança e a vase de Orientaçao a Objetos
 * Varios Padroes de Projeto utilizam Herança com estrutura
 * Utilize sempre o conceito de 'e um' quando for pensar em herança
 * A classe Filha pode acessar todos membros 'public' ou 'protected' da classe mae
 * o 'this' SEMPRE representara a instancia do tipo em que foi criada
 * A palavra reservada super e utilizada para acessar diretameto os membros da mae
 */