# This Makefile was tested with GNU Make
CC=gcc

# Use pkg-config to lookup the proper compiler and linker flags for LCM
CFLAGS=`pkg-config --cflags lcm`
LDFLAGS=`pkg-config --libs lcm`

all: listener \
	listener-async \
	send-message \
	read-log

testlib: exlcm_example_t.o
	$(CC) -shared -o libexlcm_example_t.so $^ $(LDFLAGS)

listener: listener.o
	$(CC) -L/home/dehann/.julia/v0.6/LCMCore/deps/src/lcm-9e53469cd0713ca8fbf37a968f6fd314f5f11584/examples/c -o $@ $^ $(LDFLAGS) -lexlcm_example_t

  # prevent auto-generated lcm .c/.h files from being deleted
  .SECONDARY : exlcm_example_t.c exlcm_example_t.h

  %.o: %.c %.h
  	$(CC) $(CFLAGS) -fPIC -c $<

  exlcm_%.c exlcm_%.h: %.lcm
  	lcm-gen -c $<

  clean:
  	rm -f listener
    rm -f libexlcm_example_t.so
  	rm -f *.o
  	rm -f exlcm_example_t.c exlcm_example_t.h
