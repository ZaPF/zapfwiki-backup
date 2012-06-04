all:
	./backup.sh > zapfwiki-$(shell date +%Y-%m-%d)_backup.log
