#!/usr/bin/env bash

# this assumes working go set-up (aka. go command works)

go mod tidy

# ordering of commands matter since the failure case assumes we try to generate a mock for an interface that
# references a package with more than one file having the same import with different aliases.
#

# Generate the bad package (the r.go and mock_pack.gen.go should end up
# importing `github.com/sample/sample-gomock/proto` with different aliases)
#
# r.go name here matter since it looks like mockgen parses all the files in alphabetical order so it needs to get the
# wrong one, the one in the mock_xxx first to trigger the condition below.
pushd pack && go generate && popd || exit 1


# Try a generate using the bad package that will fail. This should an error message similar to:
#
# 2024/03/19 13:21:57 Loading input failed: <root>/sample-gomock/pack/r.go:10:13: failed parsing arguments: <root>/sample-gomock/pack/r.go:10:17: unknown package "proto_pb"
# client.go:8: running "mockgen": exit status 1
#
pushd client && go generate && popd || exit 1