package service;

import entity.Transport;

import java.util.List;

public interface TransportService {
    List<Transport> transportList(int id);
    void saveTransport(Transport transport);
    Transport findTransportById(int id);
}
