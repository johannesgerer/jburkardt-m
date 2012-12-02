function z = cheby_t_zero ( n )

%*****************************************************************************80
%
%% CHEBY_T_ZERO returns zeroes of the Chebyshev polynomial T(N)(X).
%
%  Discussion:
%
%    The I-th zero of T(N)(X) is cos((2*I-1)*PI/(2*N)), I = 1 to N
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
%    Output, real Z(N), the zeroes of T(N)(X).
%
  angle = ( 1 : 2 : 2 * n - 1 ) * pi / ( 2 * n );
  z = cos ( angle );

  return
end
