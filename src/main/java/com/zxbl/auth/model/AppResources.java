package com.zxbl.auth.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by Administrator on 2016/8/17.
 */
@Entity
@Table(name = "tb_auth_app_resources")
public class AppResources {

    private Integer id;
    private Integer level;//级别 一级菜单还是二级等等
    private Integer orderId;//排序id
    private Integer parentId;//父级菜单id
    private String url;//加载页面的url
    private String text;
    private String state;
    private String iconCls;
    private boolean checked;
    private String applicationCode;//应用系统代码
    private String createTime;
    private String updateTime;


    public String getApplicationCode() {
        return applicationCode;
    }

    public void setApplicationCode(String applicationCode) {
        this.applicationCode = applicationCode;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    @Id
    @GeneratedValue
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
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

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
