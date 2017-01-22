# concourse

A Resource Cookbook for installing and configuring the components of Concourse CI.

## Requirements

## Platform Support

## Cookbook Dependencies

## Recipes

## Resources

### concourse_web

#### Properties

 * `version` - The version of concourse to install
 * `basic_auth_username` - The username to use for basic authentication
 * `basic_auth_password` - The password to use for basic authentication
 * `session_signing_key` - A path pointing at the key used for signing user session tokens
 * `tsa_host_key` - A path pointing to the host key used for the TSA's SSH server
 * `tsa_authorized_keys` - A file pointing to the authorized keys file used for the TSA's SSH server
 * `postgres_data_source` - The postgresql connection string

#### Actions

 - `:install`
 - `:enable`
 - `:disable`
 - `:start`
 - `:stop`
 - `:restart`

## Maintainers

 - Brandon Raabe ([brandocorp@gmail.com](mailto:brandocorp@gmail.com))

## License

    The MIT License (MIT)

    Copyright (c) 2017 Brandon Raabe

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
