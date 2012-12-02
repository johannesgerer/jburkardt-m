function uniform_test14 ( )

%*****************************************************************************80
%
%% TEST14 tests R4_UNIFORM_01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 July 2006
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST14\n' );
  fprintf ( 1, '  R4_UNIFORM_01 computes pseudorandom values\n' );
  fprintf ( 1, '  in the interval [0,1].\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ x, seed ] = r4_uniform_01 ( seed );
    fprintf ( 1, '  %6d  %14f\n', i, x );
  end

  return
end
