package main

import (
	"fmt"
	"os"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	echoSwagger "github.com/swaggo/echo-swagger"
	_ "github.com/swaggo/echo-swagger/example/docs" // docs is generated by Swag CLI, you have to import it.

	"github.com/theCompanyDream/user-angular/apps/backend/controller"
	"github.com/theCompanyDream/user-angular/apps/backend/repository"
)

func main() {
	repository.InitDB()
	server := echo.New()

	server.HTTPErrorHandler = controller.HttpErrorHandler

	// Middleware
	server.Use(middleware.Recover())
	server.Use(middleware.Logger())

	// failsafe in case normal requests don't work for you
	server.GET("/swagger/*", echoSwagger.WrapHandler)
	server.GET("/", controller.Home)
	server.GET("/users", controller.GetUsers)
	server.GET("/user/:id", controller.GetUser)
	server.POST("/user", controller.CreateUser)
	server.PUT("/user/:id", controller.UpdateUser)
	server.DELETE("/user/:id", controller.DeleteUser)

	// have proxy requests work
	api := server.Group("/api")
	api.GET("/swagger/*", echoSwagger.WrapHandler)
	api.GET("/", controller.Home)
	api.GET("/users", controller.GetUsers)
	api.GET("/user/:id", controller.GetUser)
	api.POST("/user", controller.CreateUser)
	api.PUT("/user/:id", controller.UpdateUser)
	api.DELETE("/user/:id", controller.DeleteUser)

	server.Logger.Info("Server is running...")
	port := os.Getenv("BACKEND_PORT")
	if port != "" {
		serverStartCode := fmt.Sprintf(":%s", port)
		server.Logger.Fatal(server.Start(serverStartCode))
	} else {
		server.Logger.Fatal(server.Start(":3000"))
	}
}
