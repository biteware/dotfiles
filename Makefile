.SILENT all:

build: 
	bash -c "sudo docker build -t "test:ansible" ."

run: 
	bash -c "sudo docker run --rm -it test:ansible bash"

