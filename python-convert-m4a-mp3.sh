#/bin/sh

import os
import glob
import sys
this_dir = os.path.dirname(os.path.realpath(__file__))

# files_path = [os.path.abspath(x) for x in os.listdir()]
# print(files_path)
m4as = [x for x in os.listdir() if x.endswith('.m4a')]

# fix the names if they have apostrophes around them
for item in m4as:
    old_path = this_dir + '/' + item.replace(' ', '\ ')
    new_path = this_dir + '/' + item.replace(' ', '-')
    comm = 'mv ' + old_path + ' ' + new_path
    os.system(comm)
    print(comm)

m4as = [x for x in os.listdir() if x.endswith('.m4a')]

for item in m4as:
    new_path = this_dir + '/' + item[0:-4] + '.mp3'
    old_path = this_dir + '/' + item
    comm = 'ffmpeg -v 5 -y -i ' + old_path + ' -acodec libmp3lame -ac 2 -ab 192k ' + new_path
    os.system(comm)
    print('saved: ' + comm)
