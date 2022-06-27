# trezor-wallet-on-docker

#UPDATE: For reasons I don't know, Trezor team is no longer providing the Trezor wallet files to be run locally. There will be no updates to the docker image.

This image allows anyone who owns a Trezor Hardwalere wallet, to run their own wallet locally.

This work is based on instructions available [here](https://wiki.trezor.io/User_manual:Running_a_local_instance_of_Trezor_Wallet).

Only the wallet is run locally. All the other links navigation bar will go to Trezor servers.

This image runs HTTP server by default on port 8000, but can be overriden by setting the HTTP_SERVER_PORT.
