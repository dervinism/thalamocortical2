function iMax = ghk(Vm, celsius)
FARADAY = 96485.309;
R = 8.3144621;
cai = 50e-6;
cao = 1.5;
pcabar	= 8.8e-5;
z = (1e-3)*2*FARADAY*Vm./(R*(celsius+273.15));
eco = cao*z./(exp(z)-1);
eci = -cai*z./(exp(-z)-1);
iMax = pcabar*(.001)*2*FARADAY*(eci - eco);