function prob_test142 ( )

%*****************************************************************************80
%
%% TEST142 tests STUDENT_NONCENTRAL_CDF.
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
  fprintf ( 1, 'TEST142\n' );
  fprintf ( 1, '  For the Noncentral Student PDF:\n' );
  fprintf ( 1, '  STUDENT_NONCENTRAL_CDF evaluates the CDF;\n' );

  x = 0.50;

  idf = 10;
  b = 1.0;

  cdf = student_noncentral_cdf ( x, idf, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF argument X =              %14f\n', x );
  fprintf ( 1, '  PDF parameter IDF =           %6d\n', idf );
  fprintf ( 1, '  PDF parameter B =             %14f\n', b );
  fprintf ( 1, '  CDF value =                   %14f\n', cdf );

  return
end
