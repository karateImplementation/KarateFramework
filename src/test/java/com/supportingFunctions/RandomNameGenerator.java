package com.supportingFunctions;

import com.github.javafaker.Faker;

public class RandomNameGenerator {

    static Faker faker = new Faker();

    public static String randomName() {
        return faker.name().fullName();
    }

    String firstName = faker.name().firstName();
    String lastName = faker.name().lastName();

    public static String getAddress() {
        return faker.address().streetAddress();
    }

}
