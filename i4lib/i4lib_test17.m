function i4lib_test17 ( )

%*****************************************************************************80
%
%% TEST17 tests I4_MANT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  x = -314.159;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST17\n' );
  fprintf ( 1, '  I4_MANT decomposes an integer.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number to be decomposed is X = %f\n', x );

  [ is, j, k, l ] = i4_mant ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X = %d * ( %d / %d ) * 2 ^ (%d)\n', is, j, k, l );

  return
end
