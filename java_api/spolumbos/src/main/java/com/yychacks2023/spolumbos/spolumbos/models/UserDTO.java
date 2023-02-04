package com.yychacks2023.spolumbos.spolumbos.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public class UserDTO {
    private final long id;
    private final long rewardsPoints;
    private final String username;
    private final String name;
    private final String lastName;
}
