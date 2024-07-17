#!/bin/bash

scp -J ade204@ssh.data.vu.nl build/lib/libRequiredPassesForOptimizerStage.so scp://ade204@$1.compute.vu.nl//local/data/ade204/libs/libRequiredPassesForOptimizerStage.so
scp -J ade204@ssh.data.vu.nl build/lib/libDefaultDynamicAdvisor.so scp://ade204@$1.compute.vu.nl//local/data/ade204/libs/libDefaultDynamicAdvisor.so