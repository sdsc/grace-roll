SRCDIRS = `find * -prune\
	  -type d 	\
          ! -name grace-modules \
          ! -name build-\* \
	  ! -name CVS	\
	  ! -name .` grace-modules
