#!/usr/bin/env

import os
import datetime
import shutil

pwd = os.path.realpath(os.getcwd())

target_dir = os.environ['HOME']
timestamp  = datetime.datetime.today().strftime("%Y%m%d_%H%M%S")
backup_dir = os.path.join(pwd, 'backups', timestamp)

def backup(file):
   if not os.path.isdir(backup_dir):
      os.makedirs(backup_dir)
   print "Backing up %s ==> %s" % (file, backup_dir)
   shutil.move(file, os.path.join(backup_dir, os.path.basename(file)))

# get list of dotfiles to install
toIgnore  = ['README', 'install.py', '.git', 'backups']

toInstall = [file for file in os.listdir(pwd) if file not in toIgnore]

for file in toInstall:
   target = os.path.join(target_dir, file)
   print "Installing", target

   if os.path.islink(target):
      # only back up symlinks if they point somewhere else than pwd
      symLinkDest = os.path.dirname(os.path.realpath(target))
      if symLinkDest != pwd:
         backup(target)
      else:
         continue # already installed
   # check if it is a regular file we need to backup
   elif os.path.isfile(target) or os.path.isdir(target):
      # if regular file or directory, backup
      backup(target)

   # link file to dotfiles/file
   os.symlink(os.path.join(pwd, file), target)

