function [ c, x ] = differ_backward ( h, o, p )

%*****************************************************************************80
%
%% DIFFER_BACKWARD computes backward difference coefficients.
%
%  Discussion:
%
%    We determine coefficients C to approximate the derivative at X0
%    of order O and precision P, using equally spaced backward
%    differences, so that 
%
%      d^o f(x)/dx^o = sum ( 0 <= i <= o+p-1 ) c(i) f(x-ih) + O(h^(p))
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
%    Input, real H, the spacing.  0 < H.
%
%    Input, integer O, the order of the derivative to be approximated.
%    1 <= O.
%
%    Input, integer P, the order of the error, as a power of H.
%
%    Output, real C(O+P), the coefficients.
%
%    Output, real X(O+P), the evaluation points.
%
  n = o + p;
  x = ( - n + 1 : 0 )' * h;
  a = vand1 ( n, x );

  b = zeros ( n, 1 );
  b(o+1) = 1.0;

  c = a \ b;

  c = c * r8_factorial ( o );

  return
end
