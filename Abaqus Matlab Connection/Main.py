#Created by J.T.B. Overvelde
#2012/05/03
#http://www.overvelde.com

from part import *
from material import *
from section import *
from assembly import *
from step import *
from interaction import *
from load import *
from mesh import *
from job import *
from sketch import *
from visualization import *
from connectorBehavior import *
from Numeric import *
from abaqus import *
from abaqusConstants import *
import visualization
import os
import datetime
import shutil
from odbAccess import *

#Load variables
execfile('Var.py')

#Create rentangle with variable size
mdb.models['Model-1'].ConstrainedSketch(name='__profile__', sheetSize=10.0)
mdb.models['Model-1'].sketches['__profile__'].rectangle(point1=(0.0, 0.0), 
    point2=(GridSpaceX, GridSpaceY))
mdb.models['Model-1'].Part(dimensionality=TWO_D_PLANAR, name='Part-1', type=
    DEFORMABLE_BODY)
mdb.models['Model-1'].parts['Part-1'].BaseShell(sketch=
    mdb.models['Model-1'].sketches['__profile__'])
del mdb.models['Model-1'].sketches['__profile__']




 





