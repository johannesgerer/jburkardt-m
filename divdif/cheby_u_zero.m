function z = cheby_u_zero ( n )

%*****************************************************************************80
%
%% CHEBY_U_ZERO returns zeroes of the Chebyshev polynomial U(N)(X).
%
%  Discussion:
%
%    The I-th zero of U(N)(X) is cos((I-1)*PI/(N-1)), I = 1 to N
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 May 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the polynomial.
%
%    Output, real Z(N), the zeroes of U(N)(X).
%
  angle = ( 1 : n ) * pi / ( n + 1 );
  z = cos ( angle );

  return
end
