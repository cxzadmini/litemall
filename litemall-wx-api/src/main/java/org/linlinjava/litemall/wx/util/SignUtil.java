package org.linlinjava.litemall.wx.util;

import com.github.pagehelper.util.StringUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SignUtil {

    public static final String PARAM_SIGN = "sign"; // 参数签名
    public static final String PARAM_SIGN_TYPE = "sign_type"; // 常量值md5

    private static final String concatMap(Map<String, String> params) {
        List<String> keysSet = new ArrayList<String>();
        keysSet.addAll(params.keySet());
        Collections.sort(keysSet);
        StringBuilder sb = new StringBuilder();
        for (String key : keysSet) {
            if (key.equals(PARAM_SIGN) || key.equals(PARAM_SIGN_TYPE)) {
                continue;
            }
            String value = params.get(key);
            if (StringUtil.isEmpty(value)) {
                value = "";
            }
            sb.append("&").append(key).append("=").append(value);
        }

        if (sb.length() > 0 && sb.toString().startsWith("&")) {
            sb.delete(0, 1);
        }
        return sb.toString();
    }

    public static final String getSignCode(Map map, String appSecret) {
        String queryString = concatMap(map);
        String signText = queryString + ":" + appSecret;
        String serverSignCode = MD5Util.MD5Encode(signText);
        return serverSignCode;
    }

    public static final String getSignCode(String queryString, String appSecret) {
        String signText = queryString + ":" + appSecret;
        String serverSignCode = MD5Util.MD5Encode(signText);
        return serverSignCode;
    }


    public static void main(String[] args){
        Map<String, String> params = new HashMap<String, String>();
        params.put("app_id", "1816347");
        params.put("session_id","eyJ2IjozLCJnIjpmYWxzZSwidSI6IjIyNTAwNTMzIiwidCI6MTU1Mjk2ODI5ODA4MSwicyI6Im5zIiwiYyI6IjIiLCJyIjoiSng1VWxhVGhSRGZ3cEV1WjJqaFYiLCJhIjoiMzVFNDY1RTk2MEU0N0I1MjM4OTUyQkZGNkNDOTIzM0UiLCJsIjoiRENCNzgzQTMwQTIwRkRCNjZEMzQwMzMxNUFFMkFGNzMifQ");
        params.put("uid", "22500533");
        params.put("ts", "1552967620886");
        String sign = SignUtil.getSignCode(params, "qrEMjQ4kXjwGdeSWsvHMtMAWE1zHgq7D");
        System.out.println(sign);
    }



}
