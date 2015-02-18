package com.tabner.persistence;

import java.util.List;

import com.tabner.model.Address;

public interface AddressService {
	public void saveAddress(Address address);
	public void deleteAddress(String id);
	/*public List<Employee> getAllEmp();
	public Employee getEmpById(String empid);*/

	public List<Address> getAllAddresses();
	public List<Address> getAddrByEid(String empid);
	public void updateAddress(Address address);

}
