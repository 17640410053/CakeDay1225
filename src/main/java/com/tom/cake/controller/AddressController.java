package com.tom.cake.controller;

import com.tom.cake.constant.ResultEntity;
import com.tom.cake.constant.ResultEnum;
import com.tom.cake.model.Address;
import com.tom.cake.model.TP_Tree;
import com.tom.cake.service.AddressService;
import com.tom.cake.service.TP_TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AddressController extends BaseController {


    @Autowired
    private TP_TreeService treeService;

    @Autowired
    private AddressService addressService;

    @ResponseBody
    @RequestMapping("/address/findCityOrCountry")
    public ResultEntity<List<TP_Tree>> findCity(TP_Tree tp_tree) {
        ResultEntity<List<TP_Tree>> result = new ResultEntity<>();
        List<TP_Tree> city = treeService.findCityOrCountry(tp_tree);
        result.setCodeAndMsg(ResultEnum.SELECT_SUCCESS);
        result.setData(city);
        return result;
    }

    @ResponseBody
    @RequestMapping("/address/findProvince")
    public ResultEntity<List<TP_Tree>> findProvince() {
        ResultEntity<List<TP_Tree>> result = new ResultEntity<>();
        List<TP_Tree> province = treeService.findProvince();
        result.setCodeAndMsg(ResultEnum.SELECT_SUCCESS);
        result.setData(province);
        return result;
    }

    @ResponseBody
    @RequestMapping("/address/addAddress")
    public ResultEntity<String> addAddress(HttpSession session, Address address) {
        ResultEntity<String> result = new ResultEntity<>();
        Integer user_id = getUser(session).getUser_id();
        address.setUser_id(user_id);
        try {
            addressService.saveAddress(address);
            System.out.println("address_id----------" + address.getAddress_id());
//            Address address1 = addressService.findByAddress_id(address);
//            List<Address> addressList = addressService.findAllAddressByUsersId(address);
//            result.setData(address);
            result.setCodeAndMsg(ResultEnum.INSERT_SUCCESS_MESS);
        } catch (Exception e) {
            result.setCodeAndMsg(ResultEnum.INSERT_FAILED_MESS);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/address/findAllAddressByUserId")
    public ResultEntity<List<Address>> findAllAddressByUserId(HttpSession session, Integer page, Integer limit) {
        ResultEntity<List<Address>> result = new ResultEntity<>();
        Integer user_id = getUser(session).getUser_id();
        Address address = new Address();
        address.setUser_id(user_id);
        Map<String, Integer> map = new HashMap<>();
        map.put("user_id", user_id);
        map.put("start", (page - 1) * limit);
        map.put("end", limit);
        List<Address> addressList = addressService.findAllAddressByUsersIdPage(map);

        Long count = addressService.findCount(address);
//        List<Address> addressList = addressService.findAllAddressByUsersId(address);
        result.setCodeAndMsg(ResultEnum.SELECT_SUCCESS);
        result.setData(addressList);
        result.setCount(count);
        return result;
    }


}
