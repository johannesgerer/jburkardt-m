function h = p37_h ( n, x )

%*****************************************************************************80
%
%% P37_H evaluates the Hessian for problem 37.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2001
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the values of the variables.
%
%    Output, real H(N,N), the N by N Hessian matrix.
%
  h = zeros ( n, n );

  arg = - ( x(1) - pi )^2 - ( x(2) - pi )^2;
  dargdx1 = - 2.0 * ( x(1) - pi );
  dargdx2 = - 2.0 * ( x(2) - pi );

  factor = cos ( x(2) ) * ( sin ( x(1) ) - cos ( x(1) ) * dargdx1 );
  dfdx1 = cos ( x(2) ) * ( cos ( x(1) ) + sin ( x(1) ) * dargdx1 + 2.0 * cos ( x(1) ) );
  dfdx2 = - sin ( x(2) ) * ( sin ( x(1) ) - cos ( x(1) ) * dargdx1 );

  h(1,1) = ( dfdx1 + factor * dargdx1 ) * exp ( arg );
  h(1,2) = ( dfdx2 + factor * dargdx2 ) * exp ( arg );

  factor = cos ( x(1) ) * ( sin ( x(2) ) - cos ( x(2) ) * dargdx2 );
  dfdx1 = - sin ( x(1) ) * ( sin ( x(2) ) - cos ( x(2) ) * dargdx2 );
  dfdx2 = cos ( x(1) ) * ( cos ( x(2) ) + sin ( x(2) ) * dargdx2 ...
    + 2.0 * cos ( x(2) ) );

  h(2,1) = ( dfdx1 + factor * dargdx1 ) * exp ( arg );
  h(2,2) = ( dfdx2 + factor * dargdx2 ) * exp ( arg );

  return
end
