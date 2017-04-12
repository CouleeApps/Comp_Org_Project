CC = clang
CFLAGS = -O2 -Wall
LDFLAGS = -lm
SOURCES = iplc-sim.c
EXECUTABLE = iplc-sim

all: $(SOURCES)
	$(CC) $(CFLAGS) $(SOURCES) -o $(EXECUTABLE) $(LDFLAGS)

clean:
	rm $(EXECUTABLE)
