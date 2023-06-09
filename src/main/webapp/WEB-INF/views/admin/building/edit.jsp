<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglib.jsp"%>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>${title}</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="<c:url value='/admin/home'/>">Trang chủ</a>
                </li>
                <li class="active">
                    <a href="<c:url value='/admin/building-list'/>">Danh sách tòa nhà</a>
                </li>
                <li class="active">${title}</li>
            </ul><!-- /.breadcrumb -->

        </div>

        <div class="page-content">
            <div class="ace-settings-container" id="ace-settings-container">

                <div class="ace-settings-box clearfix" id="ace-settings-box">
                    <div class="pull-left width-50">
                        <div class="ace-settings-item">
                            <div class="pull-left">
                                <select id="skin-colorpicker" class="hide">
                                    <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                                    <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                    <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                    <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                </select>
                            </div>
                            <span>&nbsp; Choose Skin</span>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
                            <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
                            <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
                            <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
                            <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
                            <label class="lbl" for="ace-settings-add-container">
                                Inside
                                <b>.container</b>
                            </label>
                        </div>
                    </div><!-- /.pull-left -->

                    <div class="pull-left width-50">
                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" />
                            <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" />
                            <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" />
                            <label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
                        </div>
                    </div><!-- /.pull-left -->
                </div><!-- /.ace-settings-box -->
            </div><!-- /.ace-settings-container -->

            <div class="row">
                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                    <span><i style="font-size: small">Các trường (*) không được để trống</i></span>

                    <form:form modelAttribute="building" class="form-horizontal" role="form" style="margin-top:10px" id="form-building" enctype="multipart/form-data">

                        <input type="hidden" name="id" value="${building.id}">

                        <div class="form-group">
                            <label class="col-sm-2" style="padding-top:7px" for="building-name"> Tên tòa nhà (*)</label>
                            <div class="col-sm-10">
                                <input type="text" id="building-name" name="name" value="${building.name}" class="col-sm-12" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2" style="padding-top:7px" for="district"> Chọn quận (*)</label>
                            <div class="col-sm-10">
                                <form:select path="district">
                                    <form:option value="" label="--- Chọn quận ---"/>
                                    <form:options items="${districtsMap}" />
                                </form:select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2" style="padding-top:7px" for="ward"> Phường (*)</label>
                            <div class="col-sm-10">
                                <input type="text" id="ward" name="ward" value="${building.ward}" class="col-sm-12" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2" style="padding-top:7px" for="street"> Đường (*)</label>
                            <div class="col-sm-10">
                                <input type="text" id="street" name="street" value="${building.street}" class="col-sm-12" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2" style="padding-top:7px" for="street"> Trạng thái </label>
                            <div class="col-sm-10">
                                <form:select path="status">
                                    <form:options items="${buildingRentStatus}" />
                                </form:select>
                            </div>
                        </div>

<%--                        <div class="form-group">--%>
<%--                            <label class="col-sm-2" style="padding-top:7px" for="structure"> Kết cấu </label>--%>
<%--                            <div class="col-sm-10">--%>
<%--                                <input type="text" id="structure" name="structure" value="${building.structure}" class="col-sm-12" />--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="form-group">--%>
<%--                            <label class="col-sm-2" style="padding-top:7px" for="number-of-basement"> Số tầng hầm </label>--%>
<%--                            <div class="col-sm-10">--%>
<%--                                <input type="number" id="number-of-basement" name="numberOfBasement" value="${building.numberOfBasement}" class="col-sm-12" />--%>
<%--                            </div>--%>
<%--                        </div>--%>

                        <div class="form-group">
                            <label class="col-sm-2" style="padding-top:7px" for="floor-area"> Diện tích sàn </label>
                            <div class="col-sm-10">
                                <input type="number" id="floor-area" name="floorArea" value="${building.floorArea}" class="col-sm-12" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2" style="padding-top:7px" for="level"> Hạng </label>
                            <div class="col-sm-10">
                                <input type="text" id="level" name="level" value="${building.level}" class="col-sm-12" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2" style="padding-top:7px" for="rental-price"> Giá thông thường (VND)</label>
                            <div class="col-sm-10">
                                <input type="number" id="rental-price" name="rentPrice" value="${building.rentPrice}" class="col-sm-12" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2" style="padding-top:7px" for="rental-price-description"> Mô tả giá </label>
                            <div class="col-sm-10">
                                <input type="text" id="rental-price-description" name="rentPriceDescription" value="${building.rentPriceDescription}" class="col-sm-12" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2" style="padding-top:7px" for="totalFloor"> Số tầng </label>
                            <div class="col-sm-10">
                                <input type="number" id="totalFloor" name="totalFloor" value="${building.totalFloor}" class="col-sm-12" />
                            </div>
                        </div>

<%--                        <div class="form-group">--%>
<%--                            <label class="col-sm-2" style="padding-top:7px" for="direction"> Hướng </label>--%>
<%--                            <div class="col-sm-10">--%>
<%--                                <input type="text" id="direction" name="direction" value="${building.direction}" class="col-sm-12" />--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="form-group">--%>
<%--                            <label class="col-sm-2" style="padding-top:7px" for="rental-area"> Diện tích thuê (VD 100,200,300)</label>--%>
<%--                            <div class="col-sm-10">--%>
<%--                                <input type="text" id="rental-area" name="rentAreas" value="${building.rentAreas}" class="col-sm-12" />--%>
<%--                            </div>--%>
<%--                        </div>--%>



<%--                        <div class="form-group">--%>
<%--                            <label class="col-sm-2" style="padding-top:7px" for="service-fee"> Phí dịch vụ </label>--%>
<%--                            <div class="col-sm-10">--%>
<%--                                <input type="text" id="service-fee" name="serviceFee" value="${building.serviceFee}" class="col-sm-12" />--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="form-group">--%>
<%--                            <label class="col-sm-2" style="padding-top:7px" for="car-fee"> Phí ô tô </label>--%>
<%--                            <div class="col-sm-10">--%>
<%--                                <input type="text" id="car-fee" name="carFee" value="${building.carFee}" class="col-sm-12" />--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="form-group">--%>
<%--                            <label class="col-sm-2" style="padding-top:7px" for="motorbike-fee"> Phí mô tô</label>--%>
<%--                            <div class="col-sm-10">--%>
<%--                                <input type="text" id="motorbike-fee" name="motorbikeFee" value="${building.motorbikeFee}" class="col-sm-12" />--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="form-group">--%>
<%--                            <label class="col-sm-2" style="padding-top:7px" for="overtime-fee"> Phí ngoài giờ</label>--%>
<%--                            <div class="col-sm-10">--%>
<%--                                <input type="text" id="overtime-fee" name="overtimeFee" value="${building.overtimeFee}" class="col-sm-12" />--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="form-group">--%>
<%--                            <label class="col-sm-2" style="padding-top:7px" for="electricity-fee"> Tiền điện</label>--%>
<%--                            <div class="col-sm-10">--%>
<%--                                <input type="text" id="electricity-fee" name="electricityFee" value="${building.electricityFee}" class="col-sm-12" />--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="form-group">--%>
<%--                            <label class="col-sm-2" style="padding-top:7px" for="deposit"> Đặt cọc </label>--%>
<%--                            <div class="col-sm-10">--%>
<%--                                <input type="text" id="deposit" name="deposit" value="${building.deposit}" class="col-sm-12" />--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="form-group">--%>
<%--                            <label class="col-sm-2" style="padding-top:7px" for="payment"> Thanh toán</label>--%>
<%--                            <div class="col-sm-10">--%>
<%--                                <input type="text" id="payment" name="payment" value="${building.payment}" class="col-sm-12" />--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="form-group">--%>
<%--                            <label class="col-sm-2" style="padding-top:7px" for="rent-time"> Thời gian thuê</label>--%>
<%--                            <div class="col-sm-10">--%>
<%--                                <input type="text" id="rent-time" name="rentTime" value="${building.rentTime}" class="col-sm-12" />--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="form-group">--%>
<%--                            <label class="col-sm-2" style="padding-top:7px" for="decoration-time"> Thời gian trang trí</label>--%>
<%--                            <div class="col-sm-10">--%>
<%--                                <input type="text" id="decoration-time" name="decorationTime" value="${building.decorationTime}" class="col-sm-12" />--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="form-group">--%>
<%--                            <label class="col-sm-2" style="padding-top:7px" for="brokerage-fee"> Phí mô giới</label>--%>
<%--                            <div class="col-sm-10">--%>
<%--                                <input type="number" id="brokerage-fee" name="brokerageFee" value="${building.brokerageFee}" class="col-sm-12" />--%>
<%--                            </div>--%>
<%--                        </div>--%>

                        <div class="form-group">
                            <label class="col-sm-2" style="padding-top:7px; margin-right: 12px"> Loại tòa nhà</label>
                            <c:forEach var="item" items="${buildingTypes}">
                                <input
                                        type="checkbox" id="${item.key}" name="type" value="${item.key}"
                                       <c:if test="${building.type.contains(item.key)}">checked</c:if>
                                >
                                <label for="${item.key}" style="margin: 5px 10px 0 2px"> ${item.value}</label>
                            </c:forEach>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2" style="padding-top:7px" for="uploadImage"> Ảnh</label>
                            <div class="col-sm-10">
                                <img
                                        id="show_img" style="padding-top: 7px; width: 300px; height: 300px" src="<c:url value='${building.imageUrl}'/>" alt="Ảnh tòa nhà"
                                    <c:if test="${empty building.imageUrl}">
                                        hidden
                                    </c:if>
                                >
                                <input type="file" id="uploadImage" name="image" class="col-sm-12" style="padding-top: 7px"
                                       accept="image/png, image/jpeg" onchange="readURL(this)"/>
                            </div>
                        </div>

                        <security:csrfInput/>
                        <div class="row">
                            <div class="col-xs-12 col-sm-12">
                                <div class="table-responsive">

                                    <table id="building-list" class="table table-striped table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th>STT Tầng</th>
                                            <th>Giá thuê (VND)</th>
                                            <th>Diện tích</th>
                                            <th>Diện tích thuê</th>
                                            <th>Nhân viên phụ trách</th>
                                            <th>Trạng thái</th>
                                            <th>Thao tác</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${floors}" var="floor">
                                                <tr>
                                                    <td>${floor.stt}</td>
                                                    <td>${floor.price}</td>
                                                    <td>${floor.area}</td>
                                                    <td>${floor.rentArea}</td>
                                                    <td>${floor.managerName}</td>
                                                    <td>${floor.status}</td>
                                                    <th>
                                                        <span onclick="fillFloor('${floor.id}', '${floor.area}', '${floor.rentArea}', '${floor.price}', '${floor.managerId}')" data-toggle="modal" data-target="#exampleModalLong" style="width:30px;height:30px;cursor: pointer">
                                                            <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                                        </span>
                                                    </th>
                                                </tr>
                                            </c:forEach>
                                        </tbody>

                                    </table>
                                    <ul class="pagination" id="pagination"></ul>
                                </div>
                            </div>
                        </div>

                        <div style="text-align: center;">
                            <security:authorize access="hasRole('manager')">
                                <button id="submit-building" class="btn btn-info">
                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                    Xác nhận
                                </button>
                            </security:authorize>

                            &nbsp; &nbsp; &nbsp;
                            <button class="btn" type="reset">
                                <i class="ace-icon fa fa-undo bigger-110"></i>
                                Làm mới
                            </button>
                        </div>
                    </form:form>
                    <!-- PAGE CONTENT ENDS -->
                </div><!-- /.col -->
            </div><!-- /.row -->

        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
<img src="/img/loading.gif" style="display: none; height: 100px; position: fixed; top: 40%; left: 50%" id="loading_image">

<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="display: flex;justify-content: space-between;">
                <h5 class="modal-title" id="exampleModalLongTitle">Sửa thông tin tầng</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="height: 400px;">
                <div>
                    <input type="number" id="fId" hidden/>
                    <div class="form-group" style="height:50px">
                        <label class="col-sm-4" style="padding-top:7px" for="area">Diện tích</label>
                        <div class="col-sm-8">
                            <input type="number" id="fArea" name="area" class="col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group" style="height:50px">
                        <label class="col-sm-4" style="padding-top:7px" for="rentArea">Diện tích thuê</label>
                        <div class="col-sm-8">
                            <input type="number" id="fRentArea" name="rentArea" class="col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group" style="height:50px">
                        <label class="col-sm-4" style="padding-top:7px" for="price">Giá (<p style="display: inline-block;">m<sup>2</sup></p> )</label>
                        <div class="col-sm-8">
                            <input type="number" id="fPrice" name="price" class="col-sm-12" />
                        </div>
                    </div>
<%--                    <div class="form-group" style="height:50px">--%>
<%--                        <label class="col-sm-4" style="padding-top:7px" for="status">Trạng thái</label>--%>
<%--                        <div class="col-sm-8">--%>
<%--                            <input type="text" id="fStatus" name="status" class="col-sm-12" />--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="form-group" style="height:50px;display: flex;">
                        <label for="staffName" class="col-sm-4" style="padding-top:7px">Chọn nhân viên phụ trách</label>
                        <br>
                        <div class="col-sm-8">
                            <security:authorize access="hasRole('staff')">
                                <input id="staffName" class="form-control" value="<security:authentication property="principal.fullName"/>" disabled/>
                            </security:authorize>

                            <security:authorize access="hasRole('manager')">
                                <select id="fManager">
                                    <option value="" label="--- Tất cả ---"/>
                                    <c:forEach var="item" items="${staffsMap}">
                                        <option value="${item.key}">${item.value}</option>
                                    </c:forEach>
                                </select>
                            </security:authorize>
                        </div>

                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                <button type="button" onclick="updateFloor()" data-dismiss="modal" class="btn btn-primary">Lưu</button>
            </div>
        </div>
    </div>
</div>

<script>
    function fillFloor(id, area, rentArea, price, managerId) {
        console.log("================ " + id + area + rentArea + price + managerId);
        $('#fId').val(id);
        $('#fArea').val(area);
        $('#fRentArea').val(rentArea);
        $('#fPrice').val(price);
        // $('#fStatus').val(status);
        if(managerId === null || managerId === undefined || managerId.length === 0) {
        } else {
            $('#fManager').val(managerId);
        }
    }

    function updateFloor() {
        let fId = $('#fId').val();
        let fArea = $('#fArea').val();
        let fRentArea = $('#fRentArea').val();
        let fPrice = $('#fPrice').val();
        let fManager = $('#fManager').val();
        $.ajax({
            url: 'http://localhost:8080/spring_boot_war/building/' + fId + '/floor',
            data: JSON.stringify({
                id: fId,
                area: fArea,
                price: fPrice,
                rentArea: fRentArea,
                managerId: fManager
            }),
            type: 'PUT',
            contentType: "application/json",
            dataType: "json",
            success: function () {
                showAlert("Bạn đã cập nhật thông tin tòa nhà!");
            },
            error: function (response) {
                showAlertError("Cập nhật thất bại")
            }
        });
        window.location.href;
    }

    function readURL(input) {
        if (input.files && input.files[0]) {
            let reader = new FileReader();
            reader.onload = function (e) {
                $('#show_img').attr('src', e.target.result)
            };
            reader.readAsDataURL(input.files[0]);
            $('#show_img').show()
        }
    }

    $("#submit-building").click(function (e) {
        e.preventDefault();
        $('#loading_image').show();
        let buildingData = {};
        let buildingTypes = '';
        let formData = $("#form-building").serializeArray();
        $.each(formData, function (index, v) {
            if (v.name === 'type') {
                buildingTypes += v.value + ',';
            } else {
                buildingData[v.name] = v.value;
            }
        })
        buildingTypes = buildingTypes.substring(0, buildingTypes.length - 1)
        buildingData['type'] = buildingTypes;

        let sendData = new FormData()
        sendData.append("building", new Blob([JSON.stringify(buildingData)], {type: 'application/json'}))
        sendData.append("image", $("#uploadImage")[0].files[0])
        sendData.append("_csrf", $('input[name="_csrf"]').attr('value'))

        $.ajax({
            type: '${submitMethod}',
            url: '${buildingAPI}',
            // data: JSON.stringify(data),
            // dataType: 'text',
            data: sendData,
            contentType: false,
            processData : false,
            cache: false,
            success: function () {
                $('#loading_image').hide();
                if ('${submitMethod}' === 'PUT')
                    showAlert("Bạn đã cập nhật thông tin tòa nhà!")
                else {
                    showAlert("Bạn đã thêm mới tòa nhà")
                    document.getElementById("form-building").reset()
                    let _img = $("#show_img")
                    _img.attr('src', "")
                    _img.hide()
                    $("#uploadImage").val('')
                }
            },
            error: function (response) {
                $('#loading_image').hide();
                try {
                    let text = response.responseText
                    if (text.length === 0) {
                        if ('${submitMethod}' === 'PUT')
                            showAlertError("Cập nhật thất bại")
                        else
                            showAlertError("Thêm mới thất bại")
                    } else {
                        let errors = JSON.parse(text)
                        showAlertError(errors['errors'][0])
                    }
                }
                catch(err) {
                    showAlertError("Có lỗi xảy ra")
                }
            }
        });
    })

</script>
</body>
</html>
