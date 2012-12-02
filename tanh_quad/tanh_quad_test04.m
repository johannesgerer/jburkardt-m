function tanh_quad_test04 ( p )

%*****************************************************************************80
%
%% TANH_QUAD_TEST04 applies a sequence of trapezoid rules to a test integral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer P, the problem index.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TANH_QUAD_TEST04\n' );
  fprintf ( 1, '  Apply a sequence of trapezoid rules to a test integral.\n' );

  tol = eps;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Problem index P = %d\n', p );
  fprintf ( 1, '  Tolerance TOL = %e\n', tol );

  fprintf ( 1, '\n' );
  fprintf ( 1, '         M      H                    N          Exact           Quad          Error\n' );
  fprintf ( 1, '\n' );

  for m = 1 : 8

    h = tanh_m_to_h ( m );

    n = tanh_h_to_n ( h, tol );

    offset = n + 1;

    [ x, w ] = trap_rule ( n );
%
%  Adjust the rule from [-1,+1] to the actual integration limits.
%
    a = -1.0;
    b = +1.0;

    [ c, d ] = p00_ab ( p );

    [ x, w ] = rule_adjust ( a, b, c, d, 2*n+1, x, w );
%
%  Evaluate the integrand.
%
    fx = p00_f ( p, 2*n+1, x );
%
%  Form the quadrature estimate.
%
    quad = w * fx';

    exact = p00_e ( p );

    error = abs ( exact - quad );

    fprintf ( 1, '  %8d  %16.8e  %8d  %16.8e  %16.8e  %16.8e\n', ...
      m, h, n, exact, quad, error );

  end

  return
end
