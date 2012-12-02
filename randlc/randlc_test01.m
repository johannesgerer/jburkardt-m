function randlc_test01 ( )

%*****************************************************************************80
%
%% RANDLC_TEST01 tests RANDLC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 March 2010
%
%  Author:
%
%    John Burkardt
%
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'RANDLC_TEST01\n' );
  fprintf ( 1, '  RANDLC computes pseudorandom values\n' );
  fprintf ( 1, '  in the interval [0,1].\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The initial seed is %d\n', seed );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         I          RANDLC\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 10
    [ x, seed ] = randlc ( seed );
    fprintf ( 1, '  %8d  %14f\n', i, x );
  end

  return
end
