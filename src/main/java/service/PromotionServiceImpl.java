package service;

import entity.Product;
import entity.Promotion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.ProductRepository;
import repository.PromotionRepository;

import java.util.List;

@Service(value = "promotionService")
public class PromotionServiceImpl implements PromotionService{
    @Autowired
    private PromotionRepository promotionRepository;

    @Override
    public List<Promotion> promotionList() {
        return (List<Promotion>) promotionRepository.getListPromotion();
    }

    @Override
    public List<Integer> product() {
        return promotionRepository.getListProduct();
    }

    @Override
    public List<Promotion> getListPromotions() {
        return (List<Promotion>) promotionRepository.findAll();
    }

}
