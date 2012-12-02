function asa243_test01 ( )

%*****************************************************************************80
%
%% TEST01 demonstrates the use of TNC.
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
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  TNC computes the noncentral Student T \n' );
  fprintf ( 1, '  Cumulative Density Function.\n' );
  fprintf ( 1, '  Compare with tabulated values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        X         LAMBDA        DF     ' );
  fprintf ( 1, ' CDF             CDF           DIFF\n' );
  fprintf ( 1, '                                       ' );
  fprintf ( 1, ' Tabulated       PRNCST\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, df, delta, x, fx ] = student_noncentral_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    [ fx2, ifault ] = tnc ( x, df, delta );

    fprintf ( 1, '  %10.4f  %10.4f  %8d  %14.6e  %14.6e  %10.4e\n', ...
    x, delta, df, fx, fx2, abs ( fx - fx2 ) );

  end

  return
end
