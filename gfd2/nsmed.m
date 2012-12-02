function[f,NS,zz]= nsmed(long1,long2,lat1,lat2) 

%*****************************************************************************80
%
%% NSMED ?
%
%  Discussion:
%
%    This function is discussed in chapter 13 of the reference.
%
%  Modified:
%
%    30 November 2009
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

% long1=0
% long2=12
% lat1=33
% lat2=42

  f=2*2*pi/(24*3600)*cos(pi/180*(lat2+lat1)/2);
  [sp,z]=avrprof('../nc/clim.med.psal.nc',long1,long2,lat1,lat2);
  [tp,z]=avrprof('../nc/clim.med.temp.nc',long1,long2,lat1,lat2);
  dens=ies80(sp,tp,0);

  for k=1:101,
    zz(k)=-500+(k-1)*5;
  end

  i=min(find(dens>10));
  ddim=size(dens);

  for k=i:ddim(2),
    densok(k-i+1)=dens(k);
    zok(k-i+1)=z(k);
  end

  denszz=spline(zok,densok,zz);
  ddim=size(denszz);

  for k=2:ddim(2)
    NS(k)=-9.81/1024 *(denszz(k)-denszz(k-1))/(zz(k)-zz(k-1));
    if NS(k) < f^2
        % dirty 
        NS(k)=1.2*f^2;
    end
  end

  NS(1)=NS(2);

  return
end
