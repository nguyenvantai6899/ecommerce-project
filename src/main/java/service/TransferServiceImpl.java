package service;

import entity.Transfer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import repository.TransferRepository;

import java.util.Optional;

@Service(value = "transferService")
public class TransferServiceImpl implements TransferService{

    @Autowired
    private TransferRepository transferRepository;

    @Override
    @Transactional
    public String transfer(long fromAcc, long toAcc, double amount) {
        Transfer sourceAccount = transferRepository.getTransferById(fromAcc);
        if (sourceAccount.getBalancce() < amount){
            return "not enough money";
        }
        Transfer targetAccount = transferRepository.getTransferById(toAcc);
        targetAccount.setBalancce(targetAccount.getBalancce() + amount);
        transferRepository.save(targetAccount);
        sourceAccount.setBalancce(sourceAccount.getBalancce() - amount);
        transferRepository.save(sourceAccount);

        return "success";
    }

    @Override
    public Transfer findById(long id) {
        return transferRepository.getTransferById(id);
    }

    @Override
    public Boolean checkNull(long id) {
        if (transferRepository.getTransferById(id) == null){
            return false ;
        }
        return true;
    }
}
