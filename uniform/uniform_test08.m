function uniform_test08 ( )

%*****************************************************************************80
%
%% TEST08 tests I4_UNIFORM_AB.
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
  a = -100;
  b = 200;
  seed_init = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  I4_UNIFORM_AB computes pseudorandom values\n' );
  fprintf ( 1, '  in an interval [A,B].\n' );

  seed = seed_init;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The lower endpoint A = %f\n', a );
  fprintf ( 1, '  The upper endpoint B = %f\n', b );
  fprintf ( 1, '  The initial seed is %d\n', seed_init );
  fprintf ( 1, '\n' );

  for i = 1 : 20

    [ j, seed ] = i4_uniform_ab ( a, b, seed );

    fprintf ( 1,'  %8d  %8d\n', i, j );

  end

  return
end
