package com.tabner.persistence;

import java.util.List;

import com.tabner.model.Vendor;

public interface VendorService {

	public void saveVendor(Vendor vendor);
	public List<Vendor> getVendorByEid(String empid);
	public void deleteVendor(String id);
	public void updateVendor(Vendor vendor);
	public List<Vendor> getAllVendors();
	
	/*
	public List<Address> getAllAddresses();
	*/


}
