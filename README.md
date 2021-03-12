# fpm2_csv

## What is this?

**fpm2_csv** is a XML to CSV data format converter dedicated to the specific format of the export files from Figaro's Password Manager 2.
[Figaro's Password Manager 2](https://als.regnet.cz/fpm2/) (in short, fpm2) is a GTK2-based application to manage personal account data including pairs of ID and password.

## Usage

The main body of fpm2_csv is a XSLT style sheet.
A helper shell script to invoke XSLT conversion is included.
Suppose you have exported your account data from fpm2 with the menu item File > Export Passwords to a file whose name is `your_fpm2_id_cw.xml`. You can convert the `your_fpm2_id_pw.xml` to a CSV format file `your_fpm2_id_pw.csv` with the command like:

```
$ sh fpm2_csv.sh your_fpm2_id_pw.xml your_fpm2_id_pw.csv
```

As you may imagine, the first argument is the input file and the second argument is the output file name.

Actually, `fpm2_csv.sh` is just a wrapper shell script to invoke `xsltproc` command, which is distributed at the [libxslt site](http://xmlsoft.org/xslt/), and the XSLT style sheet `fpm2_csv.xsl` is named as a style sheet.
`fpm2_csv.xsl` is supposed to work with other XSL processors other than `xsltproc`, but the author has never tested.

## Specification

### Data item

The data items to be converted are:
category, title, user, password, url, notes

### Data structure

Each line contains only one password entry.
All the items may contain double-quote, comma, and line breaks. They should be escaped properly in CSV format.

### Character encoding
Only UTF-8 is supported both for input and output.

## Notes

- Some kind of data items are left unprocessed in fpm2 export file, just because they are out of my interest.

- Against my first impression before development, escaping special characters in CSV is accomplished only with XSLT functions. You can learn how to do that with this style sheet.


## Background

Figaro's Password Manager 2 was once packaged for Debian GNU/Linux distribution and I could use it easily. But as the package was orphaned, I came to change to another password manager. But moving the acount data in it by hand was totally painful and risky for me, I wrote fpm2_csv for myself.

## License

See the file COPYING.

## Author

Hiroshi Kubo

