function asa066_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests NORMP.
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
  fprintf ( 1, '  Compare tabulated values of the normal\n' );
  fprintf ( 1, '  Cumulative Density Function against values\n' );
  fprintf ( 1, '  computed by NORMP.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         X        CDF                       CDF' );
  fprintf ( 1, '                    DIFF\n' );
  fprintf ( 1, '               (tabulated)                 (NORMP)\n' );
  fprintf ( 1, '\n' );

  upper = 0;
  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = normal_01_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    [ p, q, pdf ] = normp ( x );
    fx2 = p;

    fprintf ( 1, '  %10.4e  %24.16e  %24.16e  %10.4e\n', ...
    x, fx, fx2, abs ( fx - fx2 ) );

  end

  return
end
