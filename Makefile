all:
	Rscript -e "library(devtools); document(); build(path='build')"
