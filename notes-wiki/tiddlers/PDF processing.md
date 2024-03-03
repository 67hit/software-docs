## Merging
Suppose you have `doc1.pdf`, `doc2.pdf`, `doc3.pdf` in the directory then
```cmd
> pdftk doc*.pdf cat output merged.pdf
```
will combine them into the single pdf called `merged.pdf`, in alphabetical order according to the document title.

## Rotating pages
Rotate every other page in `input-doc.pdf` upside down and write it to `output-doc.pdf`:
```cmd
> pdftk input-doc.pdf rotate oddsouth output output-doc.pdf
```

## Cropping pages
[briss](https://sourceforge.net/projects/briss/) is a simple but good app which allows visually cropping odd/even pages.

## References
Some pages with more info:
* [How to rotate pdf files and merge using PDFtk in Linux?](https://techforcurious.website/how-to-rotate-pdf-files-and-merge-in-linux-using-pdftk/)