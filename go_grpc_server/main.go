package main

import (
	"go_grpc_server/server" // Import the server package
	"log"
)

func main() {
	// Define the address and port for the gRPC server to listen on
	address := ":50052"
	
	// Start the gRPC server
	server.StartServer(address)

	// This point will not be reached unless the server stops
	log.Println("Server stopped.")
}
