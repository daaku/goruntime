package main

import (
	"encoding/json"
	"fmt"
	"net/http"
)

func main() {
	r, err := http.Get("https://graph.facebook.com/DoctorWho")
	if err != nil {
		panic(err)
	}
	defer r.Body.Close()

	var res struct {
		ID   uint64 `json:"id,string"`
		Name string `json:"name"`
		Link string `json:"link"`
	}
	if err := json.NewDecoder(r.Body).Decode(&res); err != nil {
		panic(err)
	}
	fmt.Println(res)
}
