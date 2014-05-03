

import os
import sys

# directory location along with trailing backslash
DIRECTORY = './train_data/'  

classes = os.listdir(DIRECTORY)
count = 1
for _class in classes:
  print DIRECTORY+_class
  print DIRECTORY+str(count)
  os.rename(DIRECTORY+_class, DIRECTORY+str(count))
  count += 1

