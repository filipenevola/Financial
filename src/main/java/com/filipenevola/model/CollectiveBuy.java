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
 * CollectiveBuy POJO
 * 
 * @author Filipe Névola
 */
@Entity
@Table(name = "collectivebuy", catalog = "financas", schema = "public")
public class CollectiveBuy extends BaseEntity {
	@Id
	@SequenceGenerator(sequenceName = "seqcollectivebuy", name = "seqcollectivebuyjava", initialValue = 1, allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seqcollectivebuyjava")
	@Basic(optional = false)
	@Column(name = "id", nullable = false)
	private Integer id;
	@Column(name = "name", length = 200, nullable = false)
	private String name;
	@Column(name = "place", length = 200, nullable = true)
	private String place;
	@Column(name = "value", nullable = true)
	private Double value;
	@Column(name = "originalValue", nullable = true)
	private Double originalValue;
	@Column(name = "dateOfBuy", length = 200, nullable = true)
	private String dateOfBuy;
	@Column(name = "startDate", length = 200, nullable = true)
	private String startDate;
	@Column(name = "endDate", length = 200, nullable = true)
	private String endDate;
	@Column(name = "canUseDays", length = 200, nullable = true)
	private String canUseDays;
	@Column(name = "used", nullable = true)
	private Boolean used = false;
	@Column(name = "printed", nullable = true)
	private Boolean printed = false;
	@Column(name = "alerted", nullable = true)
	private Boolean alerted = false;
	@JoinColumn(name = "users", referencedColumnName = "id", nullable = true)
	@ManyToOne(optional = true)
	private Users users;

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

	public String getDateOfBuy() {
		return dateOfBuy;
	}

	public void setDateOfBuy(String dateOfBuy) {
		this.dateOfBuy = dateOfBuy;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
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
		CollectiveBuy other = (CollectiveBuy) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	public void setOriginalValue(Double originalValue) {
		this.originalValue = originalValue;
	}

	public Double getOriginalValue() {
		return originalValue;
	}

	public void setCanUseDays(String canUseDays) {
		this.canUseDays = canUseDays;
	}

	public String getCanUseDays() {
		return canUseDays;
	}

	public void setUsed(Boolean used) {
		this.used = used;
	}

	public Boolean getUsed() {
		return used;
	}

	public void setPrinted(Boolean printed) {
		this.printed = printed;
	}

	public Boolean getPrinted() {
		return printed;
	}

	public void setAlerted(Boolean alerted) {
		this.alerted = alerted;
	}

	public Boolean getAlerted() {
		return alerted;
	}

}
