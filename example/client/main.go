package main

import (
	"context"
	"log"
	"time"

	"google.golang.org/grpc"

	userpb "github.com/kyh0703/grpc/gen/v1/user"
)

func main() {
	// 아무래도 grpc 구현관련 조사가 더 필요할꺼같다..
	conn, err := grpc.Dial("localhost:9000", grpc.WithInsecure(), grpc.WithBlock())
	if err != nil {
		log.Fatalf("did not connect: %v", err)
	}
	defer conn.Close()

	c := userpb.NewUserClient(conn)
	ctx, cancel := context.WithTimeout(context.Background(), time.Second)
	defer cancel()

	r, err := c.GetUser(ctx, &userpb.GetUserRequest{UserId: "1"})
	if err != nil {
		log.Fatalf("could not request: %v", err)
	}

	log.Printf("Config: %v", r)
}
