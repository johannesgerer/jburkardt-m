function unicycle_test05 ( )

%*****************************************************************************80
%
%% UNICYCLE_TEST05 tests UNICYCLE_RANDOM;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 June 2012
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNICYCLE_TEST05\n' );
  fprintf ( 1, '  UNICYCLE_RANDOM produces a random unicyle;\n' );
  fprintf ( 1, '  For this test, N = %d\n', n );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for i = 1 : 5
    [ u, seed ] = unicycle_random ( n, seed );
    unicycle_print ( n, u, ' ' );
  end
 
  return
end
