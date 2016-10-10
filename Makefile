# Declare a phone target
.PHONY: all clean

out = data/Advertising.csv data/eda-output.txt data/correlation-matrix.RData images/*.png session-info.txt

all: $(out)

session-info.txt:
	Rscript code/script/session-info-script.R

# The regression object and images
data/regression.RData:
	Rscript code/scripts/regression-script.R data/Advertising
images/*.png:
	Rscript code/scripts/regression-script.R data/Advertising

# The summary statistics file and images
data/eda-output.txt:
	Rscript code/scripts/eda-script.R data/Advertising.csv
data/correlation-matrix.RData:
	Rscript code/scripts/eda-script.R data/Advertising.csv
images/*.png:
	Rscript code/scripts/eda-script.R data/Advertising.csv

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
	rm -f report/report.pdf
	rm -f report/report.html