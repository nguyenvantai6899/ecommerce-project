package service;

import entity.Transfer;

public interface TransferService {
    String transfer(long fromAcc, long toAcc, double amount);
    Transfer findById(long id);
    Boolean checkNull(long id);
}
