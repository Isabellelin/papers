import numpy as np
import matplotlib.pyplot as P
from numpy.linalg import inv
from scipy.interpolate import spline
from pylab import *
import matplotlib.ticker as ticker
from scipy.optimize import curve_fit

# Temperature [K]
h = 1.3888888888

temp = np.array([\
5.83333333,\
7.22222222,\
8.61111111,\
10.0000000,\
11.3888888,\
12.7777777,\
14.1666666,\
15.5555555,\
16.9444444,\
18.3333333,\
19.7222222,\
21.1111111,\
22.5000000,\
23.8888888,\
25.2777777,\
26.6666666,\
28.0555555,\
29.4444444,\
30.8333333,\
32.2222222,\
33.6111111,\
35.0000000,\
36.3888888,\
37.7777777,\
39.1666666,\
40.5555555,\
41.9444444,\
43.3333333,\
44.7222222,\
46.1111111,\
47.5000000,\
48.8888888,\
50.2777777])

# Free-energy in eV
fe = np.array([\
-5.5433902495E-06,\
-5.4371083204E-06,\
-5.3072518808E-06,\
-5.1658021499E-06,\
-5.0092490742E-06,\
-4.8391085540E-06,\
-4.6630258502E-06,\
-4.4758398422E-06,\
-4.2642769199E-06,\
-4.0535788791E-06,\
-3.8451705417E-06,\
-3.6206180244E-06,\
-3.3866047010E-06,\
-3.1562530451E-06,\
-2.9187327487E-06,\
-2.6676367822E-06,\
-2.4311628246E-06,\
-2.1947176937E-06,\
-1.9611147286E-06,\
-1.7160026438E-06,\
-1.5022787796E-06,\
-1.2890604218E-06,\
-1.0784534600E-06,\
-8.8754294660E-07,\
-6.9346450948E-07,\
-5.3305225864E-07,\
-3.8193223030E-07,\
-2.6513725784E-07,\
-1.6092402213E-07,\
-7.2556149741E-08,\
-1.9864096726E-08,\
-4.0912031902E-09,\
-1.7743237583E-10 ])

ev2mJmol = 96486900;
fe = fe*ev2mJmol


# Now try with fitting the free energy
P.plot(temp,fe,'-o', color='red',linewidth=2,label='DATA')


fit = np.polyfit(temp,fe,6)
temp_fine = np.linspace(5.8333,50.2777,200)
fe_fitted = np.polyval(fit,temp_fine)
P.plot(temp_fine,fe_fitted,'-', color='blue',linewidth=2,label='Curve fitting order 6')

fit = np.polyfit(temp,fe,20)
temp_fine = np.linspace(5.8333,50.2777,200)
fe_fitted = np.polyval(fit,temp_fine)
P.plot(temp_fine,fe_fitted,'-', color='green',linewidth=2,label='Curve fitting order 12')

P.grid('on')
P.show()



