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
 * Move POJO
 * 
 * @author Filipe Névola
 */
@Entity
@Table(name = "move", catalog = "financas", schema = "public")
public class Move extends BaseEntity {
	@Id
	@SequenceGenerator(sequenceName = "seqmove", name = "seqmovejava", initialValue = 1, allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seqmovejava")
	@Basic(optional = false)
	@Column(name = "id", nullable = false)
	private Integer id;
	@Column(name = "name", length = 200, nullable = false)
	private String name;
	@Column(name = "place", length = 200, nullable = true)
	private String place;
	@Column(name = "value", nullable = false)
	private Double value;
	@Column(name = "dateOfMove", length = 200, nullable = true)
	private String dateOfMove;
	@Column(name = "dateOfPay", length = 200, nullable = true)
	private String dateOfPay;
	@JoinColumn(name = "category", referencedColumnName = "id", nullable = true)
	@ManyToOne(optional = true)
	private Category category;
	private Integer categoryId;
	@JoinColumn(name = "typeOfPay", referencedColumnName = "id", nullable = true)
	@ManyToOne(optional = true)
	private TypeOfPay typeOfPay;
	private Integer typeOfPayId;
	@Column(name = "sendNotification", nullable = true)
	private Boolean sendNotification;

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

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public TypeOfPay getTypeOfPay() {
		return typeOfPay;
	}

	public Boolean getSendNotification() {
		return sendNotification;
	}

	public void setSendNotification(Boolean sendNotification) {
		this.sendNotification = sendNotification;
	}

	public void setTypeOfPay(TypeOfPay typeOfPay) {
		this.typeOfPay = typeOfPay;
		if (typeOfPay.getId() != null) {
			this.typeOfPayId = typeOfPay.getId();
		}
	}

	public Integer getTypeOfPayId() {
		return typeOfPayId;
	}

	public void setTypeOfPayId(Integer typeOfPayId) {
		TypeOfPay typ = new TypeOfPay();
		typ.setId(typeOfPayId);
		this.typeOfPay = typ;
		this.typeOfPayId = typeOfPayId;
	}

	public String getDateOfMove() {
		return dateOfMove;
	}

	public void setDateOfMove(String dateOfMove) {
		this.dateOfMove = dateOfMove;
	}

	public String getDateOfPay() {
		return dateOfPay;
	}

	public void setDateOfPay(String dateOfPay) {
		this.dateOfPay = dateOfPay;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
		if (category.getId() != null) {
			this.categoryId = category.getId();
		}
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		Category cat = new Category();
		cat.setId(categoryId);
		this.category = cat;
		this.categoryId = categoryId;
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
		Move other = (Move) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
