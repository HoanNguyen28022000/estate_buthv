package com.kepler.controller.admin;

import com.kepler.dto.PageableDTO;
import com.kepler.dto.building.BuildingDTO;
import com.kepler.dto.building.BuildingSearchRequest;
import com.kepler.dto.building.BuildingSearchResponse;
import com.kepler.entity.FloorEntity;
import com.kepler.service.IBuildingService;
import com.kepler.service.IDistrictService;
import com.kepler.service.IUserService;
import com.kepler.repository.FloorRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller(value = "buildingControllerOfAdmin")
@RequiredArgsConstructor
public class BuildingController {

    private final IBuildingService buildingService;
    private final IUserService userService;
    private final IDistrictService districtService;

    @Autowired
    FloorRepository floorRepository;


    @ModelAttribute()
    public void initDistrictAndBuildingType(ModelAndView mav) { // access modifier have to public
        mav.addObject("districtsMap", districtService.getDistrictsMap());
        mav.addObject("buildingTypes",  buildingService.getBuildingTypes());
        mav.addObject("buildingRentStatus", buildingService.getRentStatus());
    }

    @GetMapping(value = "/admin/building-list")
    public ModelAndView getBuildings(@ModelAttribute @Valid BuildingSearchRequest buildingSearchRequest, ModelAndView mav) {
        PageableDTO<BuildingSearchResponse> pageableBuildings = buildingService.searchBuildings(buildingSearchRequest);
        mav.addObject("pageableBuildings", pageableBuildings);

        Map<Long, String> staffsMap = userService.getStaffsMap();
        mav.addObject("staffsMap", staffsMap);

        mav.addObject("modelSearch", buildingSearchRequest);

        mav.setViewName("admin/building/list");

        return mav;
    }

    @GetMapping(value = "/admin/building-edit")
    @PreAuthorize("hasRole('manager') " + // equivalent to T(com.kepler.constant.SystemConstant$User).ROLE_MANAGER
            "OR hasRole('staff') AND @userService.checkUserHasManagedBuilding(authentication.principal.id, #buildingId)")
	public ModelAndView editBuilding(@RequestParam(name = "id") Long buildingId, ModelAndView mav) {

        BuildingDTO buildingDTO = buildingService.getBuildingById(buildingId);
        if (buildingDTO == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "entity not found");
        }
        List<FloorEntity> floors = floorRepository.findAllByBuildingId(buildingId);
        Map<Long, String> staffsMap = userService.getStaffsMap();
        for(FloorEntity f : floors) {
            if(!Objects.isNull(f.getManagerId()) && staffsMap.keySet().contains(f.getManagerId())) {
                f.setManagerName(staffsMap.get(f.getManagerId()));
            }
            else {
                f.setManagerName("Chưa có");
            }
        }

        mav.addObject("staffsMap", staffsMap);
        mav.addObject("building", buildingDTO);
        mav.addObject("floors", floors);
        mav.addObject("title", "Chỉnh sửa thông tin tòa nhà");
        mav.addObject("submitMethod", "PUT");

        mav.setViewName("admin/building/edit");

		return mav;
	}

    @GetMapping(value = "/admin/building-create")
    public ModelAndView createBuilding(ModelAndView mav) {
        Map<Long, String> staffsMap = userService.getStaffsMap();
        mav.addObject("staffsMap", staffsMap);
        mav.addObject("title", "Thêm mới tòa nhà");
        mav.addObject("submitMethod", "POST");
        mav.addObject("building", new BuildingDTO());

        mav.setViewName("admin/building/edit");

        return mav;
    }

}
