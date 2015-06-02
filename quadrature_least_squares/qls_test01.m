function qls_test01 ( )

%*****************************************************************************80
%
%% QLS_TEST01 shows that we can compute the Newton-Cotes rules.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 March 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QLS_TEST01\n' );
  fprintf ( 1, '  WEIGHTS_LS computes the weights for a \n' );
  fprintf ( 1, '  least squares quadrature rule.\n' );
%
%  Demonstrate the 5 point Newton-Cotes closed rule.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  W1 = classical Newton Cotes weights, N = 5\n' );
  fprintf ( 1, '  W2 = least squares weights, D = 4, N = 5\n' );
  n = 5;
  [ x, w1 ] = ncc_set ( n );
%
%  Using the same points, compute the least squares weights
%  for polynomial approximation up to degree 4.
%
  d = n - 1;
  a = -1.0;
  b = +1.0;
  w2 = weights_ls ( d, a, b, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   I        X(i)          W1(i)           W2(i)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %2d  %10.4f  %14.6g  %14.6g\n', i, x(i), w1(i), w2(i) );
  end
%
%  Look at a 9 point rule.
%  Note that Newton Cotes rules soon have many negative weights.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  W1 = classical Newton Cotes weights, N = 9\n' );
  fprintf ( 1, '  W2 = least squares weights, D = 4, N = 9\n' );
  n = 9;
  [ x, w1 ] = ncc_set ( n );
%
%  Using the same points, compute the least squares weights
%  for polynomial approximation up to degree 4.
%
  d = 4;
  a = -1.0;
  b = +1.0;
  w2 = weights_ls ( d, a, b, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   I        X(i)          W1(i)           W2(i)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %2d  %10.4f  %14.6g  %14.6g\n', i, x(i), w1(i), w2(i) );
  end

  return
end
