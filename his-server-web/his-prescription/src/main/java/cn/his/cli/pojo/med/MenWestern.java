package cn.his.cli.pojo.med;

import cn.his.cli.pojo.hos.DrugInformation;
import cn.his.cli.pojo.hos.DrugUsage;
import cn.his.cli.pojo.newl.NewDiag;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "med_men_western对象",description = "西药处方信息")
public class MenWestern {

    @ApiModelProperty(value = "西药处方主键id",name = "id")
    private Integer id;
    @ApiModelProperty(value = "单次用量",name = "singleUsage")
    private float singleUsage;
    @ApiModelProperty(value = "频度",name = "frequency")
    private String frequency;
    @ApiModelProperty(value = "天数",name = "day")
    private String day;
    @ApiModelProperty(value = "总价",name = "total")
    private float total;
    @ApiModelProperty(value = "单价",name = "price")
    private float price;

    @ApiModelProperty(value = "药品信息对象",name = "information")
    private DrugInformation information;
    @ApiModelProperty(value = "药品用法对象",name = "usage")
    private DrugUsage usage;
    @ApiModelProperty(value = "新开就诊对象",name = "newDiag")
    private NewDiag newDiag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public float getSingleUsage() {
        return singleUsage;
    }

    public void setSingleUsage(float singleUsage) {
        this.singleUsage = singleUsage;
    }

    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public DrugInformation getInformation() {
        return information;
    }

    public void setInformation(DrugInformation information) {
        this.information = information;
    }

    public DrugUsage getUsage() {
        return usage;
    }

    public void setUsage(DrugUsage usage) {
        this.usage = usage;
    }

    public NewDiag getNewDiag() {
        return newDiag;
    }

    public void setNewDiag(NewDiag newDiag) {
        this.newDiag = newDiag;
    }
}
