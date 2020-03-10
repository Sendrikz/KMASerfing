package com.naukma.serfing.service.impl;

import com.naukma.serfing.models.Role;
import com.naukma.serfing.models.User;
import com.naukma.serfing.dto.UserDto;
import com.naukma.serfing.repository.RoleRepository;
import com.naukma.serfing.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public List<User> findAllUsers() {
        return (List<User>) userRepository.findAll();
    }

    public User save(UserDto user) {
        User userToDb = new User();
        userToDb.setFirstName(user.getFirstName());
        userToDb.setLastName(user.getLastName());
        userToDb.setPassword(passwordEncoder.encode(user.getPassword()));
        userToDb.setUsername(user.getEmail());

        List<Role> listOfRoles = new ArrayList<>();
        listOfRoles.add(roleRepository.findByRoleName("USER"));
        userToDb.setRoles(listOfRoles);

        return userRepository.save(userToDb);
    }

}
