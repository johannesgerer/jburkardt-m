function r4_normal_01_test ( )

%*****************************************************************************80
%
%% R4_NORMAL_01_TEST tests R4_NORMAL_01.
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
  fprintf ( 1, 'R4_NORMAL_01_TEST\n' );
  fprintf ( 1, '  R4_NORMAL_01 computes a sequence of \n' );
  fprintf ( 1, '  normally distributed pseudorandom numbers.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );

  for i = 1 : 10
    [ r, seed ] = r4_uniform_01 ( seed );
    fprintf ( 1, '  %6d  %14f\n', i, r );
  end

  return
end
