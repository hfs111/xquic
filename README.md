# XQUIC
<img src="docs/images/xquic_logo.png" alt="xquic logo" width=585.9 height=309.1/>

![GitHub](https://img.shields.io/github/license/alibaba/xquic)
[![Build](https://github.com/alibaba/xquic/actions/workflows/build.yml/badge.svg)](https://github.com/alibaba/xquic/actions/workflows/build.yml)
[![CodeQL](https://github.com/alibaba/xquic/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/alibaba/xquic/actions/workflows/codeql-analysis.yml)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/485e758edd98409bb7a51cbb803838c4)](https://www.codacy.com/gh/alibaba/xquic/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=alibaba/xquic&amp;utm_campaign=Badge_Grade)
[![Codacy Badge](https://app.codacy.com/project/badge/Coverage/485e758edd98409bb7a51cbb803838c4)](https://www.codacy.com/gh/alibaba/xquic/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alibaba/xquic&utm_campaign=Badge_Coverage)
![Platforms](https://img.shields.io/badge/platform-Android%20%7C%20iOS%20%7C%20Linux%20%7C%20macOS-blue)
[![DeepWiki](https://img.shields.io/badge/DeepWiki-alibaba%2Fxquic-blue.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAyCAYAAAAnWDnqAAAAAXNSR0IArs4c6QAAA05JREFUaEPtmUtyEzEQhtWTQyQLHNak2AB7ZnyXZMEjXMGeK/AIi+QuHrMnbChYY7MIh8g01fJoopFb0uhhEqqcbWTp06/uv1saEDv4O3n3dV60RfP947Mm9/SQc0ICFQgzfc4CYZoTPAswgSJCCUJUnAAoRHOAUOcATwbmVLWdGoH//PB8mnKqScAhsD0kYP3j/Yt5LPQe2KvcXmGvRHcDnpxfL2zOYJ1mFwrryWTz0advv1Ut4CJgf5uhDuDj5eUcAUoahrdY/56ebRWeraTjMt/00Sh3UDtjgHtQNHwcRGOC98BJEAEymycmYcWwOprTgcB6VZ5JK5TAJ+fXGLBm3FDAmn6oPPjR4rKCAoJCal2eAiQp2x0vxTPB3ALO2CRkwmDy5WohzBDwSEFKRwPbknEggCPB/imwrycgxX2NzoMCHhPkDwqYMr9tRcP5qNrMZHkVnOjRMWwLCcr8ohBVb1OMjxLwGCvjTikrsBOiA6fNyCrm8V1rP93iVPpwaE+gO0SsWmPiXB+jikdf6SizrT5qKasx5j8ABbHpFTx+vFXp9EnYQmLx02h1QTTrl6eDqxLnGjporxl3NL3agEvXdT0WmEost648sQOYAeJS9Q7bfUVoMGnjo4AZdUMQku50McDcMWcBPvr0SzbTAFDfvJqwLzgxwATnCgnp4wDl6Aa+Ax283gghmj+vj7feE2KBBRMW3FzOpLOADl0Isb5587h/U4gGvkt5v60Z1VLG8BhYjbzRwyQZemwAd6cCR5/XFWLYZRIMpX39AR0tjaGGiGzLVyhse5C9RKC6ai42ppWPKiBagOvaYk8lO7DajerabOZP46Lby5wKjw1HCRx7p9sVMOWGzb/vA1hwiWc6jm3MvQDTogQkiqIhJV0nBQBTU+3okKCFDy9WwferkHjtxib7t3xIUQtHxnIwtx4mpg26/HfwVNVDb4oI9RHmx5WGelRVlrtiw43zboCLaxv46AZeB3IlTkwouebTr1y2NjSpHz68WNFjHvupy3q8TFn3Hos2IAk4Ju5dCo8B3wP7VPr/FGaKiG+T+v+TQqIrOqMTL1VdWV1DdmcbO8KXBz6esmYWYKPwDL5b5FA1a0hwapHiom0r/cKaoqr+27/XcrS5UwSMbQAAAABJRU5ErkJggg==)](https://deepwiki.com/alibaba/xquic)
<!-- DeepWiki badge generated by https://deepwiki.ryoppippi.com/ -->
+ [官方文档](https://doc.xquic.org.cn)
+ [AI文档](https://deepwiki.com/alibaba/xquic/)
+ [简体中文文档 README-zh-CN](https://github.com/alibaba/xquic/blob/main/docs/docs-zh/README-zh.md)

## Introduction

XQUIC Library released by Alibaba is …

… **a client and server implementation of QUIC and HTTP/3 as specified by the IETF.** Currently supported QUIC versions are v1 and draft-29.

… **OS and platform agnostic.** It currently supports Android, iOS, HarmonyOS, Linux, macOS and Windows(v1.2.0). Most of the code is used in our own products, and has been tested at scale on android, iOS apps, as well as servers.

… **still in active development.** [Interoperability](https://interop.seemann.io/) is regularly tested with other QUIC implementations.

### Features

[![](https://img.shields.io/static/v1?label=RFC&message=9000&color=brightgreen)](https://tools.ietf.org/html/rfc9000)
[![](https://img.shields.io/static/v1?label=RFC&message=9001&color=brightgreen)](https://tools.ietf.org/html/rfc9001)
[![](https://img.shields.io/static/v1?label=RFC&message=9002&color=brightgreen)](https://tools.ietf.org/html/rfc9002)
[![](https://img.shields.io/static/v1?label=RFC&message=9114&color=brightgreen)](https://tools.ietf.org/html/rfc9114)
[![](https://img.shields.io/static/v1?label=RFC&message=9204&color=brightgreen)](https://tools.ietf.org/html/rfc9204)
[![](https://img.shields.io/static/v1?label=RFC&message=9221&color=brightgreen)](https://datatracker.ietf.org/doc/html/rfc9221)


[![](https://img.shields.io/static/v1?label=draft-13&message=QUIC-LB&color=9cf)](https://tools.ietf.org/html/draft-ietf-quic-load-balancers-13)
[![](https://img.shields.io/static/v1?label=draft-05&message=Multipath-QUIC&color=9cf)](https://tools.ietf.org/html/draft-ietf-quic-multipath-05)
[![](https://img.shields.io/static/v1?label=draft-06&message=Multipath-QUIC&color=9cf)](https://tools.ietf.org/html/draft-ietf-quic-multipath-06)
[![](https://img.shields.io/static/v1?label=draft-07&message=QUIC-Qlog&color=9cf)](https://datatracker.ietf.org/doc/html/draft-ietf-quic-qlog-main-schema-07)

#### Standardized Features

* All big features conforming with [RFC 9000](https://www.rfc-editor.org/rfc/rfc9000), [RFC9001](https://www.rfc-editor.org/rfc/rfc9001), [RFC9002](https://www.rfc-editor.org/rfc/rfc9002), [RFC9114](https://www.rfc-editor.org/rfc/rfc9114) and [RFC9204](https://www.rfc-editor.org/rfc/rfc9204), including the interface between QUIC and TLS, 0-RTT connection establishment, HTTP/3 and QPACK.
* ALPN Extension conforming with [RFC7301](https://www.rfc-editor.org/rfc/rfc7301)

#### Not Yet Standardized Features

* [Multipath QUIC](https://tools.ietf.org/html/draft-ietf-quic-multipath-04)
* [QUIC-LB](https://tools.ietf.org/html/draft-ietf-quic-load-balancers-13)

#### Library Features

* Pluggable congestion control: NewReno, Cubic, BBR and BBRv2, ...
* Pluggable cryptography, integration with BoringSSL and BabaSSL
* Cross-platform implementation, support Android, iOS, HarmonyOS, Linux, macOS and Windows(v1.2.0)

## Requirements

To build XQUIC, you need 
* CMake
* BoringSSL or BabaSSL

To run test cases, you need
* libevent
* CUnit

## QuickStart Guide

XQUIC can be built with BabaSSL(Tongsuo) or BoringSSL.

### Build with BoringSSL

```bash
sudo apt-get install -y build-essential libevent-dev

# get XQUIC source code
git clone https://github.com/alibaba/xquic.git; cd xquic

# get and build BoringSSL
git clone https://github.com/google/boringssl.git ./third_party/boringssl; cd ./third_party/boringssl
mkdir -p build && cd build
cmake -DBUILD_SHARED_LIBS=0 -DCMAKE_C_FLAGS="-fPIC" -DCMAKE_CXX_FLAGS="-fPIC" ..
make -j ssl crypto
cd ..
SSL_TYPE_STR="boringssl"
SSL_PATH_STR="${PWD}"
cd ../..

# build XQUIC with BoringSSL
# When build XQUIC with boringssl, by default XQUIC will use boringssl
# in third_party. If boringssl is deployed in other directories, SSL_PATH could be 
# used to specify the search path of boringssl
git submodule update --init --recursive
mkdir -p build; cd build
cmake -DGCOV=on -DCMAKE_BUILD_TYPE=Debug -DXQC_ENABLE_TESTING=1 -DXQC_SUPPORT_SENDMMSG_BUILD=1 -DXQC_ENABLE_EVENT_LOG=1 -DXQC_ENABLE_BBR2=1 -DXQC_ENABLE_RENO=1 -DSSL_TYPE=${SSL_TYPE_STR} -DSSL_PATH=${SSL_PATH_STR} ..

# exit if cmake error
if [ $? -ne 0 ]; then
    echo "cmake failed"
    exit 1
fi

make -j
```

### Build with BabaSSL(Tongsuo)

```bash
sudo apt-get install -y build-essential libevent-dev

# get XQUIC source code
git clone https://github.com/alibaba/xquic.git; cd xquic

# get and build BabaSSL(Tongsuo)
git clone -b 8.3-stable https://github.com/Tongsuo-Project/Tongsuo.git ./third_party/babassl; cd ./third_party/babassl/
./config --prefix=/usr/local/babassl
make -j
SSL_TYPE_STR="babassl"
SSL_PATH_STR="${PWD}"
cd -

# build XQUIC with BabaSSL
# When build XQUIC with babassl, /usr/local/babassl directory will be searched
# as default. If babassl is deployed in other directories, SSL_PATH could be 
# used to specify the search path of babassl
git submodule update --init --recursive
mkdir -p build; cd build
cmake -DGCOV=on -DCMAKE_BUILD_TYPE=Debug -DXQC_ENABLE_TESTING=1 -DXQC_SUPPORT_SENDMMSG_BUILD=1 -DXQC_ENABLE_EVENT_LOG=1 -DXQC_ENABLE_BBR2=1 -DXQC_ENABLE_RENO=1 -DSSL_TYPE=${SSL_TYPE_STR} -DSSL_PATH=${SSL_PATH_STR} ..

# exit if cmake error
if [ $? -ne 0 ]; then
    echo "cmake failed"
    exit 1
fi

make -j
```

### Run testcases

```bash
sh ../scripts/xquic_test.sh
```

## Documentation

* For using the API, see the [API docs](./docs/API.md).
* For platform support details, see the [Platforms docs](./docs/Platforms.md).
* For Chinese Simplified (zh-CN) translation of the IETF QUIC Protocol, see the Translation docs.
    - [RFC8999-invariants-zh](./docs/translation/rfc8999-invariants-zh.md)
    - [RFC9000-transport-zh](./docs/translation/rfc9000-transport-zh.md)
    - [RFC9001-tls-zh](./docs/translation/rfc9001-tls-zh.md)
    - [RFC9002-recovery-zh](./docs/translation/rfc9002-recovery-zh.md)
    - [draft-ietf-quic-http-34-zh](./docs/translation/draft-ietf-quic-http-34-zh.md)
    - [draft-ietf-quic-qpack-21-zh](./docs/translation/draft-ietf-quic-qpack-21-zh.md)
    - [RFC9221-datagram-zh](./docs/translation/rfc9221-datagram-zh.md)

* For using quic-qlog, see the [Features: qlog](./docs/Features.md)
* For testing the library, see the [Testing docs](./docs/docs-zh/Testing-zh.md).
* For other frequently asked questions, see the [FAQs](./docs/docs-zh/FAQ-zh.md) and [Trouble Shooting Guide](./docs/docs-zh/Troubleshooting-zh.md).

## Contributing

We would love for you to contribute to XQUIC and help make it even better than it is today! All types of contributions are encouraged and valued. Thanks to [all contributors](https://github.com/alibaba/xquic/blob/main/CONTRIBUTING.md#all-contributors). See our [Contributing Guidelines](./CONTRIBUTING.md) for more information.

If you have any questions, please feel free to open a new Discussion topic in our [discussion forums](https://github.com/alibaba/xquic/discussions).

## License

XQUIC is released under the Apache 2.0 License.

## Contact Us

Feel free to contact us in the following ways:

* e-mail: xquic@alibaba-inc.com
* Dingtalk group: 34059705
* slack channel: #xquic in quicdev group

  <img src="docs/images/dingtalk_group.JPG" width=200 alt="dingtalk group"/>
