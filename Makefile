################################################
# IPRON Source Directory & Environment Setting #
#----------------------------------------------#

############################
# Main Sources and Objects #
# (Edit your TARGET name.) #
#--------------------------#
SRCS = $(wildcard *.proto)
OBJS = $(SRCS:.proto=$@)

##################################################
# Linking Part                                   #
# (Select linking option on your TARGET purpose) #
#------------------------------------------------#
all: $(OBJS)
$(OBJS): $(SRCS)
    pandoc --standalone --to man $@.md -o $@

##########################
# DON'T edit below lines #
#------------------------#
go: $(OBJS)
    @echo "==============================================================="

java: $(OBJS)
    @echo "==============================================================="

clean:
    @$(RM) $(TARGET)