function test_values_test141 ( )

%*****************************************************************************80
%
%% TEST141 demonstrates the use of STUDENT_NONCENTRAL_CDF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST141:\n' );
  fprintf ( 1, '  STUDENT_NONCENTRAL_CDF_VALUES returns values of\n' );
  fprintf ( 1, '  the noncentral Student T Cumulative Density Function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X      LAMBDA     DF     CDF\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 );

    [ n_data, df, lambda, x, fx ] = student_noncentral_cdf_values ( n_data );

    if ( n_data == 0 )
      break;
    end

    fprintf ( 1, '  %8f  %8f  %4d  %24.16f\n', x, lambda, df, fx );

  end

  return
end
