package service;

import entity.CommentAndRate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.CommentAndRateRepository;

import java.util.List;

@Service(value = "commentAndRateService")
public class CommentAndRateServiceImpl implements CommentAndRateService{
    @Autowired
    private CommentAndRateRepository commentAndRateRepository;
    @Override
    public List<CommentAndRate> getListCommentAndRates(int id) {
        return commentAndRateRepository.findCommentAndRateByProductCR_Id(id);
    }

    @Override
    public void saveCommentAndRate(CommentAndRate commentAndRate) {
        commentAndRateRepository.save(commentAndRate);
    }
    @Override
    public Double avgRate(int id){
        return commentAndRateRepository.avgRate(id);
    }
}
