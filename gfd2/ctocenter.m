function [ uc, vc ] = ctocenter ( u, v )

%*****************************************************************************80
%
%% CTOCENTER averages U and V to the midpoints between nodes.
%
%  Discussion:
%
%    This function is discussed in chapter 20 of the reference.
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
%    Input, real U(M,N), V(M,N), the values of U and V at the nodes.
%
%    Output, real UC(M-1,N), V(M,N-1), the values of U and V, averaged
%    at the midpoints between horizontal and vertical nodes respectively.
%
  val=size(u);

  uc=u;
  vc=v;

  for i=1:val(1)-1
    for j=1:val(2)
      uc(i,j) = ( u(i,j) + u(i+1,j) ) / 2;
    end
  end

  for i=1:val(1)
    for j=1:val(2)-1
      vc(i,j)=( v(i,j) + v(i,j+1) ) / 2;
    end
  end

  return
end
