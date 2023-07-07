package com.siv.usermanagementservice.repositories;

import com.siv.usermanagementservice.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // Custom methods can be defined here if needed
}
