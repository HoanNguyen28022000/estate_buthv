package com.kepler.dto.building;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Transient;

@Getter
@Setter
public class BuildingSearchResponse {
	private String id;
	private String createDate;
	private String name;
	private String address;
	private String typeName;
	private String status;
	private long totalFloor;
	private long totalArea;
	private long totalRentArea;
	private long totalRentPrice;
}
