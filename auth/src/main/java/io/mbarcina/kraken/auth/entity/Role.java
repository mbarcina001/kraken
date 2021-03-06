package io.mbarcina.kraken.auth.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="role")
public class Role {

	@Id
	@Column(name = "id")
	private int id;

	@Column(name="name")
	private String name;

	public Role() { }
	
	public Role(String pName) {
		this.name = pName;
	}
	
	public Role(int pId, String pName) {
		this.id = pId;
		this.name = pName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Role [id=" + id + ", name=" + name + "]";
	}
}
