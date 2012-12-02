function tanh_sinh_test025 ( )

%*****************************************************************************80
%
%% TANH_SINH_TEST025 computes a tanh sinh quadrature rule.
%
%  Discussion:
%
%    We are seeking a family of nested rules.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989,
%    ISBN: 0-13-627258-4,
%    LC: TA345.K34.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST025\n' );
  fprintf ( 1, '  Determine tanh-sinh quadrature rules W, X\n' );
  fprintf ( 1, '  for N = 0, 1, 3, 7, 15, 31, 63.\n' );

  for m = -3 : 5

    order = 2^( m + 4 ) - 1;
    n = floor ( ( order + 1 ) / 2 ) - 1;
    offset = n + 1;
    h = 4.0 / ( order + 1 );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  M = %d  ORDER = %d  N = %d  H = %e\n', m, order, n, h );

    [ x, w ] = tanh_sinh_rule ( n, h );

    fprintf ( 1, '\n' );
    fprintf ( 1, '         I       Wi                Xi\n' );
    fprintf ( 1, '\n' );

    for i = - n : n
      fprintf ( 1, '  %8d  %16e  %16e\n', i, w(i+offset), x(i+offset) );
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Note that, especially for low N, the weights need not sum to 2!\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         N       H              sum(W)\n' );
  fprintf ( 1, '\n' );

  for m = -3 : 10

    order = 2^( m + 4 ) - 1;
    n = floor ( ( order + 1 ) / 2 ) - 1;
    offset = n + 1;
    h = 1.0 / 2.0^m;

    [ x, w ] = tanh_sinh_rule ( n, h );

    fprintf ( 1, '  %8d  %16e  %16f\n', n, h, sum ( w(-n+offset:n+offset) ) );

  end

  return
end
