function[avr,z]= avrprof(file,long1,long2,lat1,lat2) 

%*****************************************************************************80
%
%% AVRPROF averages a quantity over all depths.
%
%  Discussion:
%
%    A NETCDF file is read.
%
%    The file contains a table of some quantity A(B,C,D), where B
%    is longitude, C is latitude, and D is depth.
%
%    The program averages A over all the (legal) values of depth.
%
%    This function is discussed in chapter 11 of the reference.
%
%  Modified:
%
%    04 December 2009
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
  disp(['Computing average profile']);
%
%  Read A, B, C, and D, where A is a function of B (longitude), 
%  C (latitude) and D (depth).
%
  [ a, b, c, d ] = medarncread ( file );
 
  idim = size(a);

  i1=max(find(b<long1));
  i2=min(find(b>long2));

  j1=max(find(c<lat1));
  j2=min(find(c>lat2));

  for il=1:idim(3)
    mp(il)=0;
    ip(il)=0;
  end
%
%  Sum the A values over the third dimension.
%
  for il=i1:i2,
    for jl=j1:j2,
      for kl=1:idim(3),
        if ~isnan ( a(il,jl,kl) )
          mp(kl)=mp(kl)+a(il,jl,kl);
          ip(kl)=ip(kl)+1;
        end
      end
    end
  end
%
%  Divide by the number of items summed to get the average.
%
  for kl=1:idim(3),
    avr(kl) = mp(kl) / ip(kl);
    z(kl) = - d(kl);
  end

  return
end
