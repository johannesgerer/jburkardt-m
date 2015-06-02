function c = differ_stencil ( x0, o, p, x )

%*****************************************************************************80
%
%% DIFFER_STENCIL computes finite difference coefficients.
%
%  Discussion:
%
%    We determine coefficients C to approximate the derivative at X0
%    of order O and precision P, using finite differences, so that 
%
%      d^o f(x)/dx^o (x0) = sum ( 0 <= i <= o+p-1 ) c(i) f(x(i)) 
%        + O(h^(p))
%
%    where H is the maximum spacing between X0 and any X(I).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 November 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X0, the point where the derivative is to be approximated.
%
%    Input, integer O, the order of the derivative to be approximated.
%    1 <= O.
%
%    Input, integer P, the order of the error.
%
%    Input, real X(O+P), the evaluation points.
%
%    Output, real C(O+P), the coefficients.
%
  n = o + p;
  dx = x - x0;
  a = vand1 ( n, dx );

  b = zeros ( n, 1 );
  b(o+1) = 1.0;

  c = a \ b;

  c = c * r8_factorial ( o );

  return
end
