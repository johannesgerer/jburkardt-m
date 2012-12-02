function prob_test139 ( )

%*****************************************************************************80
%
%% TEST139 tests STUDENT_CDF and STUDENT_CDF_VALUES.
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
  fprintf ( 1, 'TEST139:\n' );
  fprintf ( 1, '  STUDENT_CDF evaluates the cumulative\n' );
  fprintf ( 1, '    distribution function for the Student''s central T\n' );
  fprintf ( 1, '    probability density function.\n' );
  fprintf ( 1, '  STUDENT_CDF_VALUES returns some exact values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   A       B       C       X       Exact F     STUDENT_CDF\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, c, x, fx ] = student_cdf_values ( n_data );

    if ( n_data == 0 );
      break
    end

    a = 0;
    b = 1;
    fx2 = student_cdf ( x, a, b, c );

    fprintf ( 1, '  %8f  %8f  %8f  %8f  %14f  %14f\n', a, b, c, x, fx, fx2 );

  end

  return
end
