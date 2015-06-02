function r8_uniform_01_test ( )

%*****************************************************************************80
%
%% R8_UNIFORM_01_TEST tests R8_UNIFORM_01.
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
  fprintf ( 1, 'R8_UNIFORM_01_TEST\n' );
  fprintf ( 1, '  R8_UNIFORM_01 computes pseudorandom double precision values\n' );
  fprintf ( 1, '  in the unit interval.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ r8, seed ] = r8_uniform_01 ( seed );
    fprintf ( 1, '  %6d  %f\n', i, r8 );
  end

  return
end
