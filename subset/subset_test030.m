function subset_test030 ( )

%*****************************************************************************80
%
%% TEST030 tests R8_FALL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST030\n' );
  fprintf ( 1, '  R8_FALL computes the falling factorial function.\n' );
  fprintf ( 1, '  [X]_N = X * (X-1) * (X-2) * ... * ( X-N+1).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    X          N  R8_FALL(X,N)\n' );
  fprintf ( 1, '\n' );

  x = 4.0;

  for n = -2 : 5
    value = r8_fall ( x, n );
    fprintf ( 1, '%10f  %6i  %10f\n', x, n, value );
  end

  return
end
