package com.tom.cake.service;

import com.tom.cake.model.Address;

import java.util.List;
import java.util.Map;

public interface AddressService {

    Address findByUsersId(Address address);

    List<Address> findAllAddressByUsersId(Address address);

    List<Address> findAllAddressByUsersIdPage(Map map);

    Long findCount(Address address);

    void saveAddress(Address address);

    Address findByAddress_id(Address address);
}
