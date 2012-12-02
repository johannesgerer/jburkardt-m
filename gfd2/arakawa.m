function [ jac ] = arakawa ( p, o, dx, dy )

%*****************************************************************************80
%
%% ARAKAWA evaluates the Arakawa jacobian.
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
%    Input, real P(M,N), ?
%
%    Input, real O(?,?), ?
%
%    Input, real DX, DY, the spacing in the X and Y directions.
%
%    Output, real JAC(M,N), the Arakawa jacobian.
%
  val=size(p);
  M=val(1);
  N=val(2);
  jac=zeros(M,N);
  vall=size(o);

  for i=2:M-1
    for j=2:N-1

      jpp =   ( p(i+1,j) - p(i-1,j) ) * ( o(i,j+1) - o(i,j-1) ) ...
            - ( o(i+1,j) - o(i-1,j) ) * ( p(i,j+1) - p(i,j-1) );

      jpx = (p(i+1,j)*(o(i+1,j+1)-o(i+1,j-1))- p(i-1,j)*(o(i-1,j+1)-o(i-1,j-1))-p(i,j+1)*(o(i+1,j+1)-o(i-1,j+1))+p(i,j-1)*(o(i+1,j-1)-o(i-1,j-1)));

      jxp = - (   o(i+1,j) * ( p(i+1,j+1) - p(i+1,j-1) ) ...
                - o(i-1,j) * ( p(i-1,j+1) - p(i-1,j-1) ) ...
                - o(i,j+1) * ( p(i+1,j+1) - p(i-1,j+1) ) ...
                + o(i,j-1) * ( p(i+1,j-1) - p(i-1,j-1) ) );

      jac(i,j) = jpp + jxp + jpx;

    end
  end

  jac = jac / ( 12 * dx * dy );

  return
end
