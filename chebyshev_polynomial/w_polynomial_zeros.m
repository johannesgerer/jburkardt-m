function z = w_polynomial_zeros ( n )

%*****************************************************************************80
%
%% W_POLYNOMIAL_ZEROS returns zeroes of the Chebyshev polynomial W(n,x).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 April 2012
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
    angle = ( 2 * ( n - i + 1 ) * pi / ( 2 * n + 1 );
    z(i) = cos ( angle );
  end

  return
end
