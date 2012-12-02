function prob_test067 ( )

%*****************************************************************************80
%
%% TEST067 tests F_CDF, F_PDF.
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
  fprintf ( 1, 'TEST067\n' );
  fprintf ( 1, '  For the central F PDF:\n' );
  fprintf ( 1, '  F_CDF evaluates the CDF.\n' );
  fprintf ( 1, '  F_PDF evaluates the PDF.\n' );

  m = 1;
  n = 1;
  seed = 123456789;
  
  if ( ~f_check ( m, n ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The parameters are not legal!\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter M = %6d\n', m );
  fprintf ( 1, '  PDF parameter N = %6d\n', n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '      X        M     N        PDF         CDF\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ x, seed ] = f_sample ( m, n, seed );

    pdf = f_pdf ( x, m, n );

    cdf = f_cdf ( x, m, n );

    fprintf ( 1, '  %14f  %6d  %6d  %14f  %14f\n', x, m, n, pdf, cdf );

  end

  return
end
