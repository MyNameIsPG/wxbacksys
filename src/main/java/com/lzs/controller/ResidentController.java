package com.lzs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lzs.model.Resident;
import com.lzs.service.ResidentService;
import com.lzs.utils.ReturnResult;

@RestController
@RequestMapping("/resident")
public class ResidentController {
	@Autowired
	private ResidentService residentService;
	
	/**
	 * 新增居民
	 */
	@RequestMapping("/addResident")
	public ReturnResult addResident(Resident resident){
		try{
			int i = residentService.addResident(resident);
			return ReturnResult.success(i);
		} catch(Exception e){
			return ReturnResult.exception(e.getMessage());
		}
		
	}
	
	/**
	 * 查询居民列表
	 */
	@RequestMapping("/queryResidentList")
	public ReturnResult queryResidentList(int pageNum,int pageSize,String name,String phone,String card_number,Integer sex){
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("name", name);
		paramMap.put("phone", phone);
		paramMap.put("card_number", card_number);
		paramMap.put("sex", sex);
		Page page = PageHelper.startPage(pageNum, pageSize);
		List<Map<String,Object>> list = residentService.queryResidentList(paramMap);
		return ReturnResult.pageOk(list, page.getTotal(), page.getPages());
	}
	
	/**
	 * 查询单个居民信息
	 */
	@RequestMapping("/queryResident")
	public ReturnResult  queryResident(String uuid){
		if(uuid==null || "".equals(uuid)){
			return ReturnResult.error("居民uuid不能为空！");
		}
		Map<String,Object> map = residentService.queryResident(uuid);
		return ReturnResult.success(map);
	}
	
	/**
	 * 根据身份证修改居民信息
	 */
	@RequestMapping("/upadteResident")
	public ReturnResult upadteResident(Resident resident){
		Map resMap = residentService.queryResident(resident.getUuid());
		String old_card_number =resMap.get("card_number").toString().trim();
		int i= 0;
		if(old_card_number.equals(resident.getCard_number())){
			 i =residentService.updateResident(resident);
		} else{
			Map<String, Object> comMap = new HashMap<String, Object>();
			comMap.put("card_number", resident.getCard_number());
			Resident resident1  = residentService.queryResidentByNameAndCard(comMap);
			if (resident1 !=null) {
				return ReturnResult.fail("身份证号码已存在，不能修改！");
			} else{
				 i =residentService.updateResident(resident);
			}
		}
		return ReturnResult.success(i);
	}
	
}
