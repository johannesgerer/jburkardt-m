%% MEDPROF produces average profiles of temperature and salinity in the Mediterranean.
%
%  Discussion:
%
%    This script is discussed in chapter 11 of the reference.
%
%  Modified:
%
%    03 December 2009
%
%  Author:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers.
%
%  Reference:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers,
%    Introduction to Geophysical Fluid Dynamics,
%    Academic Press, 2010.
%
%  Parameters:
%
clear;

long1=0;
long2=12;
lat1=33;
lat2=42;

[sp,z]=avrprof('../nc/clim.med.psal.nc',long1,long2,lat1,lat2);

[tp,z]=avrprof('../nc/clim.med.temp.nc',long1,long2,lat1,lat2);

plot(sp,z);
pause;
plot(tp,z);
