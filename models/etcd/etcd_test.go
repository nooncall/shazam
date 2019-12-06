// Copyright 2019 The Gaea Authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package etcdclient

import (
	"testing"
	"time"

	"github.com/coreos/etcd/client"
)

func Test_isErrNoNode(t *testing.T) {
	err := client.Error{}
	err.Code = client.ErrorCodeKeyNotFound
	if !isErrNoNode(err) {
		t.Fatalf("test isErrNoNode failed, %v", err)
	}
	err.Code = client.ErrorCodeNotFile
	if isErrNoNode(err) {
		t.Fatalf("test isErrNoNode failed, %v", err)
	}
}

func Test_isErrNodeExists(t *testing.T) {
	err := client.Error{}
	err.Code = client.ErrorCodeNodeExist
	if !isErrNodeExists(err) {
		t.Fatalf("test isErrNodeExists failed, %v", err)
	}
	err.Code = client.ErrorCodeNotFile
	if isErrNodeExists(err) {
		t.Fatalf("test isErrNodeExists failed, %v", err)
	}
}

//Test origin function http client
func Test_ClientGuest(t *testing.T) {
	c, err := New("127.0.0.1:4379", time.Minute, "", "", "")
	if err != nil {
		t.Fatalf("test New client err: %s", err)
	}
	paths, err := c.List("/")
	if err != nil {
		t.Fatalf("test list err: %s", err)
	}
	t.Logf("paths: %v", paths)
}

//Test https Tls with get tls config from env
func Test_ClientTls(t *testing.T) {
	//os.Setenv("SHAZAM_CERT_FILE", "client.pem")
	//os.Setenv("SHAZAM_KEY_FILE", "client-key.pem")
	//os.Setenv("SHAZAM_CA_FILE", "ca.pem")
	//
	c, err := New("https://127.0.0.1:2379", time.Minute, "", "", "")
	if err != nil {
		t.Fatalf("test New client err: %s", err)
	}
	paths, err := c.List("/")
	if err != nil {
		t.Fatalf("test list err: %s", err)
	}
	t.Logf("paths: %v", paths)
}
