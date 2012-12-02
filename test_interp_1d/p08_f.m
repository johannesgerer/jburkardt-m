function value = p08_f ( n, x )

%*****************************************************************************80
%
%% P08_F evaluates the function for problem p08.
%
%  Discussion:
%
%    This is a famous example, due to Runge.  If equally spaced
%    abscissas are used, the sequence of interpolating polynomials Pn(X)
%    diverges, in the sense that the max norm of the difference
%    between Pn(X) and F(X) becomes arbitrarily large as N increases.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N,1), the evaluation points.
%
%    Output, real VALUE(N,1), the function values.
%
  value = 1.0 ./ ( ( 10.0 * ( x - 0.5 ) ) .^ 2 + 1.0 );

  return
end
