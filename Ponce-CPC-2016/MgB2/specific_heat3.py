# S. Ponce: Specific heat of MgB2
# Script to compute through finite difference.

import numpy as np
import matplotlib.pyplot as P
from numpy.linalg import inv
from scipy.interpolate import spline
from pylab import *
import matplotlib.ticker as ticker
from scipy.optimize import curve_fit

size=16
rc('axes', linewidth=2)

Exp1 = np.loadtxt('wang2001_specific_heat.txt',dtype='float',comments='#')
Exp2 = np.loadtxt('Bouquets2001_specific_heat.txt',dtype='float',comments='#')

# The Wang data are expressed in gram-atom (gat). 1 cole of MgB2 is 1 gram-molecule of MgB2 but
# 3 gram-atoms of MgB2

P.plot(Exp1[:,0]/36.7,Exp1[:,1]*3,'.', markersize=12, color='black',label=r'Wang et al. T$_c$ = 36.7K')
P.plot(Exp2[:,0]/38.7,Exp2[:,1]-2.6,'s', markersize=4, color='red', markerfacecolor='red', label=r'Bouqet et al. T$_c$ = 38.7K')

####################

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
50.2777777,\
51.6666666,\
])
# Last one is fake 0


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
-1.7743237583E-10,\
0.000000000000000,\
])

ev2mJmol = 96486900;
fe = fe*ev2mJmol

# Centred second-order finite-difference of order 2 
jj = 0
fe2 = np.zeros(len(fe)-2)

for ii in fe:
    if jj > 0 and jj < len(fe)-1:
      fe2[jj-1] = -(fe[jj-1]-2*fe[jj]+fe[jj+1])/h**2
    jj += 1    

 
# Centred second-order finite-difference of order 4
jj = 0
fe4 = np.zeros(len(fe)-4)

for ii in fe:
    if jj > 1 and jj < len(fe)-2:
        fe4[jj-2] = -(-fe[jj-2]+16*fe[jj-1]-30*fe[jj]+16*fe[jj+1]-fe[jj+2])/(12*(h**2))
    jj += 1

# Centred second-order finite-difference of order 2 (larger h)
h = 2*h

jj = 0
fe22 = np.zeros((len(fe))/2-2)
temp2 = np.zeros((len(fe))/2-2)
for ii in fe:
    print jj
    if jj > 0 and jj < len(fe)-3:
      fe22[jj/2-1] = -(fe[jj-2]-2*fe[jj]+fe[jj+2])/h**2
      temp2[jj/2-1] = temp[jj]
    jj += 2

h = h/2


# Now try with fitting the free energy
fit = np.polyfit(temp,fe,10)
temp_fine = np.linspace(5.8333,50.6,200)
fe_fitted = np.polyval(fit,temp_fine)

fe_deriv2 = np.polyder(fit,2)
fe_deriv2_fitted = -np.polyval(fe_deriv2,temp_fine)


P.plot(temp_fine/50.6,fe_deriv2_fitted,'-', color='blue',linewidth=3,label=r'Present work T$_c$ = 50.6 K')

# Analytical based on the double gap BCS model
# eV
#delta1 = 0.0017
#delta2 = 0.0088
#Choi
#delta1 = 0.0018
#delta2 = 0.0068
#lambda1 = 0.7474
#
#temp = np.linspace(1,39,200)
#Kelvin2eV = 8.621738E-5
#tc = 39.0*Kelvin2eV
#fe = np.zeros(200)
#
#jj=0
#for tt in temp:
#    omega = np.pi*tt*Kelvin2eV
#    # First gap
#    #p = 1.5
#    #Choi
#    p = 1.8
#    delta = delta1*np.sqrt(1-(tt*Kelvin2eV/tc)**p)
#    Z = 1+omega*lambda1/(np.sqrt(omega**2+delta**2))
#    ZN = 1+lambda1
#
#    fe[jj] = -omega*(np.sqrt(omega**2+delta**2)-omega)*\
#            (Z-(ZN*omega)/(np.sqrt(omega**2+delta**2)))
#    # Second gap
#    #p = 2.3
#    #Choi
#    p = 2.9
#    delta = delta2*np.sqrt(1-(tt*Kelvin2eV/tc)**p)
#    Z = 1+omega*lambda1/(np.sqrt(omega**2+delta**2))
#    ZN = 1+lambda1
#
#    fe[jj] = fe[jj]- omega*(np.sqrt(omega**2+delta**2)-omega)*\
#            (Z-(ZN*omega)/(np.sqrt(omega**2+delta**2)))
#
#    jj += 1
#
#fe = fe*ev2mJmol
## Divide by 2 to get average
#fe = fe/2
#
#
## Now fit
#fit = np.polyfit(temp,fe,10)
#temp_fine = np.linspace(1,39,1000)
#fe_fitted = np.polyval(fit,temp_fine)
#
#fe_deriv2 = np.polyder(fit,2)
#fe_deriv2_fitted = -np.polyval(fe_deriv2,temp_fine)
#
#P.plot(temp_fine/39,fe_deriv2_fitted,'-', color='red',linewidth=3,label=r'2-gap BCS T$_c$ = 39 K')

############################################################################
# Two gap model
delta1 = 0.0019
delta2 = 0.006

lambda1 = 0.7474
cut_freq = 300
cut_energy = 0.12 # eV

temp = np.linspace(0.8,39,100)
fe = np.zeros(100)
Kelvin2eV = 8.621738E-5
tc = 39*Kelvin2eV

jj=0
for tt in temp:
    T = tt*Kelvin2eV
    # First gap
    p = 1.8
    delta = delta1*np.sqrt(1-(T/tc)**p)
    # Compute Z
    Z = np.zeros(cut_freq)
    ZN = np.zeros(cut_freq)
    kk = 0
    for freq in np.arange(0,cut_freq):
        kernel = 0
        kernelN = 0
        for freq2 in np.arange(0,cut_freq):
            omega = (2*freq2+1)*np.pi*T
            if omega < cut_energy:
                kernel += omega*lambda1/(np.sqrt(omega**2+delta**2))
                kernelN += lambda1
            else:
                kernel += lambda1
                kernelN += lambda1

        omega = (2*freq+1)*np.pi
        Z[kk] = 1 + (np.pi*T*kernel)/omega
        ZN[kk] = 1 + (np.pi*T*kernelN)/omega
        kk += 1
    kk = 0
    kernel = 0
    for freq in np.arange(0,cut_freq):
        omega = (2*freq+1)*np.pi*T
        if omega < cut_energy:
            kernel += (np.sqrt(omega**2+delta**2)-omega)*\
                    (Z[kk]-ZN[kk]*omega/(np.sqrt(omega**2+delta**2)))
        else:
          print 'Temperature ',tt
          print 'Nb of freq for cut_energy=',cut_energy,' is ',freq
          break

    fe[jj] = -np.pi*T*kernel

    # Second gap
    p = 2.9
    delta = delta2*np.sqrt(1-(T/tc)**p)
    # Compute Z
    Z = np.zeros(cut_freq)
    ZN = np.zeros(cut_freq)
    kk = 0
    for freq in np.arange(0,cut_freq):
        kernel = 0
        kernelN = 0
        for freq2 in np.arange(0,cut_freq):
            omega = (2*freq2+1)*np.pi*T
            if omega < cut_energy:
                kernel += omega*lambda1/(np.sqrt(omega**2+delta**2))
                kernelN += lambda1
            else:
                kernel += lambda1
                kernelN += lambda1

        omega = (2*freq+1)*np.pi
        Z[kk] = 1 + (np.pi*T*kernel)/omega
        ZN[kk] = 1 + (np.pi*T*kernelN)/omega
        kk += 1
    kk = 0
    kernel = 0
    for freq in np.arange(0,cut_freq):
        omega = (2*freq+1)*np.pi*T
        if omega < cut_energy:
            kernel += (np.sqrt(omega**2+delta**2)-omega)*\
                    (Z[kk]-ZN[kk]*omega/(np.sqrt(omega**2+delta**2)))
        else:
          print 'Temperature ',tt
          print 'Nb of freq for cut_energy=',cut_energy,' is ',freq
          break

    fe[jj] = fe[jj] - np.pi*T*kernel

    jj += 1

fe = fe*ev2mJmol
# Divide by 2 because 2gap
fe = fe/2

# Now fit
fit = np.polyfit(temp,fe,10)
temp_fine = np.linspace(0.8,39,1000)
fe_fitted = np.polyval(fit,temp_fine)

fe_deriv2 = np.polyder(fit,2)
fe_deriv2_fitted = -np.polyval(fe_deriv2,temp_fine)

P.plot(temp_fine/39,fe_deriv2_fitted,'-', color='green',linewidth=3,label=r'2-gap BCS T$_c$ = 39 K')

#################### OTHER

delta1 = 0.005
jj=0
for tt in temp:
    T = tt*Kelvin2eV
    # First gap
    p = 3.3
    delta = delta1*np.sqrt(1-(T/tc)**p)

    # Compute Z
    Z = np.zeros(cut_freq)
    ZN = np.zeros(cut_freq)

    kk = 0
    for freq in np.arange(0,cut_freq):
        kernel = 0
        kernelN = 0
        for freq2 in np.arange(0,cut_freq):
            omega = (2*freq2+1)*np.pi*T
            if omega < cut_energy:
                kernel += omega*lambda1/(np.sqrt(omega**2+delta**2))
                kernelN += lambda1
            else:
                kernel += lambda1
                kernelN += lambda1

        omega = (2*freq+1)*np.pi
        Z[kk] = 1 + (np.pi*T*kernel)/omega
        ZN[kk] = 1 + (np.pi*T*kernelN)/omega
        kk += 1

    kk = 0
    kernel = 0
    for freq in np.arange(0,cut_freq):
        omega = (2*freq+1)*np.pi*T
        if omega < cut_energy:
            kernel += (np.sqrt(omega**2+delta**2)-omega)*\
                    (Z[kk]-ZN[kk]*omega/(np.sqrt(omega**2+delta**2)))
        else:
          print 'Temperature ',tt
          print 'Nb of freq for cut_energy=',cut_energy,' is ',freq
          break

    fe[jj] = -np.pi*T*kernel
    jj += 1

fe = fe*ev2mJmol

# Now fit
fit = np.polyfit(temp,fe,10)
temp_fine = np.linspace(0.8,39,1000)
fe_fitted = np.polyval(fit,temp_fine)

fe_deriv2 = np.polyder(fit,2)
fe_deriv2_fitted = -np.polyval(fe_deriv2,temp_fine)

P.plot(temp_fine/39,fe_deriv2_fitted,'-', color='black',linewidth=3,label=r'1-gap 5 meV+p=3.3 BCS T$_c$ = 39 K')




#####################

P.xlim([0,1.1])
P.ylim([-4.5,4.5])

P.xticks(fontsize=size)
P.yticks(fontsize=size)

P.xlabel('T/T$_c$ (K)',fontsize=size)
P.ylabel(r'$\Delta$ C / T  (mJ/mol K$^2$)',fontsize=size)

#P.legend('Present work','Wang et al.','Bouqet et al.','Location','northwest')
P.legend(loc=2)

P.rc('text',usetex = True)

P.grid('on')
P.show()




#print "Extrapolated value in infinity ", popt[0]+popt[1]/popt[2]
#
