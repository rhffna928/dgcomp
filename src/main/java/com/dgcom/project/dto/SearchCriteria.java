package com.dgcom.project.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchCriteria extends Criteria{

    private String searchType;
    private String keyword;
    private String startday;
    private String endday;

    public SearchCriteria(){
        this.searchType = "";
        this.keyword = "";
    }

}
