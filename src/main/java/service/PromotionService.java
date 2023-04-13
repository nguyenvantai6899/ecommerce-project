package service;

import entity.Product;
import entity.Promotion;

import java.util.List;

public interface PromotionService {
    List<Promotion> promotionList();
    List<Integer> product();
    List<Promotion> getListPromotions();
}
