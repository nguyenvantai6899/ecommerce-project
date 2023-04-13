package service;

import entity.Transport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.TransportRepository;

import java.util.List;

@Service("transportService")
public class TransportServiceImpl implements TransportService{
    @Autowired
    private TransportRepository transportRepository;

    @Override
    public List<Transport> transportList(int id) {
        return (List<Transport>) transportRepository.getListTransport(id);
    }

    @Override
    public void saveTransport(Transport transport) {
        transportRepository.save(transport);
    }

    @Override
    public Transport findTransportById(int id) {
        return transportRepository.findById(id).get();
    }
}
