package ru.kata.spring.boot_security.demo.dao;

import org.springframework.stereotype.Repository;
import ru.kata.spring.boot_security.demo.model.Role;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Repository
public class RoleDaoImpl implements RoleDao{

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Role> getAllRoles() {
        return entityManager.createQuery("SELECT r FROM Role r", Role.class).getResultList();
    }

    @Override
    public List<Role> getUserRoles(Long userId) {
        TypedQuery<Role> query
                = entityManager.createQuery(
                "SELECT u.roles FROM User u WHERE u.id = :userId", Role.class);
        query.setParameter("userId", userId);
        return query.getResultList();
    }

    @Override
    public Role getRoleByName(String roleName) {
        TypedQuery<Role> q = (entityManager.createQuery("SELECT r FROM Role r " +
                "WHERE r.roleName = :rolename", Role.class));
        q.setParameter("rolename",roleName);
        return q.getResultList().stream().findFirst().orElse(null);
    }

    @Override
    public Set<Role> getAnyRoleById(List<Long> roles) {
        TypedQuery<Role> query = entityManager.createQuery("SELECT r FROM Role r WHERE r.id IN :role", Role.class);
        query.setParameter("role", roles);
        return new HashSet<>(query.getResultList());
    }
}
