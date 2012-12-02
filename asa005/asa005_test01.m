function asa005_test01 ( )

%*****************************************************************************80
%
%% TEST01 demonstrates the use of PRNCST.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  PRNCST computes the noncentral Student\n' );
  fprintf ( 1, '  Cumulative Density Function.\n' );
  fprintf ( 1, '  Compare to tabulated values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X   LAMBDA  DF     ' );
  fprintf ( 1, ' CDF                       CDF                     DIFF\n' );
  fprintf ( 1, '                         ' );
  fprintf ( 1, ' Tabulated                 PRNCST\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, df, lambda, x, fx ] = student_noncentral_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    [ fx2, ifault ] = prncst ( x, df, lambda );

    fprintf ( 1, '  %6.2f  %6.2f  %2d  %24.16e  %24.16e  %10.4e\n', ...
    x, lambda, df, fx, fx2, abs ( fx - fx2 ) );

  end

  return
end
