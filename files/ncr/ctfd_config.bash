#! /usr/bin/env bash
set -x
exec 2>/tmp/ctfd_config.log

repos_server="yast.it.ntnu.no"
export DEBIAN_FRONTEND="noninteractive"

apt-key add - <<xxxEOF
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1

mQGiBEHuawYRBAClpdLW5xFq76MGAbe1jUtRA/DzCqRIxMl9xEYMwHCX/kGmlwFO
XJgkACiBXGGc52ard7I8EzygKY3xU9CnnAYQVGYUI5te7EtTdZ9iDfcqG7lS81YJ
x9QINqxGxYomaW8lm3E5RdAmFZ6N7/I6zo4RT8bram/fQ5j6TrXVybablwCgtErj
HzCIVUvrZ5AnG5bk8tawgzED/j9ZQJDiuy9U8AAc8xjQYK0fXtT+3KEnk7WUanS2
jLxtlCdNfhcrX7o6KlNADq3RKD9P7KohRZKFYOWbEojZk+Y3fW/edkjeSDfxLV1O
GZ7q2rwvmaUZGbfzp3yi87wOQ6KWnrXbzaiUj8c+2Gaan/3fYJgVtA0X3ND2kqju
6FXPA/9m8XH1Yct6/TFlmb71u18qvEIdn6/Y+/hc5eiTruBwAmgqbN8Pr77QeCYH
Rj8FTZMw14RlDkzxl2bcF89g54nxiNEvr1U4/l8X4y+8smsWuMeG+yoi+708MKQL
JO5xCb63W6SRbPW2QgdtqIfGyZzTzj8rzgLpHf0i+gejw22iv7RNSVRFQSBTeXN0
ZW1kcmlmdCAoTsO4a2tlbCBmb3IgZWdlbmtvbXBpbGVydGUgcGFra2VyKSA8ZHJp
ZnRtYWlsQGl0ZWEubnRudS5ubz6IXgQTEQIAHgIbAwYLCQgHAwIDFQIDAxYCAQIe
AQIXgAUCWnCJ6AAKCRBNqBv0tIHKS929AJ90GNNFPnIAVqRc17yHivdXrILb3ACg
qVgxxlp7qY0SxAxyjhS3ShXSVl0=
=0pI0
-----END PGP PUBLIC KEY BLOCK-----
xxxEOF

add-apt-repository "deb http://${repos_server}/ubuntu/focal-packages ./"

apt-get install -y ctfd

systemctl start ctfd.service
systemctl start ctfd-celery.service
