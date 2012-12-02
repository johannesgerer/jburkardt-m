%% TOPEXCIRCULATION reads a NETCDF file and makes a contour plot.
%
%  Discussion:
%
%    This script is discussed in chapter 7 of the reference.
%
%  Modified:
%
%    01 December 2009
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
  clear all;

  nc = netcdf ( 'madt_oer_merged_h_18861.nc', 'nowrite' );

  disp(nc.discription(:))
  disp(nc.author(:))
  disp(nc.date(:))

  myvar=var(nc);
  lat=myvar{2}(:);
  long=myvar{3}(:);
  time=myvar{4}(:);
  ssh=myvar{6}(:);

  ssh(ssh>100000)=NaN;

  atlssh = ssh(800:1080,500:800);
  
  contourf ( atlssh' );
