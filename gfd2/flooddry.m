function [ hulimited ] = flooddry ( hu, h, hmin ) 

%*****************************************************************************80
%
%% FLOODDRY deals with the outcropping condition.
%
%  Discussion:
%
%    This function is discussed in chapter 15 of the reference.
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
  Ms = size(h);
  M = Ms(2);
  myhmin = hmin;
  hulimited = hu;

  for i=2 : M
    if h(i-1) < hmin*3
      hulimited(i)=min(hu(i),0);
    end
    if h(i) < hmin*3
      hulimited(i)=max(hu(i),0);
    end
  end

  return
end
