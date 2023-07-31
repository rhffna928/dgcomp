package com.dgcom.project.controller;

import com.dgcom.project.dto.Criteria;
import com.dgcom.project.dto.DgCompDTO;
import com.dgcom.project.dto.PageMaker;
import com.dgcom.project.service.DgCompService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class DgCompController {
    private final DgCompService dgcompService;

    @GetMapping("/table.do")
    public ModelAndView table(@ModelAttribute("cri") Criteria cri, Model model) {
        ModelAndView mav = new ModelAndView("/tables/table");
        List<DgCompDTO> dgconpDTO = dgcompService.dglist(cri);

        int total = dgcompService.getTotal(cri);
        PageMaker pageMake = new PageMaker(cri, total);

        model.addAttribute("dglist", dgconpDTO);
        model.addAttribute("pageMaker", pageMake);

        System.out.println("테이블="+dgconpDTO);
        System.out.println(pageMake);
        return mav;
    }
    @GetMapping("/search.do")
    public String search(Model model, HttpServletRequest request){


        List<DgCompDTO> dgconpDTO = dgcompService.search();

        model.addAttribute("dglist", dgconpDTO);
        System.out.println(dgconpDTO);

        return "/tables/search";
    }
}
