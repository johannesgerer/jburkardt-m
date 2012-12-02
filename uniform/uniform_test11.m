function uniform_test11 ( )

%*****************************************************************************80
%
%% TEST11 tests I8_UNIFORM_AB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 January 2007
%
%  Author:
%
%    John Burkardt
%
  seed_init = 123456789987654321;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST11\n' );
  fprintf ( 1, '  I8_UNIFORM_AB computes pseudorandom values \n' );
  fprintf ( 1, '  in an interval [A,B].\n' );

  a = 1000000000;
  b = 8000000000;

  seed = seed_init;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The lower endpoint A = %d\n', a );
  fprintf ( 1, '  The upper endpoint B = %d\n', b );
  fprintf ( 1, '  The initial seed is    %d\n', seed_init );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ value, seed ] = i8_uniform_ab ( a, b, seed );
    fprintf ( 1, '  %8d  %24d\n', i, value );
  end

  return
end
