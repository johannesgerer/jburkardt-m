function normal_01_pdf_test ( )

%*****************************************************************************80
%
%% NORMAL_01_PDF_TEST tests NORMAL_01_PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NORMAL_01_PDF_TEST\n' );
  fprintf ( 1, '  NORMAL_01_PDF evaluates the Normal 01 PDF;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       X              PDF\n' );
  fprintf ( 1, '\n' );

  for i = - 20 : 20

    x = i / 10.0;
    pdf = normal_01_pdf ( x );

    fprintf ( 1, '  %14.6g  %14.6g\n', x, pdf );

  end

  return
end
