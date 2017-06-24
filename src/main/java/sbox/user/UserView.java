package sbox.user;

import java.util.List;

import lombok.Data;
 

@Data  
public class UserView {
	String access_id;
	String user_name;
    String user_email;
    private List<String> roles;
}
