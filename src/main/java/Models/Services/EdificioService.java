package Models.Services;

import Models.Entities.Edificio;
import Models.Repositories.EdificioRepository;

import java.sql.SQLException;
import java.util.List;

public class EdificioService {

        private EdificioRepository repository;

        public EdificioService() {
            this.repository = new EdificioRepository();
        }

        public void crearEdificio(Edificio edificio) throws SQLException {
            repository.crear(edificio);
        }

        public List<Edificio> listarEdificios() throws SQLException {
            return repository.listarTodos();
        }

        public Edificio obtenerEdificioPorId(int id) throws SQLException {
            return repository.buscarPorId(id);
        }

        public boolean actualizarEdificio(Edificio edificio) throws SQLException {
            return repository.actualizar(edificio);
        }

        public boolean eliminarEdificio(int id) throws SQLException {
            return repository.eliminar(id);
        }
        public Edificio buscarPorNombre(String nombre) throws SQLException {
        return repository.buscarPorNombre(nombre);
        }

}
