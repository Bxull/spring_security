package com.galijz.SpringSecurityProject.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.HttpStatusEntryPoint;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableWebSecurity(debug = true)
public class SecurityConfig {
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        return http
                .httpBasic(httpBasic -> {})
                .authorizeHttpRequests(authorizeHttpRequests -> authorizeHttpRequests.anyRequest().authenticated())
                .exceptionHandling(exceptionHandling -> exceptionHandling.accessDeniedHandler((request, response, accessDeniedException) -> accessDeniedException.printStackTrace()))
                .build();

    }
}
