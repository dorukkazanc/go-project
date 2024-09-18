package controllers

import (
	"encoding/json"
	"net/http"

	"github.com/create-go-app/net_http-go-template/platform/database"
	"github.com/google/uuid"
)

func GetUserProfileById(w http.ResponseWriter, r *http.Request) {
	db, err := database.OpenDBConnection()
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	id, err := uuid.Parse(r.URL.Query().Get("id"))

	if id == uuid.Nil || err != nil {
		payload, _ := json.Marshal(map[string]interface{}{
			"error": true,
			"msg":   "Invalid request",
		})
		w.WriteHeader(http.StatusInternalServerError)
		_, _ = w.Write([]byte(payload))
	}

	users, err := db.GetUserProfileById(id)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	payload, _ := json.Marshal(map[string]interface{}{
		"error": false,
		"msg":   nil,
		"users": users,
	})

	w.Header().Set("Content-Type", "application/json")
	_, _ = w.Write([]byte(payload))

}
