function prob_test066 ( )

%*****************************************************************************80
%
%% TEST066 tests F_CDF, F_CDF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST066:\n' );
  fprintf ( 1, '  F_CDF evaluates the F central CDF.\n' );
  fprintf ( 1, '  F_CDF_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     A       B    X       Exact F       F_CDF(A,B,X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, x, fx ] = f_cdf_values ( n_data );

    if ( n_data == 0 );
      break
    end

    fx2 = f_cdf ( x, a, b );

    fprintf ( 1, '  %6d  %6d  %8f  %14f  %14f\n', a, b, x, fx, fx2 );

  end

  return
end
