all: pan
	./pan -a -f -N sample
	./pan -a -f -N send

pan: pan.c
	gcc -o pan pan.c

pan.c: model.pml
	spin -a model.pml

clean:
	$(RM) pan.* pan *.tmp *.trail
