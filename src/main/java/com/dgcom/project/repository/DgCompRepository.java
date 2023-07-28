package com.dgcom.project.repository;

import com.dgcom.project.dto.Criteria;
import com.dgcom.project.dto.DgCompDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class DgCompRepository {

    private final SqlSessionTemplate sql;

    public List<DgCompDTO> dglist(Criteria cri) {
        return sql.selectList("Dgcomp.dglist", cri);
    }

    public int getTotal() {
        return sql.selectOne("Dgcomp.total");
    }

    public List<DgCompDTO> searchcom(String ad_idx) {

        return sql.selectList("Dgcomp.searchcom", ad_idx);
    }

    public List<DgCompDTO> search() {
        return sql.selectList("Dgcomp.search");
    }

    public List<DgCompDTO> getListpaging(Criteria cri) {
        return sql.selectList("Dgcomp.getListpaging",cri);
    }
}
