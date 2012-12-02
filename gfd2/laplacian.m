function [lap] = laplacian(p,dx,dy)

%*****************************************************************************80
%
%% LAPLACIAN estimates the Laplacian of a function.
%
%  Discussion:
%
%    This function is discussed in chapter 16 and 17 of the reference.
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
  val=size(p);
  M=val(1);
  N=val(2);
  lap=zeros(M,N);

  for i=2:M-1
    for j=2:N-1
      lap(i,j) = ( p(i+1,j) + p(i-1,j) - 2 * p(i,j) ) / ( dx * dx ) ...
               + ( p(i,j+1) + p(i,j-1) - 2 * p(i,j) ) / ( dy * dy );
    end
  end

  return
end
