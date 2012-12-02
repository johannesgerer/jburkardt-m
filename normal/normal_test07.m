function normal_test07 ( )

%*****************************************************************************80
%
%% TEST07 tests R8_NORMAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 June 2006
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  R8_NORMAL computes pseudonormal values \n' );
  fprintf ( 1, '  with mean A and standard deviation B.\n' );

  a = 10.0;
  b = 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The mean A = %f\n', a );
  fprintf ( 1, '  The standard deviation B = %f\n', b );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ x, seed ] = r8_normal ( a, b, seed );
    fprintf ( 1, '  %6d  %14f\n', i, x );
  end

  return
end
