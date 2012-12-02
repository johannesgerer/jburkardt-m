function tanh_quad_test03 ( )

%*****************************************************************************80
%
%% TEST03 computes a quadrature rule W, X based on a tolerance.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TANH_QUAD_TEST03\n' );
  fprintf ( 1, '  Determine a quadrature rule W, X by specifying\n' );
  fprintf ( 1, '  a tolerance.\n' );

  tol = eps;

  fprintf ( 1, '  Tolerance TOL = %e\n', tol );

  for m = -1 : 2

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Level M = %d\n', m );
    h = tanh_m_to_h ( m );
    fprintf ( 1, '  Spacing H = %e\n', h );
    n = tanh_h_to_n ( h, tol );
    fprintf ( 1, '  Quadrature order N = %d\n', n );

    offset = n + 1;

    [ x, w ] = tanh_rule ( n, h );

    fprintf ( 1, '\n' );
    fprintf ( 1, '         I      Wi                Xi\n' );
    fprintf ( 1, '\n' );

    for i = - n : n
      fprintf ( 1, '  %8d  %16.8e  %16.8e\n', i, w(i+offset), x(i+offset) );
    end

  end

  return
end
