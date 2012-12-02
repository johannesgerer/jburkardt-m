function normal_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests I4_NORMAL.
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
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  I4_NORMAL computes pseudonormal integer values \n' );
  fprintf ( 1, '  with mean A and standard deviation B.\n' );

  a = 70.0;
  b = 10.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The mean A = %f\n', a );
  fprintf ( 1, '  The standard deviation B = %f\n', b );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ x, seed ] = i4_normal ( a, b, seed );
    fprintf ( 1, '  %8d  %8d\n', i, x );
  end

  return
end
