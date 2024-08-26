#!/bin/sh

SAMBA_USER=root
SAMBA_PASS=1

#==================================================================
(echo $SAMBA_PASS; echo $SAMBA_PASS;) | smbpasswd -a -s $SAMBA_USER
