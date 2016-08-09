package com.zxbl.auth.model.tree;







/**
 id：节点ID，对加载远程数据很重要。
 text：显示节点文本。
 state：节点状态，'open' 或 'closed'，默认：'open'。如果为'closed'的时候，将不自动展开该节点。
 checked：表示该节点是否被选中。
 attributes: 被添加到节点的自定义属性。
 children: 一个节点数组声明了若干节点。
 * Created by Administrator on 2016/8/9.
 */
public class MenuTree {

    private int id;
    private String text;
    private String state;
    private String iconCls;
    private boolean checked;
    private Attributes attributes;
    private MenuTree children;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public MenuTree getChildren() {
        return children;
    }

    public void setChildren(MenuTree children) {
        this.children = children;
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

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Attributes getAttributes() {
        return attributes;
    }

    public void setAttributes(Attributes attributes) {
        this.attributes = attributes;
    }
}
