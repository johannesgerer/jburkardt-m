function prob_test140 ( )

%*****************************************************************************80
%
%% TEST140 tests STUDENT_CDF, STUDENT_PDF.
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
  fprintf ( 1, 'TEST140\n' );
  fprintf ( 1, '  For the central Student PDF:\n' );
  fprintf ( 1, '  STUDENT_CDF evaluates the CDF.\n' );
  fprintf ( 1, '  STUDENT_PDF evaluates the PDF.\n' );

  x = 2.447;

  a = 0.5;
  b = 2.0;
  c = 6.0;

  check = student_check ( a, b, c );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST140 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  pdf = student_pdf ( x, a, b, c );

  cdf = student_cdf ( x, a, b, c );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF argument X =    %14f\n', x );
  fprintf ( 1, '  PDF parameter A =   %14f\n', a );
  fprintf ( 1, '  PDF parameter B =   %14f\n', b );
  fprintf ( 1, '  PDF parameter C =   %14f\n', c );
  fprintf ( 1, '  PDF value =         %14f\n', pdf );
  fprintf ( 1, '  CDF value =         %14f\n', cdf );

  return
end
