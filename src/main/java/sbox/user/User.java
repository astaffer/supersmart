package sbox.user;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;
 
@JsonIgnoreProperties({"salt"})
@Data  
public class User {
	String access_id;
	int user_id;
	String user_name;
    String user_email;
    private List<String> roles;
    String salt;
}
