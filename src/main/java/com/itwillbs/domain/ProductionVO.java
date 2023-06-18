package com.itwillbs.domain;

import java.sql.Timestamp;

public class ProductionVO {
	
	// production
	private String production_id;
	private String cont_id;
	private int production_emp;
	private Timestamp production_date;
	private String op_id;
	private String production_line;
	private int plan_qty;
	private int production_qty;
	private String production_state;
//	private String product_id;
	
	// product
	private String product_id;
	private String product_name;
	
	// complete
	private Timestamp complete_date;
	private int complete_defQty;
//	private String def_code;
	
	// qc
	private String qc_num;
	private int qc_emp;
	private Timestamp qc_date;
	private int qc_qty;
	private String qc_state;
	
	// defective
	private String def_code;
	private int def_qty;
	
	// empty_bottle
	private String bt_id;
	private int bt_qty;
	private int bt_status;
	
	
	// getter / setter
	
	public String getProduction_id() {
		return production_id;
	}


	public String getQc_state() {
		return qc_state;
	}


	public void setQc_state(String qc_state) {
		this.qc_state = qc_state;
	}


	public void setProduction_id(String production_id) {
		this.production_id = production_id;
	}


	public String getCont_id() {
		return cont_id;
	}


	public void setCont_id(String cont_id) {
		this.cont_id = cont_id;
	}


	public int getProduction_emp() {
		return production_emp;
	}


	public void setProduction_emp(int production_emp) {
		this.production_emp = production_emp;
	}


	public Timestamp getProduction_date() {
		return production_date;
	}


	public void setProduction_date(Timestamp production_date) {
		this.production_date = production_date;
	}


	public String getOp_id() {
		return op_id;
	}


	public void setOp_id(String op_id) {
		this.op_id = op_id;
	}


	public String getProduction_line() {
		return production_line;
	}


	public void setProduction_line(String production_line) {
		this.production_line = production_line;
	}


	public int getPlan_qty() {
		return plan_qty;
	}


	public void setPlan_qty(int plan_qty) {
		this.plan_qty = plan_qty;
	}


	public int getProduction_qty() {
		return production_qty;
	}


	public void setProduction_qty(int production_qty) {
		this.production_qty = production_qty;
	}


	public String getProduction_state() {
		return production_state;
	}


	public void setProduction_state(String production_state) {
		this.production_state = production_state;
	}


	public String getProduct_id() {
		return product_id;
	}


	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public Timestamp getComplete_date() {
		return complete_date;
	}


	public void setComplete_date(Timestamp complete_date) {
		this.complete_date = complete_date;
	}


	public int getComplete_defQty() {
		return complete_defQty;
	}


	public void setComplete_defQty(int complete_defQty) {
		this.complete_defQty = complete_defQty;
	}


	public String getQc_num() {
		return qc_num;
	}


	public void setQc_num(String qc_num) {
		this.qc_num = qc_num;
	}


	public int getQc_emp() {
		return qc_emp;
	}


	public void setQc_emp(int qc_emp) {
		this.qc_emp = qc_emp;
	}


	public Timestamp getQc_date() {
		return qc_date;
	}


	public void setQc_date(Timestamp qc_date) {
		this.qc_date = qc_date;
	}


	public int getQc_qty() {
		return qc_qty;
	}


	public void setQc_qty(int qc_qty) {
		this.qc_qty = qc_qty;
	}


	public String getDef_code() {
		return def_code;
	}


	public void setDef_code(String def_code) {
		this.def_code = def_code;
	}


	public int getDef_qty() {
		return def_qty;
	}


	public void setDef_qty(int def_qty) {
		this.def_qty = def_qty;
	}


	public String getBt_id() {
		return bt_id;
	}


	public void setBt_id(String bt_id) {
		this.bt_id = bt_id;
	}


	public int getBt_qty() {
		return bt_qty;
	}


	public void setBt_qty(int bt_qty) {
		this.bt_qty = bt_qty;
	}


	public int getBt_status() {
		return bt_status;
	}


	public void setBt_status(int bt_status) {
		this.bt_status = bt_status;
	}

	// toString()
	@Override
	public String toString() {
		return "ProductionVO [production_id=" + production_id + ", cont_id=" + cont_id + ", production_emp="
				+ production_emp + ", production_date=" + production_date + ", op_id=" + op_id + ", production_line="
				+ production_line + ", plan_qty=" + plan_qty + ", production_qty=" + production_qty
				+ ", production_state=" + production_state + ", product_id=" + product_id + ", product_name="
				+ product_name + ", complete_date=" + complete_date + ", complete_defQty=" + complete_defQty
				+ ", qc_num=" + qc_num + ", qc_emp=" + qc_emp + ", qc_date=" + qc_date + ", qc_qty=" + qc_qty
				+ ", qc_state=" + qc_state + ", def_code=" + def_code + ", def_qty=" + def_qty + ", bt_id=" + bt_id
				+ ", bt_qty=" + bt_qty + ", bt_status=" + bt_status + "]";
	}


	

	
	

}