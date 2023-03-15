package com.kepler.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "floor")
@Getter
@Setter
public class FloorEntity extends BaseEntity{

    @Column(name = "buildingid")
    private Long buildingId;

    @Column(name = "stt")
    private Integer stt;

    @Column(name = "area")
    private Integer area;

    @Column(name = "price")
    private Integer price;

    @Column(name = "rentarea")
    private Integer rentArea;

    @Column(name = "status")
    private String status;

    @Column(name = "managerid")
    private Long managerId;

    @Transient
    private String managerName;
}
