function polygon_integrals_test01 ( )

%*****************************************************************************80
%
%% POLYGON_INTEGRALS_TEST01 carries out a test on a rectangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 October 2012
%
%  Author:
%
%    John Burkardt
%
  n = 4;

  alpha_exact = [ ...
    1.0, 5.0, 4.0, 30.66666666666667, 22.0, 18.66666666666666 ];
  mu_exact = [ ...
    1.0, 0.0, 0.0, 5.666666666666667, 2.0, 2.666666666666667 ];
  nu_exact = [ ...
    40.0, 200.0, 160.0, 1226.66666666666667, 880.0, 746.66666666666666 ];
  x = [ 2.0, 10.0, 8.0, 0.0 ];
  y = [ 0.0,  4.0, 8.0, 4.0 ];

  fprintf ( '\n' );
  fprintf ( 'POLYGON_INTEGRALS_TEST01\n' );
  fprintf ( '  Check normalized moments of a rectangle.\n' );
  fprintf ( '\n' );
  fprintf ( '   P   Q             Nu(P,Q)\n' );
  fprintf ( '            Computed         Exact\n' );
  fprintf ( '\n' );
  k = 0;
  for s = 0 : 2
    for p = s : -1 : 0
      q = s - p;
      k = k + 1;
      nu_pq = moment ( n, x, y, p, q );
      fprintf ( '  %2d  %2d  %14.6g  %14.6g\n', p, q, nu_pq, nu_exact(k) );
    end
  end

  fprintf ( '\n' );
  fprintf ( '   P   Q           Alpha(P,Q)\n' );
  fprintf ( '            Computed         Exact\n' );
  fprintf ( '\n' );
  k = 0;
  for s = 0 : 2
    for p = s : -1 : 0
      q = s - p;
      k = k + 1;
      alpha_pq = moment_normalized ( n, x,y, p, q );
      fprintf ( '  %2d  %2d  %14.6g  %14.6g\n', p, q, alpha_pq, alpha_exact(k) );
    end
  end

  fprintf ( '\n' );
  fprintf ( '   P   Q             Mu(P,Q)\n' );
  fprintf ( '            Computed         Exact\n' );
  fprintf ( '\n' );
  k = 0;
  for s = 0 : 2
    for p = s : -1 : 0
      q = s - p;
      k = k + 1;
      mu_pq = moment_central ( n, x, y , p, q );
      fprintf ( '  %2d  %2d  %14.6g  %14.6g\n', p, q, mu_pq, mu_exact(k) );
    end
  end

  return
end
