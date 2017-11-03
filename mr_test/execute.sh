#!/bin/bash

hadoop fs -rm -r /output
time hadoop jar ac.jar MRApplication /input /output $1
