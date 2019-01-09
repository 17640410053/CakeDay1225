package com.tom.cake.service;

import com.tom.cake.model.Address;

import java.util.List;

public interface AddressService {

    Address findByUsersId(Address address);

    List<Address> findAllAddressByUsersId(Address address);

    void saveAddress(Address address);

    Address findByAddress_id(Address address);
}
