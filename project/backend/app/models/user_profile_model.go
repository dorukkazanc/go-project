package models

import (
	"database/sql/driver"
	"encoding/json"
	"time"

	"github.com/google/uuid"
)

type UserProfile struct {
	ProfileID uuid.UUID  `db:"profile_id" json:"profile_id"`
	UserID    uuid.UUID  `db:"user_id" json:"user_id"`
	FirstName string     `db:"first_name" json:"first_name"`
	LastName  string     `db:"last_name" json:"last_name"`
	Bio       string     `db:"bio" json:"bio,omitempty"`
	AvatarURL string     `db:"avatar_url" json:"avatar_url,omitempty"`
	CreatedAt time.Time  `db:"created_at" json:"created_at"`
	UpdatedAt *time.Time `db:"updated_at" json:"updated_at,omitempty"`
}

func (u UserProfile) Value() (driver.Value, error) {
	return json.Marshal(u)
}
