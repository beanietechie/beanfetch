all: build

build:
	cp src/main.sh beanfetch
	chmod +x beanfetch

clean:
	rm beanfetch

install: build
	cp -i beanfetch /usr/local/bin/beanfetch
