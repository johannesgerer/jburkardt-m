function uniform_test16 ( )

%*****************************************************************************80
%
%% TEST16 tests R8_UNIFORM_01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    29 June 2006
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST16\n' );
  fprintf ( 1, '  R8_UNIFORM_01 computes pseudorandom double precision values\n' );
  fprintf ( 1, '  in the unit interval.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ d, seed ] = r8_uniform_01 ( seed );
    fprintf ( 1, '  %6d  %f\n', i, d );
  end

  return
end
