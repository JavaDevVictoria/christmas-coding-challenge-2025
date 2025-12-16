package com.example.FinalProject.service;

import com.example.FinalProject.model.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class QuizUserDetailsService implements UserDetailsService {

    private final Map<String, User> users = new HashMap<>();
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    // Method to load user by username
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = users.get(username);
        if (user == null) {
            throw new UsernameNotFoundException("User not found with username: " + username);
        }
        return org.springframework.security.core.userdetails.User
                .withUsername(user.getUsername())
                .password(user.retrieveEncodedPassword())
                .roles(user.getRole().toUpperCase()) // No manual "ROLE_" prefix
                .build();
    }

    // Method to register a new user
    public void registerUser(String username, String password, String role, String email) {
        if (users.containsKey(username)) {
            throw new IllegalArgumentException("User already exists with username: " + username);
        }
        String encodedPassword = passwordEncoder.encode(password);
        User newUser = new User(username, encodedPassword, role, email);
        users.put(username, newUser);
    }
}