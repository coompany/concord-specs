pandoc=pandoc -s
citations=--filter pandoc-citeproc
plantuml=--filter ./filters/plantuml.py
graphviz=--filter ./filters/graphviz.py
dist_folder=dist
output=-o ${dist_folder}/

all: clean specs

specs: checkdir specs.md specs.txt specs.html
	mv plantuml-images graphviz-images ${dist_folder}/

%.md: %.pdoc
	${pandoc} $< ${citations} -t markdown_github ${plantuml} ${graphviz} ${output}$@

%.txt: %.pdoc
	${pandoc} $< ${citations} -t plain ${output}$@

%.html: %.pdoc
	${pandoc} $< ${citations} -t html5 ${plantuml} ${graphviz} ${output}$@

checkdir:
	[ -d "${dist_folder}" ] || mkdir ${dist_folder}

clean:
	rm -rf ./${dist_folder}
