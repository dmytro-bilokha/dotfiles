# $FreeBSD: src/share/skel/dot.cshrc,v 1.13 2001/01/10 17:35:28 archie Exp $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

alias h		history 25
alias j		jobs -l
alias la	ls -a
alias lf	ls -FA
alias ll	ls -lA

# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin /usr/X11R6/bin $HOME/bin)

setenv	EDITOR	vim
setenv	WINEDITOR gvim
setenv	PAGER	less
setenv	BLOCKSIZE	K
setenv	CLICOLOR
setenv	LANG	uk_UA.UTF-8

if ($?prompt) then
	# An interactive shell -- set some stuff up
	#set prompt = "[%.3]%"
	set prompt = "%N@%m:%~ %# "
	set filec
	set autolist
	set history = 100
	set savehist = 100
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey "^?" delete-char
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
		# INSERT : toggles overwrite or insert mode.
		bindkey ^[[L overwrite-mode 
		bindkey    ^[[2~  overwrite-mode	# for x

		# DELETE : delete char at cursor position.
		#bindkey ^? delete-char
		#bindkey    ^[[3~  delete-char		# for x

		# HOME : go to the beginning of the line.
		# already bound to beginnning-of-line, but the keycode thing was different.
		bindkey ^[[H beginning-of-line

		# END : go to the end of the line.
		# same as above.
		bindkey ^[[F end-of-line

		# PAGE UP : search in history backwards for line beginning as current.
		bindkey ^[[I history-search-backward
		bindkey ^[[5~ history-search-backward	# for x

		# PAGE DOWN : search in history forwards for line beginning as current.
		bindkey ^[[G history-search-forward 
		bindkey ^[[6~ history-search-forward 	# for x

		# ESC-left-arrow : go to beginning of left word.        
		# The second version is used to fix a strange bug where the binding
		# stops working after some usage. Did not manage to recreate.
		bindkey ^[^[[D vi-word-back          # not freebsd specific

		# ESC-right-arrow : go to beginning of right word.
		# The second version is used to fix a strange bug where the binding
		# stops working after some usage. Did not manage to recreate.
		bindkey ^[^[[C vi-word-fwd		# also not freebsd specific
		#bindkey	   OC vi-word-fwd

		# F1 : help on command currently typed(if 'ls passwd', help on 'ls').
		# first: while in console mode, second: while in X
		bindkey ^[[M run-help
		#bindkey    OP    run-help

		# F2 : set the mark command to cursor position.
		# first: while in console mode, second: while in X
		bindkey ^[[N set-mark-command
		#bindkey  OQ     set-mark-command 

		# F3 : move cursor to the marked position.
		# first: while in console mode, second: while in X
		bindkey ^[[O exchange-point-and-mark
		#bindkey   OR    exchange-point-and-mark 

		# F4 : --empty--
		# first: while in console mode, second: while in X
		bindkey ^[[P undefined-key
		#bindkey   OS   undefined-key

		# F5 : check line for spelling and make changes.
		# first: while in console mode, second: while in X
		#bindkey ^[[Q spell-line
		#bindkey    [15~   spell-line

		# F6 : check current word for spelling and make changes.
		bindkey ^[[R spell-word
		bindkey ^[[17~ spell-word		# for x

		# F7 : insert last item of previous command.
		bindkey ^[[S insert-last-word
		bindkey ^[[18~ insert-last-word		# for x

		# F8 : search in history backwards for line beginning as current.
		bindkey ^[[T history-search-backward
		bindkey ^[[19~ history-search-backward	# for x

		# F9 : clear screen.
		# You may be in the middle of a command when you use this.
		# Does not affect what you are writing at the moment.
		bindkey ^[[U clear-screen
		bindkey ^[[20~ clear-screen		# for x

		# F10 : do an 'ls -l'.    (\16 is Ctrl-U on Linux(and Sun?))
		bindkey -s ^[[V "^Uls -l\n"
		bindkey -s ^[[21~  "^Uls -l\n"		# for x

		# F11 : display load average and current process status.
		bindkey ^[[W load-average
		bindkey ^[[23~ load-average		# for x
	#### Disabled! According to users, it is close to F12, which is used for unconditional
	#### completion. In several cases (laptop keyboard) it is common to make a mistake
	#### and press F11 instead of F12, such as in the case
	####        root# cp /etc/passwd /etc/pas<F11>
	#### In this case, the commande changes to
	####        root# cp /etc/passwd /etc/pasuptime<ENTER>
	#### and you get a rubbish file /etc/pasuptime. Annoying!

		# F12 : do a ala-csh completion.
		bindkey ^[[X complete-word-raw
		bindkey ^[[24~ complete-word-raw	# for x

	endif
	if ( $?TERM ) then
		if ( $TERM == "xterm" && ! $?MLTERM ) then
			bindkey "^[[3~" delete-char
			bindkey "^?" backward-delete-char
		endif
		if ( $TERM == "rxvt" && ! $?MLTERM ) then
			bindkey "^[[3~" delete-char
			bindkey "^?" backward-delete-char
		endif
	endif
endif

setenv JAVA_HOME /usr/local/openjdk8/jre
setenv JAVA_VERSION 1.8
setenv NCURSES_NO_UTF8_ACS 1
#Set Nvidia OpenGL options
setenv _GL_FSAA_MODE 13
setenv _GL_LOG_MAX_ANISO 4
#For Gqview to use koi8-u
setenv G_BROKEN_FILENAMES 1
# Correct OpenOffice for ingoring dark theme
setenv SAL_USE_VCLPLUGIN gen
#turn on messages
mesg y
# Ask for confirmation when 'rm *'
set rmstar
# Show statistics with time
set time=(8 "Time spent in user mode (CPU seconds) : %Us\
Time spent in kernel mode (CPU seconds) : %Ss\
Total time				: %Es\
CPU utilisation (percentage)		: %P")


