package com.my.spring.product.detail;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.my.spring.product.vo.ProductDetailVO;

public class ColorSizeOverlap {
	
	private Map<String, Object> map;
	
	public Map<String, Object> colorandsize(List<ProductDetailVO> vo){
		List<String> colorlist = new ArrayList<String>();
		List<String> sizelist = new ArrayList<String>();
		
		for(int i = 0 ; i < vo.size(); i ++) {
			String color = vo.get(i).getPro_color();
			String size = vo.get(i).getPro_size();
			if(colorlist.size() == 0)
				colorlist.add(color);
			if(sizelist.size() == 0)
				sizelist.add(size);
			
			for(int j = 0 ; j < colorlist.size(); j++) {
				if(colorlist.get(j).equals(color))
					break;
				else if(j == colorlist.size() -1)
					colorlist.add(color);
			}
			for(int j = 0 ; j < sizelist.size(); j ++) {
				if(sizelist.get(j).equals(size))
					break;
				else if(j == sizelist.size() -1)
					sizelist.add(size);
			}
		}
//		System.out.println("color : " + colorlist);
//		System.out.println("size : " + sizelist);
		
		map = new HashMap<String, Object>();
		map.put("color", colorlist);
		map.put("size", sizelist);
		return map;
	}
}
