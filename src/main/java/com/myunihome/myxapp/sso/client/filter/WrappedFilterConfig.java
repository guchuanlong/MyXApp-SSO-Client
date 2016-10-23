package com.myunihome.myxapp.sso.client.filter;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

public class WrappedFilterConfig implements FilterConfig {
	private static final Logger LOG = Logger.getLogger(WrappedFilterConfig.class);
	private Map<String, String> params;
	
	private FilterConfig filterConfig;
	
	public WrappedFilterConfig(FilterConfig filterConfig){
		this.filterConfig = filterConfig;
		this.params = initParams();
	}
	
	/**
	 * 根据内外网自动调整IP参数
	 * @param currentFilterConfig
	 * @param httpRequest
	 */
	public WrappedFilterConfig(FilterConfig currentFilterConfig, HttpServletRequest httpRequest) {
		this.filterConfig = currentFilterConfig;
		this.params = initParams(httpRequest);
	}

	@Override
	public String getFilterName() {
		return filterConfig.getFilterName();
	}

	@Override
	public String getInitParameter(String key) {
		String value = filterConfig.getInitParameter(key);
		if(value!=null){
			return value;
		}
		return params.get(key);
	}

	@Override
	public Enumeration<String> getInitParameterNames() {
		final Iterator<String> iterator = params.keySet().iterator();
		return new Enumeration<String>() {

			@Override
			public boolean hasMoreElements() {
				return iterator.hasNext();
			}

			@Override
			public String nextElement() {
				return iterator.next();
			}
		};
	}

	@Override
	public ServletContext getServletContext() {
		return filterConfig.getServletContext();
	}
	
	private Map<String,String> initParams(){
		Properties properties = new Properties();
		Map<String, String> map = new HashMap<String, String>();
		try {
			ClassLoader loader = WrappedFilterConfig.class.getClassLoader();
			properties.load(loader.getResourceAsStream("sso.properties"));
			for (Object obj : properties.keySet()) {
				String key = (String) obj;
				map.put(key, properties.getProperty(key));
			}
		} catch (IOException e) {
			LOG.error("init WrappedFilterConfig failure",e);
		}
		return map;
	}
	
	private Map<String,String> initParams(HttpServletRequest httpRequest){
		String serverName=httpRequest.getServerName();
		boolean innerFlag=IPHelper.isInnerIP(serverName);
		Map<String, String> map = initParams();
		try {
			if(innerFlag){
				//若是内网访问，则单点登录走内网
				Iterator iter = map.entrySet().iterator();
					while (iter.hasNext()) {
						Map.Entry<String, String> entry = (Map.Entry<String, String>) iter.next();
						String key = entry.getKey();
						if(null!=key&&!"".equals(key)&&key.endsWith("_Inner")){
							String val = entry.getValue();
							String keyNormal=key.replace("_Inner", "");
							map.put(keyNormal, val);
						}
						
						
					}
			}
		} catch (Exception e) {
			LOG.error("init WrappedFilterConfig failure",e);
		}
		return map;
	}
	
	private void printParams(){
		Iterator iter = this.params.entrySet().iterator();
			while (iter.hasNext()) {
				Map.Entry<String, String> entry = (Map.Entry<String, String>) iter.next();
				String key = entry.getKey();
				if(null!=key&&!"".equals(key)){
					String val = entry.getValue();
					System.out.println("WrappedFilterConfig key【"+key+"】="+val);
				}
				
			}
	}
	
}
