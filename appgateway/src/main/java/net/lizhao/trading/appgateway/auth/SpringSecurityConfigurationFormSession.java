package net.lizhao.trading.appgateway.auth;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfigurationFormSession extends WebSecurityConfigurerAdapter{

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                //.cors().configurationSource(request -> new CorsConfiguration().applyPermitDefaultValues()).and()
                .cors().and()
                .csrf().disable()
                .authorizeRequests()
                .antMatchers(HttpMethod.OPTIONS,"/**").permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin().successHandler((request, response, authentication) -> {
                        response.setContentType("application/json;charset=utf-8");
                        PrintWriter out = response.getWriter();
                        response.setStatus(200);
                        Map<String,Object> map =new HashMap<>();
                        map.put("status","ok");
                        map.put("currentAuthority", "user");
                        ObjectMapper objectMapper=new ObjectMapper();
                        out.write(objectMapper.writeValueAsString(map));
                        out.flush();
                        out.close();
                })
                .failureHandler((request, response, exception) -> {
                    response.setContentType("application/json;charset=utf-8");
                    PrintWriter out = response.getWriter();
                    response.setStatus(401);
                    Map<String,Object> map = new HashMap<>();
                    map.put("status","error");
                    map.put("currentAuthority","guest");
                    ObjectMapper objectMapper =new ObjectMapper();
                    out.write(objectMapper.writeValueAsString(map));
                    out.flush();
                    out.close();
                }).loginProcessingUrl("/api/login/account");
    }

    @Bean
    CorsConfigurationSource corsConfigurationSource()
    {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Arrays.asList("http://localhost:8500"));
        configuration.setAllowedMethods(Arrays.asList("GET","POST","OPTIONS"));
        configuration.setAllowCredentials(true);
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
                .withUser("user")
                .password(passwordEncoder().encode("password"))
                .roles("USER")
                .and()
                .withUser("admin")
                .password(passwordEncoder().encode("password"))
                .roles("ADMIN");
    }


}