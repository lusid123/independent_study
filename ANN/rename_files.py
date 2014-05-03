

import os
import sys

DIRECTORY = './train_data/'

classes = os.listdir(DIRECTORY)
for _class in classes:
  _files = os.listdir(DIRECTORY + _class)
  for _file in _files:
    new_name = _file.split('.wav')[0][:-13] + '.wav'
    os.rename(DIRECTORY+_class+'/'+_file, DIRECTORY+_class+'/'+new_name)


