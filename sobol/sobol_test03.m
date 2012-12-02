function sobol_test03 ( )

%*****************************************************************************80
%
%% SOBOL_TEST03 tests I4_BIT_LO0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2005
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SOBOL_TEST03\n' );
  fprintf ( 1, '  I4_BIT_LO0 returns the location of the low 0 bit.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I     I4_BIT_LO0(I)\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : 10

    [ i, seed ] = i4_uniform ( 0, 100, seed );

    j = i4_bit_lo0 ( i );

    fprintf ( 1, '%6d %6d\n', i, j );

  end 

  return
end
