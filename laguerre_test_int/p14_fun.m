function fx = p14_fun ( n, x )

%*****************************************************************************80
%
%% P14_FUN evaluates the integrand for problem 14.
%
%  Discussion:
%
%    S&S gives "exact" value as     1.0634618101...
%    Mathematica returns            1.0634618101722400407...
%    S&S gives Laguerre(16) as      1.0634713425...
%    S&S gives EXP_TRANSFORM(16) as 1.0634618101...
%
%    The FORTRAN version of this routine, compiled with G95, was getting 
%    a floating point exception when evaluating the integrand
%    and using a Laguerre rule of order 64.  So I have had to truncate
%    the evaluation of the exponential.
%
%  Integral:
%
%    Integral ( 0 <= x < +oo ) sin ( exp ( - x ) + exp ( - 4 x ) ) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 July 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud, Don Secrest,
%    Gaussian Quadrature Formulas,
%    Prentice Hall, 1966,
%    LC: QA299.4G3S7.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the function values.
%
  fx(1:n) = sin ( exp ( -x(1:n) ) + exp ( -4.0 * x(1:n) ) );

  return
end
