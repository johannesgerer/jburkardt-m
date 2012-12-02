function test1245 ( )

%*****************************************************************************80
%
%% TEST1245 tests R8_RISE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1245\n' );
  fprintf ( 1, '  R8_RISE computes the rising factorial function.\n' );
  fprintf ( 1, '  [X]_N = X * (X+1) * (X+2) * ... * ( X+N-1).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    X          N  R8_RISE(X,N)\n' );
  fprintf ( 1, '\n' );

  x = 4.0;

  for n = -2 : 5
 
    fprintf ( 1, '  %8f  %6d  %10f\n', x, n, r8_rise ( x, n ) );
 
  end

  return
end
