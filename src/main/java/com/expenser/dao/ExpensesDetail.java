package com.expenser.dao;

import java.io.Serializable;

public class ExpensesDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	private long expenseId;
	private String expenseDesc;
	private double expenseShareAmount;
	private long paidByOrFor;
	private String fullName;

	public ExpensesDetail(long expenseId, String expenseDesc, double expenseShareAmount, long paidByOrFor, String fullName) {
		super();
		this.expenseId = expenseId;
		this.expenseDesc = expenseDesc;
		this.expenseShareAmount = expenseShareAmount;
		this.paidByOrFor = paidByOrFor;
		this.fullName = fullName;
	}

	public ExpensesDetail() {
	}

	public long getExpenseId() {
		return expenseId;
	}

	public String getExpenseDesc() {
		return expenseDesc;
	}

	public double getExpenseShareAmount() {
		return expenseShareAmount;
	}

	public long getPaidByOrFor() {
		return paidByOrFor;
	}

	public String getFullName() {
		return fullName;
	}

	public void setExpenseId(long expenseId) {
		this.expenseId = expenseId;
	}

	public void setExpenseDesc(String expenseDesc) {
		this.expenseDesc = expenseDesc;
	}

	public void setExpenseShareAmount(double expenseShareAmount) {
		this.expenseShareAmount = expenseShareAmount;
	}

	public void setPaidByOrFor(long paidByOrFor) {
		this.paidByOrFor = paidByOrFor;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

}
