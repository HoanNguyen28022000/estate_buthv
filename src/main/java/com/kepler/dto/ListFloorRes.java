package com.kepler.dto;

import com.kepler.entity.FloorEntity;
import lombok.Data;

import java.util.List;

@Data
public class ListFloorRes {
    List<FloorEntity> floors;
}
