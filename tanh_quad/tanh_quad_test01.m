function tanh_quad_test01 ( )

%*****************************************************************************80
%
%% TANH_QUAD_TEST01 demonstrates TANH_M_TO_H and TANH_H_TO_N.
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
  fprintf ( 1, 'TANH_QUAD_TEST01\n' );
  fprintf ( 1, '  TANH_M_TO_H determines the spacing H from level M\n' );
  fprintf ( 1, '  TANH_H_TO_N determines the quadrature order N from\n' );
  fprintf ( 1, '  the spacing H and tolerance TOL.\n' );

  tol = eps;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  All tests use TOL = %e\n', tol );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         M        H                  N\n' );
  fprintf ( 1, '\n' );

  for m = -2 : 8

    h = tanh_m_to_h ( m );

    n = tanh_h_to_n ( h, tol );

    fprintf ( 1, '  %8d  %16e  %8d\n', m, h, n );

  end

  return
end
