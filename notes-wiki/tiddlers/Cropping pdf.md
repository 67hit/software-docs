## Crop pdf
```sh
> gswin32c -o out-cropped.pdf -sDEVICE=pdfwrite -c "[/CropBox [77 95 480 695] /PAGES pdfmark" -f input.pdf
```

### Save and load bookmarks
```sh
> pdftk "input file.pdf" dump_data output bookmarks.txt
> pdftk "input file no bookmarks.pdf" update_info bookmarks.txt output "file with bookmarks.pdf"
```

### Collate even/odd pages
```sh
> pdftk A=odd_pages.pdf B=even_pages.pdf shuffle A B output collated_pages.pdf
```

## Password protect PDF
`> pdftk <no-password.pdf> output <with-password.pdf> user_pw <password>`
