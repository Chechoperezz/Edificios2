package Models.Entities;

public class Edificio {
    private int id;
    private String nombre;
    private double metrosCuadrados;
    private double altura;
    private int numPisos;
    private int numApartamentos;
    private int numOficinas;
    private String nomParqueadero;
    private int numPisinas;
    private String pais;
    private String departamento;
    private String ciudad;
    private boolean tieneAsensor;
    private double valorAdministracion;
    private boolean tieneZonaSocial;


    public Edificio() {}


    public Edificio(String nombre, double metrosCuadrados, double altura, int numPisos, int numApartamentos,
                    int numOficinas, String nomParqueadero, int numPisinas, String pais, String departamento,
                    String ciudad, boolean tieneAsensor, double valorAdministracion, boolean tieneZonaSocial) {
        this.nombre = nombre;
        this.metrosCuadrados = metrosCuadrados;
        this.altura = altura;
        this.numPisos = numPisos;
        this.numApartamentos = numApartamentos;
        this.numOficinas = numOficinas;
        this.nomParqueadero = nomParqueadero;
        this.numPisinas = numPisinas;
        this.pais = pais;
        this.departamento = departamento;
        this.ciudad = ciudad;
        this.tieneAsensor = tieneAsensor;
        this.valorAdministracion = valorAdministracion;
        this.tieneZonaSocial = tieneZonaSocial;
    }


    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public double getMetrosCuadrados() {
        return metrosCuadrados;
    }
    public void setMetrosCuadrados(double metrosCuadrados) {
        this.metrosCuadrados = metrosCuadrados;
    }
    public double getAltura() {
        return altura;
    }
    public void setAltura(double altura) {
        this.altura = altura;
    }
    public int getNumPisos() {
        return numPisos;
    }
    public void setNumPisos(int numPisos) {
        this.numPisos = numPisos;
    }
    public int getNumApartamentos() {
        return numApartamentos;
    }
    public void setNumApartamentos(int numApartamentos) {
        this.numApartamentos = numApartamentos;
    }
    public int getNumOficinas() {
        return numOficinas;
    }
    public void setNumOficinas(int numOficinas) {
        this.numOficinas = numOficinas;
    }
    public String getNomParqueadero() {
        return nomParqueadero;
    }
    public void setNomParqueadero(String nomParqueadero) {
        this.nomParqueadero = nomParqueadero;
    }
    public int getNumPisinas() {
        return numPisinas;
    }
    public void setNumPisinas(int numPisinas) {
        this.numPisinas = numPisinas;
    }
    public String getPais() {
        return pais;
    }
    public void setPais(String pais) {
        this.pais = pais;
    }
    public String getDepartamento() {
        return departamento;
    }
    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }
    public String getCiudad() {
        return ciudad;
    }
    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }
    public boolean isTieneAsensor() {
        return tieneAsensor;
    }
    public void setTieneAsensor(boolean tieneAsensor) {
        this.tieneAsensor = tieneAsensor;
    }
    public double getValorAdministracion() {
        return valorAdministracion;
    }
    public void setValorAdministracion(double valorAdministracion) {
        this.valorAdministracion = valorAdministracion;
    }
    public boolean isTieneZonaSocial() {
        return tieneZonaSocial;
    }
    public void setTieneZonaSocial(boolean tieneZonaSocial) {
        this.tieneZonaSocial = tieneZonaSocial;
    }
}

