package models

type User struct {
	ID          string `json:"id"`
	DisplayName string `json:"displayName"`
	Username    string `json:"username"`
	Password    string `json:"password"`
}

type PublicUser struct {
	ID          string `json:"id"`
	DisplayName string `json:"displayName" db:"display_name"`
	Username    string `json:"username"`
}

func (user *User) ToPublic() PublicUser {
	return PublicUser{
		DisplayName: user.DisplayName,
		Username:    user.Username,
	}
}
