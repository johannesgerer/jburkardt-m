function r8_mant_test ( )

%*****************************************************************************80
%
%% R8_MANT_TEST tests R8_MANT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  x = -314.159;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_MANT_TEST\n' );
  fprintf ( 1, '  R8_MANT decomposes a value.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number to be decomposed:\n' );
  fprintf ( 1, '  %f\n', x );

  [ is, r, l ] = r8_mant ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8_MANT: X = %d * %f * 2^ %d\n', is, r, l );

  return
end
