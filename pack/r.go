package pack

import (
	proto_pb "github.com/sample/sample-gomock/proto"
)

//go:generate mockgen -source r.go -destination mock_pack.gen.go -package pack

type I interface {
	DoSomething(x *proto_pb.X) (int, error)
}
