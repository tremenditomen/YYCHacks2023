package com.yychacks2023.spolumbos.spolumbos.services;

import lombok.NoArgsConstructor;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;


@NoArgsConstructor
@Service
public class YelpAPIConsumer {

    public Object makeApiCall() {
        // Need yelp api key.
        String apiKey = "";
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setBearerAuth(apiKey);

        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<String> httpEntity = new HttpEntity("test");
//       return restTemplate.exchange();

        return null;
    }
}
