package service;

import entity.CommentAndRate;

import java.util.List;

public interface CommentAndRateService {
    List<CommentAndRate> getListCommentAndRates(int id);
    void saveCommentAndRate(CommentAndRate commentAndRate);
    Double avgRate(int id);
}
