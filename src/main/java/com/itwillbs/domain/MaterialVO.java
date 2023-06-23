package com.itwillbs.domain;
import java.util.Date;



public class MaterialVO {

	// 멤버변수
	private String ma_id;
	private String ma_name;
	private int ma_qty;
	private String unit;
	private int unit_cost;
	private String shelt_position;
	private Date ma_regdate;
	private int ma_emp;
	
	
	// getset 메서드
	public String getMa_id() {
		return ma_id;
	}
	public void setMa_id(String ma_id) {
		this.ma_id = ma_id;
	}
	public String getMa_name() {
		return ma_name;
	}
	public void setMa_name(String ma_name) {
		this.ma_name = ma_name;
	}
	public int getMa_qty() {
		return ma_qty;
	}
	public void setMa_qty(int ma_qty) {
		this.ma_qty = ma_qty;
	}
	public int getUnit_cost() {
		return unit_cost;
	}
	public void setUnit_cost(int unit_cost) {
		this.unit_cost = unit_cost;
	}

	public String getShelt_position() {
		return shelt_position;
	}
	public void setShelt_position(String shelt_position) {
		this.shelt_position = shelt_position;
	}

	public Date getMa_regdate() {
		return ma_regdate;
	}
	public void setMa_regdate(Date ma_regdate) {
		this.ma_regdate = ma_regdate;
	}
	public int getMa_emp() {
		return ma_emp;
	}
	public void setMa_emp(int ma_emp) {
		this.ma_emp = ma_emp;
	}
	
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	
	
	// toString 메서드
	@Override
	public String toString() {
		return "MaterialVO [ma_id=" + ma_id + ", ma_name=" + ma_name + ", ma_qty=" + ma_qty + ", unit=" + unit
				+ ", unit_cost=" + unit_cost + ", shelt_position=" + shelt_position + ", ma_regdate=" + ma_regdate
				+ ", ma_emp=" + ma_emp + "]";
	}
	
}
