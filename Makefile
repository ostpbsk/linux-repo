BINARY = bin
CC=gcc
INCLDIRS=. ./inc/
CODEDIRS=. lib
DEPFLAGS= -MD -MP
CFLAGS= -Wall -Wextra -g $(foreach D, $(INCLDIRS), -I$(D)) $(DEPFLAGS)

CFILES=$(foreach D,$(CODEDIRS),$(wildcard $(D)/*.c))

OBJECTS=$(patsubst %.c,%.o,$(CFILES))
DEPS=$(patsubst %.c,%.d,$(CFILES))

.PHONY: all clean

all: $(BINARY)
	$(info Successfuly created a bin file)

$(BINARY) : $(OBJECTS)
	$(CC) -o $@ $^

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean: 
	rm -rf $(OBJECTS) $(DEPS)

-include $(DEPS)