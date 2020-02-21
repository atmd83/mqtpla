PROJECT = mqtpla
PROJECT_DESCRIPTION = New project
PROJECT_VERSION = 0.1.0

DEPS = \
	mqtent

dep_mqtent = git git@gitlab.com:superbet/betler/mqtent.git

dep_mqtent_commit = 0.8.0

SHELL_DEPS = \
	sync

SHELL_OPTS = \
	-config dev.config \
	-s $(PROJECT) \
	-s sync

include erlang.mk
