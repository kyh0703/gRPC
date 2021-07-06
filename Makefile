################################################
# IPRON Source Directory & Environment Setting #
#----------------------------------------------#
GEN_PATH=gen
PROTO_PATH=protos

############################
# Main Sources and Objects #
# (Edit your TARGET name.) #
#--------------------------#
SRCS = $(wildcard protos/*.proto)
OBJS = $(SRCS:.proto=$@)

##############################
# you did not edit this
##############################
INC=$(PROTO_PATH)
OPTIONS=--proto_path=$(INC)
##################################################
# Linking Part                                   #
# (Select linking option on your TARGET purpose) #
#------------------------------------------------#
all: lint go java

##########################
# DON'T edit below lines #
#------------------------#
lint: $(SRCS)
	@echo "[lint protoc]"
	@protoc --lint_out=sort_imports:. $^
	@echo ""

# @protoc $(OPTIONS) --go-grpc_out=$(GEN_PATH)/go --go-grpc_opt paths=source_relative $^
go: $(SRCS)
	@echo "[make protoc go]"
	@mkdir -p $(GEN_PATH)/go
	@protoc -I=protos --go_out=plugins=grpc:$(GEN_PATH)/go --go_opt=paths=source_relative $^
	@echo "- $^"
	@echo ""

java: $(SRCS)
	@echo "[make protoc java]"
	@mkdir -p $(GEN_PATH)/java
	@protoc $(OPTIONS)
	@echo "- $^"
	@echo ""

python: $(SRCS)
	@echo "[make protoc python]"
	@mkdir -p $(GEN_PATH)/python
	@echo "- $^"
	@echo ""

# clean:
#     @$(RM) $(TARGET)