function r8_normal_01_test ( )

%*****************************************************************************80
%
%% R8_NORMAL_01_TEST tests R8_NORMAL_01.
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
  fprintf ( 1, 'R8_NORMAL_01_TEST\n' );
  fprintf ( 1, '  R8_NORMAL_01 computes unit pseudorandom numbers.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ r, seed ] = r8_uniform_01 ( seed );
    fprintf ( 1, '  %6d  %14g\n', i, r );
  end

  return
end
