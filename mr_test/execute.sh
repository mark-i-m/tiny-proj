#!/bin/bash

hadoop fs -rm -r /output
hadoop jar ac.jar MRApplication /input /output $1
