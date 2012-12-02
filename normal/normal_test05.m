function normal_test05 ( )

%*****************************************************************************80
%
%% TEST05 tests R4_NORMAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 July 2006
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  R4_NORMAL computes pseudonormal values \n' );
  fprintf ( 1, '  with mean A and standard deviation B.\n' );

  a = 10.0;
  b = 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The mean A = %f\n', a );
  fprintf ( 1, '  The standard deviation B = %f\n', b );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ x, seed ] = r4_normal ( a, b, seed );
    fprintf ( 1, '  %6d  %14f\n', i, x );
  end

  return
end
