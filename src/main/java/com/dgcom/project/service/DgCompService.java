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


    public List<DgCompDTO> dglist(Criteria cri) {
        return dgCompRepository.dglist(cri);
    }

    public int getTotal() {
        return dgCompRepository.getTotal();
    }

    public List<DgCompDTO> searchcom(String ad_idx) {

        return dgCompRepository.searchcom(ad_idx);
    }

    public List<DgCompDTO> search() {
        return dgCompRepository.search();
    }

    public List<DgCompDTO> getListpaging(Criteria cri) {
        return dgCompRepository.getListpaging(cri);
    }
}
