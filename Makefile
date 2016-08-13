pandoc=pandoc -s
includes=--filter ./filters/includes.hs
citations=--filter pandoc-citeproc
plantuml=--filter ./filters/plantuml.py
graphviz=--filter ./filters/graphviz.py
dist_folder=dist
output=-o ${dist_folder}/

all: clean specs

specs: checkdir specs.md specs.txt specs.html
	mv *-images ${dist_folder}/

%.md: %.pdoc
	${pandoc} $< ${citations} -t markdown_github ${includes} ${plantuml} ${graphviz} ${output}$@

%.txt: %.pdoc
	${pandoc} $< ${citations} -t plain ${includes} ${output}$@

%.html: %.pdoc
	${pandoc} $< ${citations} -t html5 ${plantuml} ${includes} ${graphviz} ${output}$@

%.png: graphs/%.dot
	dot -Tpng $< > /tmp/$@ && open /tmp/$@

checkdir:
	[ -d "${dist_folder}" ] || mkdir ${dist_folder}

clean:
	rm -rf ./${dist_folder}
