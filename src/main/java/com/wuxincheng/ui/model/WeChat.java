package com.wuxincheng.ui.model;

import java.io.Serializable;

/**
 * 微信公众号
 * 
 * @author wuxincheng
 *
 */
public class WeChat implements Serializable {

	private static final long serialVersionUID = -2245998103101886883L;

	/** 搜狗openid */
	private String openId;
	/** 公众号名称 */
	private String publicName;
	/** 微信公众号 */
	private String publicNO;
	/** 功能介绍 */
	private String memo;
	/** 微信认证 */
	private String weChatCret;
	/** Logo地址 */
	private String logoLink;
	/** 二维码地址 */
	private String cdnLink;
	/** 博客类型状态: 0-正常, 1-禁用, 2-删除 */
	private String state;

	private String createTime;

	public WeChat() {
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getPublicName() {
		return publicName;
	}

	public void setPublicName(String publicName) {
		this.publicName = publicName;
	}

	public String getPublicNO() {
		return publicNO;
	}

	public void setPublicNO(String publicNO) {
		this.publicNO = publicNO;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getWeChatCret() {
		return weChatCret;
	}

	public void setWeChatCret(String weChatCret) {
		this.weChatCret = weChatCret;
	}

	public String getLogoLink() {
		return logoLink;
	}

	public void setLogoLink(String logoLink) {
		this.logoLink = logoLink;
	}

	public String getCdnLink() {
		return cdnLink;
	}

	public void setCdnLink(String cdnLink) {
		this.cdnLink = cdnLink;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "WeChat: [openId: " + getOpenId() + ", publicName: "
				+ getPublicName() + ", publicNO: " + getPublicNO() + ", memo: "
				+ getMemo() + ", weChatCret: " + getWeChatCret()
				+ ", logoLink: " + getLogoLink() + ", cdnLink: " + getCdnLink()
				+ "]";
	}

}
