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
@Table(name = "investiment", catalog = "financas", schema = "public")
public class Investiment extends BaseEntity {
	@Id
	@SequenceGenerator(sequenceName = "seqinvestiment", name = "seqinvestimentjava", initialValue = 1, allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seqinvestimentjava")
	@Basic(optional = false)
	@Column(name = "id", nullable = false)
	private Integer id;
	@Column(name = "value")
	private String value;
	@Column(name = "dateofinvestiment")
	private String dateOfInvestiment;
	@JoinColumn(name = "users", referencedColumnName = "id", nullable = true)
	@ManyToOne(optional = true)
	private Users users;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getDateOfInvestiment() {
		return dateOfInvestiment;
	}

	public void setDateOfInvestiment(String dateOfInvestiment) {
		this.dateOfInvestiment = dateOfInvestiment;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users user) {
		this.users = user;
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
		Investiment other = (Investiment) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
