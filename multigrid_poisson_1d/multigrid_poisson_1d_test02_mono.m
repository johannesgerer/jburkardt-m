function monogrid_poisson_1d_test02_mono ( ) 

%*****************************************************************************80
%
%% MONOGRID_POISSON_1D_TEST02_MONO tests MONOGRID_POISSON_1D on test case 2.
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
  fprintf ( 1, 'MONOGRID_POISSON_1D_TEST02_MONO\n' );
  fprintf ( 1, '  MONOGRID_POISSON_1D solves a 1D Poisson BVP\n' );
  fprintf ( 1, '  using the Gauss-Seidel method.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  -u"(x) = - x * (x+3) * exp(x), for 0 < x < 1\n' );
  fprintf ( 1, '  u(0) = u(1) = 0.\n' );
  fprintf ( 1, '  Solution is u(x) = x * (x-1) * exp(x)\n' );

  for k = 5 : 5

    n = 2^k;

    x = ( linspace ( 0.0, 1.0, n + 1 ) )';

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Mesh index K = %d\n', k );
    fprintf ( 1, '  Number of intervals N=2^K = %d\n', n );
    fprintf ( 1, '  Number of nodes = 2^K+1 =   %d\n', n + 1 );

    [ u, it_num ] = monogrid_poisson_1d ( n, @force2, @exact2 );

     fprintf ( 1, '\n' );
    fprintf ( 1, '     I        X(I)      U(I)         U Exact(X(I))\n' );
    fprintf ( 1, '\n' );
    for i = 1 : n + 1
      fprintf ( 1, '  %4d  %10f  %14g  %14g\n', i, x(i), u(i), exact2 ( x(i) ) );
    end

    fprintf ( 1, '\n' );

    difmax = 0.0;
    for i = 1 : n + 1
      difmax = max ( difmax, abs ( u(i) - exact2 ( x(i) ) ) );
    end
    fprintf ( 1, '  Maximum error = %g\n', difmax );
    fprintf ( 1, '  Number of iterations = %d\n', it_num );

  end

  return
end
