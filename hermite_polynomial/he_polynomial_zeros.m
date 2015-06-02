function z = he_polynomial_zeros ( nt )

%*****************************************************************************80
%
%% HE_POLYNOMIAL_ZEROS zeros of He(i,x).
%
%  Discussion:
%
%    He(i,x) represents the probabilist's Hermite polynomial.
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
%
%  Adjust for probabilist.
%
  z(1:nt,1) = z(1:nt,1) * sqrt ( 2.0 );

  return
end

