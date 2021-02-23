# fpm2_csv

## What is fpm2_csv ?

XML to CSV data format converter dedicated to the specific format of the export files from Figaro's Password Manager 2.
Figaro's Password Manager 2 (fpm2) is GTK-based application to manage IDs and passwords of many sites.

## Usage

fpm2_csv is a XSLT style sheet. A helper shell script to invoke XSLT conversion is included. Launch it on the command line like:

```
$ sh fpm2_csv.sh /tmp/hkubo_fpm2.xml /tmp/hkubo_fpm2.csv
```

where the first argument is input file, and the second argument is the output file name.
