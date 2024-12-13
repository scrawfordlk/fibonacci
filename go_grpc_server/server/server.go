package main

import (
	"context"
	"go_grpc_server/lib/generated/fibonacci" // Adjust the import path as needed
	"google.golang.org/grpc"
	"log"
	"net"
)

// FibonacciServer struct will implement the FibonacciServiceServer interface
type FibonacciServer struct {
	fibonacci.UnimplementedFibonacciServiceServer
}

// GetFibonacci is the handler for the GetFibonacci RPC method
func (s *FibonacciServer) GetFibonacci(ctx context.Context, req *fibonacci.FibonacciRequest) (*fibonacci.FibonacciResponse, error) {
	n := req.GetNumber()
	result := fibonacciCalculation(n)
	return &fibonacci.FibonacciResponse{FibNumber: result}, nil
}

// fibonacciCalculation calculates the Fibonacci number for a given n
func fibonacciCalculation(n int32) int64 {
	if n <= 1 {
		return int64(n)
	}
	var a, b int64 = 0, 1
	for i := int32(2); i <= n; i++ {
		a, b = b, a+b
	}
	return b
}

func main() {
	// Set up the server and listen for incoming requests
	listener, err := net.Listen("tcp", ":50052")
	if err != nil {
		log.Fatalf("Failed to listen on port 50052: %v", err)
	}

	// Create a new gRPC server
	grpcServer := grpc.NewServer()

	// Register the FibonacciServer with the gRPC server
	fibonacci.RegisterFibonacciServiceServer(grpcServer, &FibonacciServer{})

	// Start serving gRPC requests
	log.Println("gRPC server is running on port 50052...")
	if err := grpcServer.Serve(listener); err != nil {
		log.Fatalf("Failed to serve: %v", err)
	}
}
