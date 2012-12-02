function test_values_test140 ( )

%*****************************************************************************80
%
%% TEST140 demonstrates the use of STUDENT_CDF_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2005
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST140:\n' );
  fprintf ( 1, '  STUDENT_CDF_VALUES returns values of \n' );
  fprintf ( 1, '  the Student T Cumulative Density Function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      C     X       STUDENT_CDF(A,X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, c, x, fx ] = student_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %9f  %9f  %24.16f\n', c, x, fx );

  end

  return
end
