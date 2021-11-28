package main

import (
	"myapp/data"
	"myapp/handlers"
	"myapp/middleware"

	"github.com/youngjae-lim/gosnel"
)

type application struct {
	App        *gosnel.Gosnel
	Handlers   *handlers.Handlers
	Models     data.Models
	Middleware *middleware.Middleware
}

func main() {
	g := initApplication()
	g.App.ListenAndServe()
}
