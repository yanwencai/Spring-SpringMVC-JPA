package com.zxbl.auth.model.tree;


import java.util.List;

/**
 * Created by Administrator on 2016/8/12.
 */
public class PageInfo {

    private Long total;
    private List rows;

    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }
}
