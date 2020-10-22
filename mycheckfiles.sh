#!/bin/bash

# Run this file as "./checkfiles.sh <NUM_CHANNELS>"

echo "Checking number of non-spiketrain and non-mountains .hkl files created..."
EXPECTED_NUM_HKL=$((5 + 6*$1))
ACTUAL_NUM_HKL=$( find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l )

echo "Expected number of .hkl files for $1 channels: $EXPECTED_NUM_HKL"
echo "Actual number of .hkl files created: $ACTUAL_NUM_HKL"
if [ $EXPECTED_NUM_HKL -eq $ACTUAL_NUM_HKL ]; then
	echo "SUCCESS: Number of .hkl files matched expected values"
else
	echo "FAIL: Number of .hkl files did not match expected values"
fi
echo ""

echo "Checking number of spike files created in mountains/..."
ACTUAL_NUM_SPIKE=$( find mountains -name "firings.mda" | wc -l )

echo "Expected number of files created: $1"
echo "Actual number of files created: $ACTUAL_NUM_SPIKE"
if [ $ACTUAL_NUM_SPIKE -eq $1 ]; then
	echo "SUCCESS: Number of spike files created in mountains/ matched expected values"
else
	echo "FAIL: Number of spike files created in mountains/ did not match expected values"
fi
