function sobol_test01 ( )

%*****************************************************************************80
%
%% SOBOL_TEST01 tests BITXOR.
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
  fprintf ( 1, 'SOBOL_TEST01\n' );
  fprintf ( 1, '  BITXOR is a MATLAB intrinsic function which returns\n' );
  fprintf ( 1, '  the bitwise exclusive OR of two integers.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I     J     BITXOR(I,J)\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : 10

    [ i, seed ] = i4_uniform ( 0, 100, seed );
    [ j, seed ] = i4_uniform ( 0, 100, seed );
    k = bitxor ( i, j );

    fprintf ( 1, '  %6d  %6d  %6d\n', i, j, k );

  end 

  return
end
