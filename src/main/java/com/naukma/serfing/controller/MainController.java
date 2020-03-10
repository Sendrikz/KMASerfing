package com.naukma.serfing.controller;

import com.naukma.serfing.models.User;
import com.naukma.serfing.service.impl.UserService;
import com.naukma.serfing.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class MainController {
    @Autowired
    private UserService userService;

    // curl testjwtclientid:XY7kmzoNzl100@localhost:8080/oauth/token -d grant_type=password -d username=TestTest -d password=test

    @RequestMapping(value = "/user-details", method = RequestMethod.GET)
    @PreAuthorize("hasAuthority('ADMIN') or hasAuthority('USER')")
    public User getUserDetails() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();

        return userService.findByUsername(currentPrincipalName);
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public User register(@RequestBody UserDto user) {
        return userService.save(user);
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String hello(@RequestBody UserDto user) {
        return "Hello";
    }
}
