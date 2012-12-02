function fx = p04_f ( n, x )

%*****************************************************************************80
%
%% P04_F evaluates the integrand for problem 04.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989,
%    ISBN: 0-13-627258-4,
%    LC: TA345.K34.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx(1:n) = exp ( - x(1:n).^2 ) .* log ( 1.0 - x(1:n) );

  return
end
