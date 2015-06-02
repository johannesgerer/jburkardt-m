function lagrange_basis_display_test ( )

%*****************************************************************************80
%
%% LAGRANGE_BASIS_DISPLAY_TEST tests the LAGRANGE_BASIS_DISPLAY library.
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
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_BASIS_DISPLAY_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LAGRANGE_BASIS_DISPLAY_TEST library.\n' );
%
%  Plot the 11 standard "basis vectors".
%
  a = 0.0;
  b = 1.0;
  m = 10;

  standard_basis_display ( a, b, m )
%
%  Plot the 11 Lagrange "basis vectors" for evenly spaced nodes.
%
  a = 0.0;
  b = 1.0;
  m = 10;
  xd = linspace ( a, b, m + 1 )

  lagrange_basis_display ( a, b, m, xd )
%
%  Plot the 11 Lagrange "basis vectors" for Chebyshev-spaced nodes.
%
  a = -1.0;
  b = 1.0;
  m = 10;
  xd(1:m+1) = cos ( pi * ( 2 * ( m + 1 ) + 1 - 2 * (1:m+1) ) / ( 2 * ( m + 1 ) ) );

  lagrange_basis_display ( a, b, m, xd )
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_BASIS_DISPLAY_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
