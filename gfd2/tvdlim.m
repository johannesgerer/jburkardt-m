function [ phi ] = tvdlim ( r ) 

%*****************************************************************************80
%
%% TVDLIM is a function which evaluates limiters for TVD schemes.
%
%  Discussion:
%
%    This function is discussed in chapter 6 and 15 and 20 of the reference.
%
%  Modified:
%
%    02 December 2009
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
%    Input, integer R, chooses the scheme.
%    1 : Superbee
%    2 : Van Leer
%    3 : MC
%    4 : Lax-Wendroff
%    5 : Upwind
%    6 : Beam warning
%
%    Output, real PHI, the limiter.
%
  tvd = 1;

  if tvd == 1
    phi = max(0,max(min(1,2*r),min(2,r)));
  elseif tvd == 2
    phi = (r+abs(r))/(1+abs(r));
  elseif tvd == 3
    phi = max(0,min(2*r,min((1+r)/2,2)));
  elseif tvd == 4
    phi = 1;
  elseif tvd == 5
    phi = 0;
  elseif tvd == 6
    phi = r;
  end

  return
end
