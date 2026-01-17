package models

type User struct {
	DisplayName string `json:"displayName"`
	Username    string `json:"username"`
	Password    string `json:"password"`
}

type PublicUser struct {
	DisplayName string `json:"displayName"`
	Username    string `json:"username"`
}

func (user *User) ToPublic() PublicUser {
	return PublicUser{
		DisplayName: user.DisplayName,
		Username:    user.Username,
	}
}