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
all: go

##########################
# DON'T edit below lines #
#------------------------#
go: $(OBJS)
    @echo "==============================================================="
    mkdir -p gen/go
	protoc $PROTO_PATH --go_out=tutorial $(OBJS)
    @echo "==============================================================="

java: $(OBJS)
    mkdir -p gen/java
    @echo "==============================================================="

clean:
    @$(RM) $(TARGET)