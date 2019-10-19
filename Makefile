# make uiflow

# output image name
TARGET  = flow.png
FLOWTXT = tmp.txt
SRCDIR  = flow
FLOWS   = $(foreach dir, $(SRCDIR), $(wildcard $(dir)/*.txt))

#$(warning $(FLOWS))

all: $(TARGET)

$(TARGET):$(FLOWTXT)
	uiflow -i $(FLOWTXT) -o $(TARGET) -f png

$(FLOWTXT): $(FLOWS)
	cat $(FLOWS) > $(FLOWTXT)

open: $(TARGET)
	open $(TARGET)

clean:
	rm -fr $(FLOWTXT)
	rm -fr $(TARGET)
