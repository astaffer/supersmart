package sbox.user;

public interface UserModel {
	User getUserByUsername(String username);
	User getUserByAccessId(String access_id);
	UserView createUser(String username, String newSalt, String newHashedPassword, String email);
	String deleteUser(String username);
	UserView changePassword(String username, String newSalt, String newHashedPassword);
	User updateUser(UserPayload user);
}
