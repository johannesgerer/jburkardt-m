function r8_epsilon_test ( )

%*****************************************************************************80
%
%% R8_EPSILON_TEST tests R8_EPSILON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_EPSILON_TEST\n' );
  fprintf ( 1, '  R8_EPSILON produces the R8 roundoff unit.\n' );
  fprintf ( 1, '\n' );

  r = r8_epsilon ( );
  fprintf ( 1, '  R = R8_EPSILON()         = %e\n', r );

  s = ( 1.0 + r ) - 1.0;
  fprintf ( 1, '  ( 1 + R ) - 1            = %e\n', s );

  s = ( 1.0 + ( r / 2.0 ) ) - 1.0;
  fprintf ( 1, '  ( 1 + (R/2) ) - 1        = %e\n', s );

  return
end
