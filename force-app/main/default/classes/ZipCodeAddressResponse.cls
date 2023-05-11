/**
 * @author warleyalmeida - brq
 */

public class ZipCodeAddressResponse {

    public String cep;
    public String logradouro;
    public String complemento;
    public String bairro;
    public String localidade;
    public String uf;
    public String ibge;
    public String gia;
    public String ddd;
    public String siafi;


    public static ZipCodeAddressResponse fromJson(String payload) {
        return (ZipCodeAddressResponse) JSON.deserialize(payload, ZipCodeAddressResponse.class);
    }
}


