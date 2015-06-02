function niederreiter2_test03 ( )

%*****************************************************************************80
%
%% NIEDERREITER2_TEST03 tests EXOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NIEDERREITER2_TEST03\n' );
  fprintf ( 1, '  EXOR returns the exclusive OR of two integers.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I     J     EXOR(I,J)\n' );
  fprintf ( 1, '\n' );

  seed = get_seed ( );

  for test = 1 : 10

    [ i, seed ] = i4_uniform ( 0, 100, seed );
    [ j, seed ] = i4_uniform ( 0, 100, seed );
    k = exor ( i, j );

    fprintf ( 1, '%6d %6d %6d\n', i, j, k );

  end 

  return
end
