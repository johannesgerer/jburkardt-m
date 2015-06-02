function monogrid_poisson_1d_test01_multi ( ) 

%*****************************************************************************80
%
%% MONOGRID_POISSON_1D_TEST01_MULTI tests MULTIGRID_POISSON_1D on test case 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 December 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MONOGRID_POISSON_1D_TEST01_MULTI\n' );
  fprintf ( 1, '  MULTIGRID_POISSON_1D solves a 1D Poisson BVP\n' );
  fprintf ( 1, '  using the multigrid method.\n' );

  a = 0.0;
  b = 1.0;
  ua = 0.0;
  ub = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  -u"(x) = 1, for %g < x < %g\n', a, b );
  fprintf ( 1, '  u(%g) = %g, u(%g) = %g.\n', a, ua, b, ub );
  fprintf ( 1, '  Solution is u(x) = ( -x^2 + x ) / 2\n' );

  for k = 5 : 5

    n = 2^k;
    x = ( linspace ( a, b, n + 1 ) )';

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Mesh index K = %d\n', k );
    fprintf ( 1, '  Number of intervals N=2^K = %d\n', n );
    fprintf ( 1, '  Number of nodes = 2^K+1 =   %d\n', n + 1 );

    [ u, it_num ] = multigrid_poisson_1d ( n, a, b, ua, ub, @force1, @exact1 );

    fprintf ( 1, '\n' );
    fprintf ( 1, '     I        X(I)      U(I)         U Exact(X(I))\n' );
    fprintf ( 1, '\n' );
    for i = 1 : n + 1
      fprintf ( 1, '  %4d  %10f  %14g  %14g\n', i, x(i), u(i), exact1 ( x(i) ) );
    end

    fprintf ( 1, '\n' );

    difmax = 0.0;
    for i = 1 : n + 1
      difmax = max ( difmax, abs ( u(i) - exact1 ( x(i) ) ) );
    end
    fprintf ( 1, '  Maximum error = %g\n', difmax );
    fprintf ( 1, '  Number of iterations = %d\n', it_num );

  end

  return
end
