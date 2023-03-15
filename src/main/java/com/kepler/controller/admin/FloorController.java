package com.kepler.controller.admin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kepler.dto.ListFloorRes;
import com.kepler.entity.BuildingEntity;
import com.kepler.entity.FloorEntity;
import com.kepler.repository.BuildingRepository;
import com.kepler.repository.FloorRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.Objects;

@RestController
public class FloorController {
    @Autowired
    FloorRepository floorRepository;
    @Autowired
    BuildingRepository buildingRepository;
    @Autowired
    ModelMapper mapper;

    @PostMapping("/building/{id}/floor")
    public ResponseEntity<ListFloorRes> getAll(@PathVariable("id") Long buildingId) {
        ListFloorRes floorRes =  new ListFloorRes();
        floorRes.setFloors(floorRepository.findAllByBuildingId(buildingId));
        return ResponseEntity.ok(floorRes);
    }

    @PutMapping("/building/{bid}/floor")
    public ResponseEntity<FloorEntity> update(@RequestBody FloorEntity floorEntity) {
        if(Objects.isNull(floorEntity.getId())) {
            return ResponseEntity.badRequest().build();
        }

        FloorEntity updateFloor = floorRepository.getOne(floorEntity.getId());
        mapper.map(floorEntity, updateFloor);
        return ResponseEntity.ok(floorRepository.save(updateFloor));
    }
}
