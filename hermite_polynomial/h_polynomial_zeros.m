function z = h_polynomial_zeros ( nt )

%*****************************************************************************80
%
%% H_POLYNOMIAL_ZEROS: zeros of H(i,x).
%
%  Discussion:
%
%    H(i,x) is the physicist's Hermite polynomial of degree I.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NT, the degree of the polynomial.
%
%    Output, real Z(NT,1), the zeros of the polynomial.
%
  aj = zeros ( nt, 1 );
  bj = sqrt ( ( 1 : nt )' / 2.0 );
  wts = zeros ( nt, 1 );
  wts(1,1) = sqrt ( sqrt ( pi ) );

  [ z, wts ] = imtqlx ( nt, aj, bj, wts );

  return
end

