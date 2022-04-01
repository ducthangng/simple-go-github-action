package main

import (
	"github.com/gin-gonic/gin"
)

func main() {

	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})

	r.GET("/user", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"username": "duc thang",
			"dob":      "01/01/1990",
			"job":      "unemployed",
		})
	})

	_ = r.Run(":8080") // listen and serve on
}
