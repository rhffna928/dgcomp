package com.dgcom.project.controller;

import com.dgcom.project.dto.DgCompDTO;
import com.dgcom.project.service.DgCompService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

@RestController
@RequiredArgsConstructor
public class AjaxController {

    private final DgCompService dgcompService;

    @PostMapping("/searchcom.do")
    public List<DgCompDTO> searchcom(@RequestParam("ad_idx") String ad_idx){

        List<DgCompDTO> result = dgcompService.searchcom(ad_idx);
        System.out.println("고객번호 "+ad_idx);
        System.out.println("해당 민원 "+result);
        return result;
    }
    @PostMapping("/searchyear.do")
    public List<DgCompDTO> searchyear(@RequestParam("year") int year){
        
        List<DgCompDTO> result = dgcompService.getsearchyear(year);
        System.out.println("연도"+year);
        
        return result;
    }
}
