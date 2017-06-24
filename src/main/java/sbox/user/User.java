package sbox.user;

import java.util.List;

import lombok.Data;
 

@Data  
public class User extends UserView{
    String salt;
    int user_id;
}
