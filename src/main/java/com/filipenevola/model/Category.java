package com.filipenevola.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * Category POJO
 * 
 * @author Filipe Névola
 */
@Entity
@Table(name = "category", catalog = "financas", schema = "public")
public class Category extends BaseEntity {
	@Id
	@SequenceGenerator(sequenceName = "seqcategory", name = "seqcategoryjava", initialValue = 1, allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seqcategoryjava")
	@Basic(optional = false)
	@Column(name = "id", nullable = false)
	private Integer id;
	@Column(name = "name", length = 200, nullable = false)
	private String name;
	@Column(name = "value", nullable = false)
	private Double value;
	@Column(name = "pay", nullable = true)
	private Boolean pay;
	@Column(name = "notificationList", length = 500, nullable = true)
	private String notificationList;
	@JoinColumn(name = "users", referencedColumnName = "id", nullable = true)
	@ManyToOne(optional = true)
	private Users users;

	public Category() {
		super();
	}

	public Category(String name, Double value) {
		super();
		this.name = name;
		this.value = value;
	}

	public Category(Integer id, String name, Double value) {
		super();
		this.id = id;
		this.name = name;
		this.value = value;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}

	public Boolean getPay() {
		return pay;
	}

	public void setPay(Boolean pay) {
		this.pay = pay;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users user) {
		this.users = user;
	}

	public String getNotificationList() {
		return notificationList;
	}

	public void setNotificationList(String notificationList) {
		this.notificationList = notificationList;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Category other = (Category) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
