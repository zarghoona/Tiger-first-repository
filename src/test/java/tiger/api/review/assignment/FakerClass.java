package tiger.api.review.assignment;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.github.javafaker.Faker;

public class FakerClass {
	public static String getEmail() {
		Faker faker = new Faker();
		return faker.name().firstName()
				+faker.name().lastName()
				+ "@gmail.com";
	}
	public static String getNumber() {
		Faker faker = new Faker();
		return faker.phoneNumber().cellPhone();
	}
	 public static String getFirstName() {
	        Faker faker = new Faker(); 
	        return faker.name().firstName(); 
	    }
	    public static String getLastName() {
	        Faker faker = new Faker(); 
	        return faker.name().lastName(); 
	    }
	    public static String getDob() {
	    	  Faker faker = new Faker(); 
	    	  Date date=faker.date().birthday();
	    	  SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    	  return format.format(date);
	    }
	    public static String getCountry() {
	    	Faker faker = new Faker();
	    	return faker.address().country();
	    }
	    public static String getCity() {
	    	Faker faker = new Faker();
	    	return faker.address().city();
	    }
	    public static String getzipCode() {
	    	Faker faker = new Faker();
	    	return faker.address().zipCode();
	    } 
	    public static String getstate() {
	    	Faker faker = new Faker();
	    	return faker.address().state();
	    }
	    public static String getstreet() {
	    	Faker faker = new Faker();
	    	return faker.address().streetAddress();
	    }
	    public static String getCountryCode() {
	    	Faker faker = new Faker();
	    	return faker.address().countryCode();
	    }
	    public static String getPhoneNumber() {
	    	Faker faker = new Faker();
	    	return faker.phoneNumber().cellPhone();
	    }
	    public static String getExtension() {
	    	Faker faker = new Faker();
	    	return faker.phoneNumber().extension();
	    }

}
