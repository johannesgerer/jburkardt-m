function cheby_t_poly_zero_test ( )

%*****************************************************************************80
%
%% CHEBY_T_POLY_ZERO_TEST tests CHEBY_T_POLY_ZERO.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 March 2012
%
%  Author:
%
%    John Burkardt
%
  n_max = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBY_T_POLY_ZERO_TEST:\n' );
  fprintf ( 1, '  CHEBY_T_POLY_ZERO returns zeroes of T(N,X).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         N         X        T(N,X)\n' );
  fprintf ( 1, '\n' );

  for n = 1 : n_max

    z = cheby_t_poly_zero ( n );

    fx = cheby_t_poly ( n, n, z );

    for i = 1 : n
      fprintf ( 1, '  %8d  %11g  %14g\n', n, z(i), fx(i,n+1) );
    end

    fprintf ( 1, '\n' );

  end

  return
end
