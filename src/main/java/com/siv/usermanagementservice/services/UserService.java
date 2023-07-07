package com.siv.usermanagementservice.services;

import com.siv.usermanagementservice.dtos.UserDTO;
import com.siv.usermanagementservice.entities.Permission;
import com.siv.usermanagementservice.entities.User;
import com.siv.usermanagementservice.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService {
    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<UserDTO> getAllUsers() {
        List<User> users = userRepository.findAll();
        return users.stream().map(this::mapUserToDTO).collect(Collectors.toList());
    }

    private UserDTO mapUserToDTO(User user) {
        List<String> permissionNames = user.getPermissions().stream()
                .map(Permission::getName)
                .collect(Collectors.toList());

        return new UserDTO(user.getUsername(), user.getEmail(), permissionNames);
    }
}