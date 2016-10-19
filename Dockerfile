FROM debian:jessie
MAINTAINER Cube <kyb.6.granei@yandex.ru>

# We will need these ports to use proxies and web console
EXPOSE 4444 4447 7070 9439
 
# Make our image up-to-date (optional)
# Install the dependensies for i2pd
RUN apt-get update -y  && \
    apt-get upgrade -y && \
    apt-get install -y  wget				\
			libboost-date-time1.55.0 	\
			libboost-filesystem1.55.0 	\
			libboost-program-options1.55.0 	\
			libboost-system1.55.0 		\
			libminiupnpc10               && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*  /tmp/*

# Fetch the latest package and install it
RUN cd /tmp && \
    wget https://github.com/PurpleI2P/i2pd/releases/download/2.10.0/i2pd_2.10.0-1jessie1_amd64.deb && \
    dpkg -i /tmp/i2pd_2.10.0-1jessie1_amd64.deb && \
    rm /tmp/*.deb

# Make the i2pd user availiable 
RUN usermod -s /bin/bash i2pd 

# Copy configs into the container
COPY i2pd.conf /etc/i2pd/i2pd.conf
COPY subscriptions.txt /etc/i2pd/subscriptions.txt 

# Define the entrypoint
# This allows our container to run as binary
ENTRYPOINT exec su - i2pd -c "/usr/sbin/i2pd --conf ~/i2pd.conf"
