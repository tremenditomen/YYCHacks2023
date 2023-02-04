package com.yychacks2023.spolumbos.spolumbos.controllers;

import com.yychacks2023.spolumbos.spolumbos.models.UserDTO;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@RestController
public class RestEndPointController {

    @GetMapping("/user")
    public UserDTO getUser() {
        RestTemplate restTemplate = new RestTemplate();
        return new UserDTO(10,1000, "test", "First", "Last");
    }

}
