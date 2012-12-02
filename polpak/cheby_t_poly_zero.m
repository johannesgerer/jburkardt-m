function z = cheby_t_poly_zero ( n )

%*****************************************************************************80
%
%% CHEBY_T_POLY_ZERO returns zeroes of Chebyshev polynomials T(n,x).
%
%  Discussion:
%
%    The I-th zero of T(n,x) is cos((2*I-1)*PI/(2*N)), I = 1 to N
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
%    Output, real Z(N), the zeroes of T(N)(X).
%
  for i = 1 : n
    angle = ( 2 * i - 1 ) * pi / real ( 2 * n );
    z(i) = cos ( angle );
  end

  return
end
