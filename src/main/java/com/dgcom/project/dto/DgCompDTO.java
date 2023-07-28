package com.dgcom.project.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DgCompDTO {
    private int idx;
    private Double re_idx;
    private Double re_time;
    private String com_div;
    private String ad_idx;
    private String prog;
    private String result;
    private int year1;
    private int month1;
    private int day1;
    private int num1;
    private int year2;
    private int month2;
    private int day2;
    private int hour2;
    private int min2;
    private int sec2;
    private String cb;
    private String tex;
    private String result2;

    public String toString(){
        return "DgComp [idx="+idx+",re_idx="+re_idx+",re_time="+re_time+",com_div="+com_div+",ad_idx="+ad_idx+",prog="+prog+",result="+result+
                ",year1="+year1+",month1="+month1+",day1="+day1+",num1="+num1+",year2="+year2+",month1="+month2+",day2="+day2+
                ",hour2="+hour2+",min2="+min2+",sec2="+ sec2+",cb="+cb+",tex="+tex+",result2="+result2+"]";

    }

}
