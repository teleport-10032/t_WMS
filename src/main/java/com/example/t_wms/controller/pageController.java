package com.example.t_wms.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class pageController {
    @RequestMapping("/")
    public String index() {
        return "login";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/superAdmin/systemInfo")
    public String systemInfo() {
        return "superAdmin/systemInfo";
    }

    @RequestMapping("/superAdmin/basicInfoAdmin")
    public String basicInfoAdmin() {
        return "superAdmin/basicInfoAdmin";
    }

    @RequestMapping("/superAdmin/staffAdmin")
    public String staffAdmin() {
        return "superAdmin/staffAdmin";
    }

    @RequestMapping("/superAdmin/warehouseAdmin")
    public String warehouseAdmin() {
        return "superAdmin/warehouseAdmin";
    }

    @RequestMapping("/superAdmin/typeAdmin")
    public String typeAdmin() {
        return "superAdmin/typeAdmin";
    }

    @RequestMapping("/superAdmin/supplierAdmin")
    public String supplierAdmin() {
        return "superAdmin/supplierAdmin";
    }

    @RequestMapping("/superAdmin/customerAdmin")
    public String customerAdmin() {
        return "superAdmin/customerAdmin";
    }

    @RequestMapping("/superAdmin/productAdmin")
    public String productAdmin() {
        return "superAdmin/productAdmin";
    }

    @RequestMapping("/superAdmin/innAdmin")
    public String innAdmin() {
        return "superAdmin/innAdmin";
    }

    @RequestMapping("/superAdmin/outtAdmin")
    public String outtAdmin() {
        return "superAdmin/outtAdmin";
    }

    @RequestMapping("/superAdmin/stockAdmin")
    public String stockAdmin() {
        return "superAdmin/stockAdmin";
    }

    @RequestMapping("/superAdmin/reportAdmin")
    public String reportAdmin() {
        return "superAdmin/reportAdmin";
    }

    @RequestMapping("/superAdmin/crmAdmin")
    public String crmAdmin() {
        return "superAdmin/crmAdmin";
    }


    @RequestMapping("/whAdmin/innAdmin")
    public String whAdminInnAdmin() {
        return "whAdmin/innAdmin";
    }
    @RequestMapping("/whAdmin/outtAdmin")
    public String whAdminOuttAdmin() {
        return "whAdmin/outtAdmin";
    }
    @RequestMapping("/whAdmin/stockAdmin")
    public String whAdminStockAdmin() {
        return "whAdmin/stockAdmin";
    }
    @RequestMapping("/whAdmin/reportAdmin")
    public String whAdminReportAdmin() {
        return "whAdmin/reportAdmin";
    }


    @RequestMapping("/crmAdmin/crmAdmin")
    public String crmAdminCrmAdmin(){
        return "crmAdmin/crmAdmin";
    }





    @RequestMapping("/admin/systemInfo")
    public String adminSystemInfo() {
        return "admin/systemInfo";
    }

    @RequestMapping("/admin/basicInfoAdmin")
    public String adminBasicInfoAdmin() {
        return "admin/basicInfoAdmin";
    }

    @RequestMapping("/admin/staffAdmin")
    public String adminStaffAdmin() {
        return "admin/staffAdmin";
    }

    @RequestMapping("/admin/warehouseAdmin")
    public String adminWarehouseAdmin() {
        return "admin/warehouseAdmin";
    }

    @RequestMapping("/admin/typeAdmin")
    public String adminTypeAdmin() {
        return "admin/typeAdmin";
    }

    @RequestMapping("/admin/supplierAdmin")
    public String adminSupplierAdmin() {
        return "admin/supplierAdmin";
    }

    @RequestMapping("/admin/customerAdmin")
    public String adminCustomerAdmin() {
        return "admin/customerAdmin";
    }

    @RequestMapping("/admin/productAdmin")
    public String adminProductAdmin() {
        return "admin/productAdmin";
    }

    @RequestMapping("/admin/innAdmin")
    public String adminInnAdmin() {
        return "admin/innAdmin";
    }

    @RequestMapping("/admin/outtAdmin")
    public String adminOuttAdmin() {
        return "admin/outtAdmin";
    }

    @RequestMapping("/admin/stockAdmin")
    public String adminStockAdmin() {
        return "admin/stockAdmin";
    }

    @RequestMapping("/admin/reportAdmin")
    public String adminReportAdmin() {
        return "admin/reportAdmin";
    }

    @RequestMapping("/admin/crmAdmin")
    public String adminCrmAdmin() {
        return "admin/crmAdmin";
    }


}
