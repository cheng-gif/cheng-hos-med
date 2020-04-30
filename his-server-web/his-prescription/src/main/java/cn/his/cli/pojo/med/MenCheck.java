package cn.his.cli.pojo.med;

import cn.his.cli.pojo.hos.ItemCate;
import cn.his.cli.pojo.hos.ItemExamine;
import cn.his.cli.pojo.newl.NewDiag;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "med_men_check对象",description = "检查项目")
public class MenCheck {

    @ApiModelProperty(value = "检查项目主键id",name = "id")
    private Integer id;
    @ApiModelProperty(value = "数量",name = "quantity")
    private String quantity;
    @ApiModelProperty(value = "金额",name = "amount")
    private float amount;
    @ApiModelProperty(value = "备注",name = "remark")
    private String remark;
    @ApiModelProperty(value = "总价",name = "total")
    private float total;

    @ApiModelProperty(value = "检查项目配置对象",name = "itemExamine")
    private ItemExamine itemExamine;
    @ApiModelProperty(value = "检查类型",name = "itemCate")
    private ItemCate itemCate;
    @ApiModelProperty(value = "新开就诊对象",name = "newDiag")
    private NewDiag newDiag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public ItemExamine getItemExamine() {
        return itemExamine;
    }

    public void setItemExamine(ItemExamine itemExamine) {
        this.itemExamine = itemExamine;
    }

    public ItemCate getItemCate() {
        return itemCate;
    }

    public void setItemCate(ItemCate itemCate) {
        this.itemCate = itemCate;
    }

    public NewDiag getNewDiag() {
        return newDiag;
    }

    public void setNewDiag(NewDiag newDiag) {
        this.newDiag = newDiag;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }
}
