package database

import "github.com/create-go-app/net_http-go-template/app/queries"

// Queries struct for collect all app queries.
type Queries struct {
	*queries.UserQueries // load queries from User model
	*queries.UserProfileQueries
}

// OpenDBConnection func for opening database connection.
func OpenDBConnection() (*Queries, error) {
	// Define a new PostgreSQL connection.
	db, err := PostgreSQLConnection()
	if err != nil {
		return nil, err
	}

	return &Queries{
		// Set queries from models:
		UserQueries:        &queries.UserQueries{DB: db},        // from user model
		UserProfileQueries: &queries.UserProfileQueries{DB: db}, // from user_profile model
	}, nil
}
