pandoc=pandoc -s
includes=--filter ./filters/includes.hs
citations=--filter pandoc-citeproc
plantuml=--filter ./filters/plantuml.py
graphviz=--filter ./filters/graphviz.py
dist_folder=dist
output=-o ${dist_folder}/

all: clean specs

specs: checkdir specs.md specs.txt specs.html specs.pdf
	mv *-images ${dist_folder}/

%.md: %.pdoc
	${pandoc} $< ${citations} -t markdown_github ${includes} ${plantuml} ${graphviz} ${output}$@

%.txt: %.pdoc
	${pandoc} $< ${citations} -t plain ${includes} ${output}$@

%.html: %.pdoc
	${pandoc} $< ${citations} -t html5 --mathjax -c ../style.css ${plantuml} ${includes} ${graphviz} ${output}$@

%.pdf: %.pdoc
	${pandoc} $< ${citations} -t latex ${plantuml} ${includes} ${graphviz} ${output}$@

%.png: graphs/%.dot
	dot -Tpng $< > /tmp/$@ && open /tmp/$@

checkdir:
	[ -d "${dist_folder}" ] || mkdir ${dist_folder}

public:
	git checkout master && git pull origin master && git checkout gh-pages && \
		git merge master && make && git add --force dist && git commit && \
		git push origin gh-pages && git checkout master

clean:
	rm -rf ./${dist_folder}
