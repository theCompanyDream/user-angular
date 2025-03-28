package models

// Paging defines the structure for pagination information
// @Description Paging
type Paging struct {
	// The current page number
	Page *int `json:"page"`
	// The total number of items available
	Length *int `json:"length"`
	// The number of items per page
	PageSize *int `json:"page_size"`
}

// UserDTOPaging defines the structure for user pagination which includes the users and pagination details
// @Description UserDTOPaging
type UserDTOPaging struct {
	Paging // Embedded Paging struct
	// A list of users
	Users []UserInput `json:"users"`
}
