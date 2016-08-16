package com.zxbl.auth.model.tree;

import java.util.List;

/**
 * Created by Administrator on 2016/8/10.
 */
public class VMenuTree {

    private int id;
    private int level;//级别 一级菜单还是二级等等
    private String parentId;//父级菜单id
    private String url;//加载页面的url
    private String text;
    private String state;
    private String iconCls;
    private String checked;
    private List Children;

    public String getChecked() {
        return checked;
    }

    public void setChecked(String checked) {
        this.checked = checked;
    }

    public List getChildren() {
        return Children;
    }

    public void setChildren(List children) {
        Children = children;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
