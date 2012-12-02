function z = t_polynomial_zeros ( n )

%*****************************************************************************80
%
%% T_POLYNOMIAL_ZEROS returns zeroes of the Chebyshev polynomial T(n,x).
%
%  Discussion:
%
%    The I-th zero is cos((2*I-1)*PI/(2*N)), I = 1 to N
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
%    Output, real Z(N), the zeroes.
%
  for i = 1 : n
    angle = ( 2 * i - 1 ) * pi / ( 2 * n );
    z(i) = cos ( angle );
  end

  return
end
