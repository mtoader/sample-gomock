package client

import (
	"github.com/sample/sample-gomock/pack"
	proto_pb "github.com/sample/sample-gomock/proto"
)

//go:generate mockgen -source=client.go -package=client -destination=mock_client.gen.go

type I interface {
	pack.I
}

var _ I = &i{}

type i struct{}

func (i i) DoSomething(x *proto_pb.X) (int, error) {
	//TODO implement me
	panic("implement me")
}
