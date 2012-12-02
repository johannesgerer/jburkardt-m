function linplus_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests R83_CR_FA, R83_CR_SL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  n = 5;
  debug = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  R83_CR_FA factors a real tridiagonal matrix;\n' );
  fprintf ( 1, '  R83_CR_SL solves a factored system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
  fprintf ( 1, '  Demonstrate multiple system solution method.\n' );
  fprintf ( 1, '\n' );
%
%  Set the matrix values.
%
  a(1,1) = 0.0E+00;
  a(1,2:n) = -1.0E+00;

  a(2,1:n) = 2.0E+00;

  a(3,1:n-1) = -1.0E+00;
  a(3,n) = 0.0E+00;
%
%  Print the matrix.
%
  if ( debug )
    r83_print ( n, a, '  Input matrix:' );
  end
%
%  Factor the matrix once.
%
  a_cr = r83_cr_fa ( n, a );
%
%  Print the factor information.
%
  if ( debug )
    r83_print ( 2*n+1, a_cr, '  Cyclic reduction factor information:' );
  end 

  for j = 1 : 2

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Solve linear system number #%d\n', j );

    if ( j == 1 ) 
      b(1:n-1) = 0.0E+00;
      b(n) = n + 1;
    else
      b(1) = 1.0E+00;
      b(2:n-1) = 0.0E+00;
      b(n) = 1.0E+00;
    end
%
%  Solve the linear system.
%
    x = r83_cr_sl ( n, a_cr, b );

    r8vec_print_some ( n, x, 10, '  Solution:' );

  end

  return
end

