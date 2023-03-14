package com.kepler.repository;

import com.kepler.entity.BuildingEntity;
import com.kepler.entity.FloorEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FloorRepository extends JpaRepository<FloorEntity, Long> {
    List<FloorEntity> findAllByBuildingId(Long id);
    List<FloorEntity> findAllByBuildingIdIn(List<Long> ids);
}
