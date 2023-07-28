package com.dgcom.project.controller;

import com.dgcom.project.dto.DgCompDTO;
import com.dgcom.project.service.DgCompService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
public class HomeController {

    @GetMapping("/")
    public String index1(){

        return "index"; // => index.jsp 출력
    }

    @GetMapping("/index.do")
    public String index2(Model model, HttpServletRequest request){
        return "index"; // => index.jsp 출력
    }


}
