#!/bin/bash

# Start the container
docker run --name=i2pd  -td -p 7070:7070 -p 4444:4444 -p 4447:4447 -p 9439:9439 hexaedron/i2pd
