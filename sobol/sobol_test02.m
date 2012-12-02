function sobol_test02 ( )

%*****************************************************************************80
%
%% SOBOL_TEST02 tests I4_BIT_HI1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2005
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SOBOL_TEST02\n' );
  fprintf ( 1, '  I4_BIT_HI1 returns the location of the high 1 bit.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I     I4_BIT_HI1(I)\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : 10

    [ i, seed ] = i4_uniform ( 0, 100, seed );

    j = i4_bit_hi1 ( i );

    fprintf ( 1, '%6d %6d\n', i, j );

  end 

  return
end
