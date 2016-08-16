package com.zxbl.auth.model;




import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 id：节点ID，对加载远程数据很重要。
 text：显示节点文本。
 state：节点状态，'open' 或 'closed'，默认：'open'。如果为'closed'的时候，将不自动展开该节点。
 checked：表示该节点是否被选中。
 attributes: 被添加到节点的自定义属性。
 children: 一个节点数组声明了若干节点。
 * Created by Administrator on 2016/8/9.
 */
@Entity
@Table(name = "tb_auth_menutree")
public class MenuTree {

    private int id;
    private int level;//级别 一级菜单还是二级等等
    private int parentId;//父级菜单id
    private String url;//加载页面的url
    private String text;
    private String state;
    private String iconCls;
    private String checked;
   // private Attributes attributes;
    //private MenuTree children;

    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLevel() {
        return level;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public void setLevel(int level) {
        this.level = level;
    }
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getChecked() {
        return checked;
    }

    public void setChecked(String checked) {
        this.checked = checked;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
