package sbox.user;

 

import static sbox.Work.userDao;

import org.mindrot.jbcrypt.BCrypt;
 
 
public class UserController {

    // Authenticate the user by hashing the inputted password using the stored salt,
    // then comparing the generated hashed password to the stored hashed password
    public static boolean authenticate(String username, String password) {
        if (username.isEmpty() || password.isEmpty()) {
            return false;
        }
        User user = userDao.getUserByUsername(username);
        if (user == null) {
            return false;
        }
        String hashedPassword = BCrypt.hashpw(password, user.getSalt());
        return hashedPassword.equals(user.getHashedPassword());
    }
    public static User getUser(String username){
    	return userDao.getUserByUsername(username);
    }
    // This method doesn't do anything, it's just included as an example
    public static boolean setPassword(String username, String oldPassword, String newPassword) {
        if (authenticate(username, oldPassword)) {
            String newSalt = BCrypt.gensalt();
            String newHashedPassword = BCrypt.hashpw(newSalt, newPassword);
       
            return true;
        }
        return false;
    }
}
