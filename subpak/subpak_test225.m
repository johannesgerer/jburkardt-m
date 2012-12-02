function test225 ( )

%*****************************************************************************80
%
%% TEST225 tests LMAT_PRINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2011
%
%  Author:
%
%    John Burkardt
%
  m = 20;
  n = 50;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST225\n' );
  fprintf ( 1, '  LMAT_PRINT prints a logical matrix.\n' );

  a = zeros ( m, n );

  for i = 1 : m
    for j = 1 : n
      a(i,j) = ( mod ( i, j ) == 0 );
    end
  end

  lmat_print ( m, n, a, '  A(I,J) = I is divisible by J' );

  return
end
