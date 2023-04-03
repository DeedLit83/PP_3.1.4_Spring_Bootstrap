package ru.kata.spring.boot_security.demo.dao;

import ru.kata.spring.boot_security.demo.model.Role;

import java.util.List;
import java.util.Set;

public interface RoleDao {
    List<Role> getAllRoles();
    List<Role> getUserRoles(Long userId);
    Role getRoleByName(String roleName);
    Set<Role> getAnyRoleById(List<Long> roles);
}
