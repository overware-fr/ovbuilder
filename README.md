# OVBuilder

This builder is to compile C++ overware programs.
There are also a bunch of tools integrated like :

 * *Doxygen* to generate the Doxygen from the code comment

 * *cppcheck* to do a static analysis of the code

 * rfc tools (*kramdown-rfc2629*, and *xml2rfc*) to generate rfcs from markdown files


## Configuration

There are two argument to select which version of openssl and zlib you want:

 * OPENSSL_PACKAGE (default: `openssl-1.1.1a`)

 * ZLIB_PACKAGE (default: `1.2.8`)

If you want to change them at build add the option :
```shell
--build-arg OPENSSL_PACKAGE=openssl-1.1.1a --build-arg ZLIB_PACKAGE=1.2.8
```

## Create builder

To create builders images use the Makefile.
All makefile target are listed by typing :
```shell
make help
```

## Use builder

To use the builder, you have to :

 * Map the folder which contain your products `-v [product_path]:/opt/`

 * Specify the product name `-e PRODUCTNAME=[product_name]`

 * You have the option to indicate the number of thread you want to use `-e PARALLEL=[number_threads]`

After that the default entrypoint is *build-product* to build your product.
But you can select entrypoint :

 * *analyse-stacktrace* : print a stacktrace from program address

 * *build-cppanalysis* : do a cppcheck analysis and put the result to cpp.analysis

 * *build-doc* : generate the Doxyfile program documentation

 * *build-rfc* : generate all rfcs associate to a program


## Example

Compile a debian product
```shell
docker run -ti --rm -h dev-builder --name dev-builder  -e PRODUCTNAME=AwesomeProduct -v /home/toto/AwesomeProject:/opt/ overware/ovbuilder:debian
```

Compile a centos product
```shell
docker run -ti --rm -h dev-builder --name dev-builder  -e PRODUCTNAME=AwesomeProduct -v /home/toto/AwesomeProject:/opt/ overware/ovbuilder:centos
```

Run a cppcheck analysis
```shell
docker run -ti --rm -h dev-builder --name dev-builder  -e PRODUCTNAME=AwesomeProduct -v /home/toto/AwesomeProject:/opt/ --entrypoint /usr/local/bin/build-cppanalysis overware/ovbuilder:debian
```
