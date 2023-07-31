package com.dgcom.project.service;

import com.dgcom.project.dto.Criteria;
import com.dgcom.project.dto.DgCompDTO;
import com.dgcom.project.repository.DgCompRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class DgCompService {

    private final DgCompRepository dgCompRepository;

    //페이징
    public List<DgCompDTO> dglist(Criteria cri) {
        return dgCompRepository.dglist(cri);
    }
    //민원 전체 수
    public int getTotal(Criteria cri) {
        return dgCompRepository.getTotal(cri);
    }
    //개별민원
    public List<DgCompDTO> searchcom(String ad_idx) {

        return dgCompRepository.searchcom(ad_idx);
    }
    //전체민원
    public List<DgCompDTO> search() {
        return dgCompRepository.search();
    }

    //
    public List<DgCompDTO> getsearchyear(int year) {
        return dgCompRepository.getsearchyear(year);
    }
}
