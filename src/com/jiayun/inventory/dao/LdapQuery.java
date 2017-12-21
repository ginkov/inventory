package com.jiayun.inventory.dao;

import static org.springframework.ldap.query.LdapQueryBuilder.query;

import java.util.List;

import javax.naming.NamingException;
import javax.naming.directory.Attributes;
import javax.naming.directory.SearchControls;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ldap.core.AttributesMapper;
import org.springframework.ldap.core.DistinguishedName;
import org.springframework.ldap.core.LdapTemplate;
import org.springframework.stereotype.Service;

import com.jiayun.inventory.model.Person;

@Service("ldapquery")
@SuppressWarnings("deprecation")
public class LdapQuery implements DaoReadonly<Person> {
	
	@Autowired
	private LdapTemplate ldapTemplate;

	@Override
	public List<Person> getAll() {
		SearchControls controls = new SearchControls();
		controls.setSearchScope(SearchControls.SUBTREE_SCOPE);
		return ldapTemplate.search(DistinguishedName.EMPTY_PATH, "(objectclass=person)", controls, new UserAttributesMapper());
	}

	@Override
	public Person getByUniqueName(String uniqueName) {
		List<Person> list = ldapTemplate.search(query().base("ou=People").where("uniqueIdentifier").is(uniqueName), new UserAttributesMapper());
        if (list != null && !list.isEmpty()) {
         return list.get(0);
        }
		return null;
	}

	private class UserAttributesMapper implements AttributesMapper<Person> {

		@Override
		public Person mapFromAttributes(Attributes attributes) throws NamingException {
			Person p;
			if(attributes == null) return null;
			p = new Person();
			p.setUid (attributes.get("uniqueIdentifier").get().toString());
			p.setName(attributes.get("cn").get().toString());
			return p;

		}
	}
}
