/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iwa.controllerTest;


import io.restassured.RestAssured.*;
import static io.restassured.RestAssured.given;
import io.restassured.matcher.RestAssuredMatchers.*;
import org.hamcrest.Matchers.*;

import io.restassured.http.ContentType;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.hasItems;
import org.testng.Assert;
import org.testng.annotations.Test;
import org.testng.asserts.SoftAssert;
/**
 *
 * @author Andres
 */
public class MathematicsControllerTest {
    
    
    @Test 
    public void getHello() {
        given().when().get("http://www.google.com").then().statusCode(200);
    }
    
    @Test 
    public void getMathematicsTest() {
        given().when().get("/spring2/Mathematics").then().statusCode(200);
        long timeInMs = given().when().get("/spring/Mathematics").time();
        System.out.print("TIME WASTED: "+timeInMs+" ...... MS ");
    }
    
    @Test 
    public void getMathematicTestJson() {
        given().when().get("/spring2/Mathematics").then().assertThat().contentType(ContentType.JSON);
    }
    
    
    @Test 
    public void getMathematicTest() {
        given().when().get("/spring2/Mathematics/1").then().statusCode(200).
        body("id", equalTo(1));
             //"mathematic[0].", hasItems(23, 54));
    }
    
}
