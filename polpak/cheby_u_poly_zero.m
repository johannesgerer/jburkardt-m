function z = cheby_u_poly_zero ( n )

%*****************************************************************************80
%
%% CHEBY_U_POLY_ZERO returns zeroes of Chebyshev polynomials U(n,x).
%
%  Discussion:
%
%    The I-th zero of U(n,x) is cos(I*PI/(N+1)), I = 1 to N
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the polynomial.
%
%    Output, real Z(N), the zeroes of U(n,x).
%
  for i = 1 : n
    angle = i * pi / ( n + 1 );
    z(i) = cos ( angle );
  end

  return
end
