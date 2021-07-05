package main

import (
	"log"
	"net"

	"google.golang.org/grpc"
)

func main() {
	lis, err := net.Listen("tcp", ":"+"9000")
	if err != nil {
		log.Fatalln(err)
	}

	grpcServer := grpc.NewServer()
	log.Printf("Start gRPC Server On %s port", "9000")
	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalln(err)
	}
}
