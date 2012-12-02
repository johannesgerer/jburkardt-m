function [ lambda, mu ] = p20_setup ( l, theta )

%*****************************************************************************80
%
%% P20_SETUP finds a solution (L,THETA,LAMBDA,MU) given L and THETA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real L, THETA, the values of L and THETA.
%
%    Output, real LAMBDA, MU, values for LAMBDA and MU.
%

  mu = 2 * ( 1.0 - l ) * sin ( theta ) - 0.5 * cos ( theta ) * theta / l;

  lambda = ( ( 1.0 - l ) - 0.5 * mu * sin ( theta ) ) / cos ( theta );
  
  return
end
