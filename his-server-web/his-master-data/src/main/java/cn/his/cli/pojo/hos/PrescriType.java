package cn.his.cli.pojo.hos;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.Date;

@ApiModel(value = "prescri_type对象",description = "处方类型")
public class PrescriType {

    @ApiModelProperty(value = "处方类型主键id",name = "id")
    private Integer id;
    @ApiModelProperty(value = "处方类型名称",name = "typeName")
    private String typeName;
    @ApiModelProperty(value = "创建时间",name = "createDate")
    private Date createDate;
    @ApiModelProperty(value = "创建人",name = "user")
    private User user;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
