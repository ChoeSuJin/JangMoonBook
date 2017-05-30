package com.kosta.pay.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;


@Controller
public class PayController {
	
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("pay/deliverPayment.do")
	@ResponseBody
	public HashMap<String, Object> complete(@RequestParam Map<String, String> map) {
		
		System.out.println("pay/complete.do");
		HashMap<String, Object> data = new HashMap<String, Object>();
		String imp_uid = map.get("imp_uid");
		String api_key = "imp_apikey";
		String api_secret = "ekKoeW8RyKuT0zgaZsUtXXTLQ4AhPFW3ZGseDA6bkA5lamv9OqDMnxyeB9wqOsuO9W3Mx9YSJ4dTqJ3f";
		
		IamportClient iClient = new IamportClient(api_key, api_secret);
		
		/*Object payment_result = */
		/*imp_uid = extract_POST_value_from_url('imp_uid') //post ajax request�κ��� imp_uidȮ��

				payment_result = rest_api_to_find_payment(imp_uid) //imp_uid�� ������Ʈ�κ��� �������� ��ȸ
				amount_to_be_paid = query_amount_to_be_paid(payment_result.merchant_uid) //�����Ǿ���� �ϴ� �ݾ� ��ȸ. ������������ merchant_uid�������� ����

				IF payment_result.status == 'paid' AND payment_result.amount == amount_to_be_paid
					success_post_process(payment_result) //�������� ���������� �Ϸ�
				ELSE IF payment_result.status == 'ready' AND payment.pay_method == 'vbank'
					vbank_number_assigned(payment_result) //������� �߱޼���
				ELSE
					fail_post_process(payment_result) //�������� ó��
*/		
		data.put("rsp", iClient.paymentByImpUid(imp_uid));
		data.put("everythings_fine", true);
		return data;
	}
	
	@RequestMapping("pay/deliveryComplete.do")
	public String deliveryComplete() {
		
		return "";
	}
	
}
