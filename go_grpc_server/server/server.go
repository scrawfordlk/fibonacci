package server

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
	} else {
    return fibonacciCalculation(n - 1) + fibonacciCalculation(n - 2)
  }
}

// StartServer initializes and starts the gRPC server
func StartServer(address string) {
	// Set up the listener
	listener, err := net.Listen("tcp", address)
	if err != nil {
		log.Fatalf("Failed to listen on %s: %v", address, err)
	}

	// Create a new gRPC server
	grpcServer := grpc.NewServer()

	// Register the FibonacciServer with the gRPC server
	fibonacci.RegisterFibonacciServiceServer(grpcServer, &FibonacciServer{})

	// Start serving gRPC requests
	log.Printf("gRPC server is running on %s...", address)
	if err := grpcServer.Serve(listener); err != nil {
		log.Fatalf("Failed to serve: %v", err)
	}
}

