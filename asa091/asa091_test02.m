function asa091_test02 ( )

%*****************************************************************************80
%
%% TEST02 compare PPCHI2 against tabulated values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02:\n' );
  fprintf ( 1, '  Compare tabulated values of the Chi-Squared \n' );
  fprintf ( 1, '  Cumulative Density Function against values\n' );
  fprintf ( 1, '  computed by PPCHI2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         N        CDF           X                        ' );
  fprintf ( 1, ' X2                  DIFF\n' );
  fprintf ( 1, '                               (tabulated)               ' );
  fprintf ( 1, '(PPCHI2)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, x, fx ] = chi_square_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    v = a;

    [ g, ifault ] = gamma_ln ( v / 2.0 );

    [ x2, ifault ] = ppchi2 ( fx, v, g );

    fprintf ( 1, '  %8d  %10.4f  %24.16f  %24.16f  %10.4e\n', ...
      a, fx, x, x2, abs ( x - x2 ) );

  end

  return
end
