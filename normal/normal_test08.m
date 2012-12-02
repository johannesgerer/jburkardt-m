function normal_test08 ( )

%*****************************************************************************80
%
%% TEST08 tests R8_NORMAL_01.
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
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  R8_NORMAL_01 computes a sequence of \n' );
  fprintf ( 1, '  normally distributed pseudorandom numbers.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ x, seed ] = r8_uniform_01 ( seed );
    fprintf ( 1, '  %6d  %14f\n', i, x );
  end

  return
end
