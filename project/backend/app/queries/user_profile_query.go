package queries

import (
	"github.com/create-go-app/net_http-go-template/app/models"
	"github.com/google/uuid"
	"github.com/jmoiron/sqlx"
)

// UserProfileQueries struct for queries from User model.
type UserProfileQueries struct {
	*sqlx.DB
}

func (q *UserProfileQueries) GetUserProfiles() ([]models.UserProfile, error) {
	var userProfiles []models.UserProfile

	if err := q.Select(&userProfiles, `SELECT * FROM user_profiles`); err != nil {
		return []models.UserProfile{}, err
	}

	return userProfiles, nil
}

func (q *UserProfileQueries) GetUserProfileById(id uuid.UUID) (models.UserProfile, error) {
	var userProfile models.UserProfile

	if err := q.Get(&userProfile, `SELECT * FROM user_profiles WHERE id = $1`, id); err != nil {
		return models.UserProfile{}, err
	}

	return userProfile, nil
}

func (q *UserProfileQueries) CreateUserProfile(u *models.UserProfile) error {
	if _, err := q.Exec(
		`INSERT INTO user_profiles VALUES ($1, $2, $3, $4, $5, $6, $7)`,
		u.ProfileID,
		u.UserID,
		u.FirstName,
		u.LastName,
		u.Bio,
		u.AvatarURL,
		u.CreatedAt,
	); err != nil {
		return err
	}

	return nil
}

func (q *UserProfileQueries) UpdateUserProfile(u *models.UserProfile) error {
	if _, err := q.Exec(
		`UPDATE user_profiles SET first_name = $1, last_name = $2, bio = $3, avatar_url = $4, updated_at = $5 WHERE id = $6`,
		u.FirstName,
		u.LastName,
		u.Bio,
		u.AvatarURL,
		u.UpdatedAt,
		u.ProfileID,
	); err != nil {
		return err
	}

	return nil
}

func (q *UserProfileQueries) DeleteUserProfile(id uuid.UUID) error {
	if _, err := q.Exec(`DELETE FROM user_profiles WHERE id = $1`, id); err != nil {
		return err
	}

	return nil
}
