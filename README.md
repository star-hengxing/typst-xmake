# Typst xmake

Use xmake as build system to compile typst to pdf.

# Getting started

On windows, try

```sh
scoop install xmake typst
```

```sh
xmake
```

After compilation success, you can find your pdf in `build\.gens\resume\windows\x64\release\rules\typst\resume.typ.pdf`.

# Live coding

Open the compiled pdf file using your favorite pdf reader, then try

```sh
xmake watch -d src
```

Modifying `src/resume.typ` and save, xmake will automatically recompile.

# Reference

- [typst-cv-template](https://github.com/skyzh/typst-cv-template)
