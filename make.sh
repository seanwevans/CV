rm build/cv* cv.aux cv.log cv.out cv.pdf
lualatex --shell-escape cv.tex
lualatex --shell-escape cv.tex
cp build/cv.md README.md

../stree/stree -sj
