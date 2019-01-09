package com.tom.cake.service.impl;

import com.tom.cake.model.Address;
import com.tom.cake.service.AddressService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

import com.tom.cake.mapper.AddressDao;

@Service
public class AddressServiceImpl implements AddressService {

    @Resource
    private AddressDao addressDao;

    public int insert(Address pojo) {
        return addressDao.insert(pojo);
    }

    public int insertSelective(Address pojo) {
        return addressDao.insertSelective(pojo);
    }

    public int insertList(List<Address> pojos) {
        return addressDao.insertList(pojos);
    }

    public int update(Address pojo) {
        return addressDao.update(pojo);
    }

    @Override
    public Address findByUsersId(Address address) {
        return addressDao.selectByUsersId(address);
    }

    @Override
    public List<Address> findAllAddressByUsersId(Address address) {
        return addressDao.selectAllAddressByUsersId(address);
    }

    @Override
    public void saveAddress(Address address) {
        addressDao.insertAddress(address);
    }

    @Override
    public Address findByAddress_id(Address address) {
        return addressDao.selectByAddressId(address);
    }
}
