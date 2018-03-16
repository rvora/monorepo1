package com.example.springboot;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class SpringBootController {

    @RequestMapping("/")
    public String index() {
        System.out.println("Incoming Request");
        return "Greetings from Spring Boot!";
    }

}
