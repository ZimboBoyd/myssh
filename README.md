# rev-ssh

## Building

Copy the sources to your docker host and build the container:

	# docker build --rm -t revssh .

## Running

To run the container, binding to port 2200 on the host:

    # docker run --name revssh -d -p 2200:22 -v ssh:/home/user/.ssh revssh

This will create a user named `user` with a randomly generated
password.  You can obtain the password via `docker logs`:

    # docker logs ssh | grep 'ssh user password'
    ssh user password: O2WXqqQ1CWwXHxrLZGip

You can set a specific password using the `SSH_USERPASS` environment
variable:

    # docker run --name ssh -d -p 2200:22 \
      -e SSH_USERPASS=secret revssh
