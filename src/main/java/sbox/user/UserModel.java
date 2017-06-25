package sbox.user;

import java.util.List;

public interface UserModel {
	User getUserByUsername(String username);
	User getUserByAccessId(String access_id);
	User createUser(String username, String newSalt, String newHashedPassword, String email);
	String deleteUser(String username);
	User changePassword(String username, String newSalt, String newHashedPassword);
	User updateUser(UserPayload user);
	List<User> getAllUsers();
	List<User> getUsersByRole(String rolename);
	List<String> getRoles();
	User addUserRole(String username, String role);
	User deleteUserRole(String username, String role);
}
