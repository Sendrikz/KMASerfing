package com.naukma.serfing.repository;

import com.naukma.serfing.models.Role;
import org.springframework.data.repository.CrudRepository;

public interface RoleRepository extends CrudRepository<Role, Long> {
    Role findByRoleName(String name);
}
