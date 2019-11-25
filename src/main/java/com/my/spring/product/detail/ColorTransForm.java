package com.my.spring.product.detail;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.my.spring.product.vo.ProductVO;

public class ColorTransForm {
	
	Map<String, Object> color_hex_code_map;
	
	
	
	public List<ProductVO> product_Color_List(List<ProductVO> getvo) {
		
		Map<String , Object> setmap [] = new HashMap[getvo.size()];
		List<Map<String, Object>> list [] = new ArrayList[getvo.size()];
		int save_pro_code =  0 ;
		int save_index_num = 0;
		int index_num = -1;
		int map_index_num = -1;
		
		Map<Integer, Integer> pro_code_index_resultmap = new HashMap<Integer, Integer>();
		color_hex_code_map = get_Color_Hex_map();
		for(ProductVO vo : getvo) {
			index_num++ ;
			map_index_num++;
			if(index_num == 0) {
				save_pro_code = vo.getPro_code();
				save_index_num = index_num;
				
				pro_code_index_resultmap.put(save_pro_code, save_index_num);
				
				list[save_index_num] = new ArrayList<Map<String,Object>>();
			}else if(save_pro_code != vo.getPro_code()) {
				
				getvo.get(save_index_num).setPro_color_list(list[save_index_num]);
//				System.out.println("pro_code " + save_pro_code);
				
				//map.get -> key = pro_code value = save_index_num / overlap pro_code 
				int index_result = (pro_code_index_resultmap.get(vo.getPro_code()) == null || pro_code_index_resultmap.get(vo.getPro_code()) == 0) ? 
						0 : pro_code_index_resultmap.get(vo.getPro_code());
				
				boolean pro_code_overlap = true;
				
				//이미 동일한 pro_code가 있는경우 map에서 index_num 을 꺼내온 후 list[index_num] 에 추가한다
				//동일한 pro_code가 없다면 새로운 pro_code와 해당하는 index_num 등록
				
				if(index_result != 0) {
//					System.out.println("pro_code overlap!!!");
					save_index_num = index_result;
//					System.out.println("overlap list : " + list[save_index_num]);
					save_pro_code = vo.getPro_code();
					pro_code_overlap = false;
				}else {
					pro_code_index_resultmap.put(vo.getPro_code(), index_num);
				}
//				System.out.println(pro_code_index_resultmap);
				
				//중복된값이 없다면 새로운 list를 만들고 pro_code를 저장한다
				if(pro_code_overlap) {
//				System.out.println("init list : " + getvo.get(save_index_num).getPro_color_list());
				save_index_num = index_num;
				list[save_index_num] = new ArrayList<Map<String,Object>>();
				save_pro_code = vo.getPro_code();
				}
			}
			
			String pro_color = vo.getPro_color();
			String hex_code = (String)color_hex_code_map.get(pro_color);
			
//			System.out.println("[  color  : " +pro_color + "   /  hex_code  :" + hex_code + "   ]");
			
			//지금 더하고 있는 list배열에서 color값을 다 꺼낸후 지금 넣으려는 color값이 있다면 더하는걸 취소
			boolean overlap = true;
			if(list[save_index_num] != null) {
			for(int i = 0 ; i < list[save_index_num].size(); i ++) {
				if(list[save_index_num].get(i).get("color").equals(pro_color))
					overlap = false;
				}
			}
			
			//color 중복검사를 통과하면 새로운 map[] 생성후 현재 list배열에 추가한다. 
			if(overlap) {
				setmap[map_index_num] = new HashMap<String, Object>();
				setmap[map_index_num].put("color", pro_color);
				setmap[map_index_num].put("hex_code", hex_code);
				list[save_index_num].add(setmap[map_index_num]);
			}
			//이게 마지막 data일시 현재 가지고있는 list배열을 추가한다.
			if(index_num + 1 == getvo.size()) {
//				System.out.println("pro_code " + save_pro_code);
				getvo.get(save_index_num).setPro_color_list(list[save_index_num]);
//				System.out.println("init list : " + getvo.get(save_index_num).getPro_color_list());				
			}
				
			
//			System.out.println(list);
		}
		//index_num_list ->  모든 list들을 조회해서 쓸모없는 list들은 버리고 새로운 리스트에 빈틈없이 담는다.
		List<Integer> index_list = new ArrayList<Integer>();
		for(int i = 0 ; i < list.length; i ++) {
			if(list[i] != null)
				index_list.add(i);
//			System.out.println("index num = " + i + "  :  "  + list[i]);
		}
//		System.out.println(index_list);
//		List<ProductVO> 의 첫번째 child 에게 index_list를 담고 controller에서 조회한다.
		getvo.get(0).setIndex_list(index_list);
//		System.out.println("index num : " + index_num + "  /  getvo.size () : " + getvo.size());
		return getvo;
	}
	
	
	//색상값에 따른 hex_code 반환 맵
	public Map<String, Object> get_Color_Hex_map(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("진베이지", "CEC297");map.put("딥에메랄드", "00A6BA");map.put("베이지", "CEB384");map.put("오트밀","BAB0A7");
		map.put("카키그레이", "5C5E5C");map.put("와인", "650219");map.put("베이지 체크", "CEB384");map.put("블랙","000000");
		map.put("화이트", "F7F3E8");map.put("크림", "ECE3DA");map.put("핑크", "F78DAB");map.put("카멜", "86532C");
		map.put("연베이지", "EEE6C0");map.put("스카이", "00BAF7");map.put("연핑크", "F4C4BE");map.put("그레이", "A5A5A5");
		map.put("그레이베이지", "94834B");map.put("라벤더","BA90DE");map.put("아이보리", "F8F0DF");map.put("브라운", "884212");
		map.put("네이비", "12254E");map.put("라이트 그레이","E1E5E6");
		return map;
	}
}
