package main

import (
	"encoding/json"
	"fmt"
	"net/http"
)

func main() {
	r, err := http.Get("https://raw.githubusercontent.com/daaku/goruntime/master/example/answer.json")
	if err != nil {
		panic(err)
	}
	defer r.Body.Close()

	var res struct {
		Everything string `json:"everything"`
	}
	if err := json.NewDecoder(r.Body).Decode(&res); err != nil {
		panic(err)
	}
	fmt.Println(res)
}
