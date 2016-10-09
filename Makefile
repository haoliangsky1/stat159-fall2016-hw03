# Declare a phone target
.PHONY: all clean


# The raw data file
data/Advertising.csv:
	curl -O http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv 
	mv Advertising.csv data/Advertising.csv




# Create phony clean commands
clean:
	# rm -f data/Advertising.csv
	# rm -f data/eda-output.txt
	# rm -f data/regression.rData
	# rm -f images/*.png
	# rm -f images/*.pdf
	rm -f report/report.pdf
	rm -f report/report.html