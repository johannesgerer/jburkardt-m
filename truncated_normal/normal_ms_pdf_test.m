function normal_ms_pdf_test ( )

%*****************************************************************************80
%
%% NORMAL_MS_PDF_TEST tests NORMAL_MS_PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 March 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NORMAL_MS_PDF_TEST\n' );
  fprintf ( 1, '  NORMAL_MS_PDF evaluates the PDF\n' );
  fprintf ( 1, '  for the Normal MS distribution.\n' );

  mu = 100.0;
  sigma = 15.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter MU =    %14f\n', mu );
  fprintf ( 1, '  PDF parameter SIGMA = %14f\n', sigma );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            PDF\n' );
  fprintf ( 1, '\n' );

  for i = -20 : 20
    x = mu + sigma * i / 10.0;
    pdf = normal_ms_pdf ( x, mu, sigma );
    fprintf ( 1, '  %14g  %14g\n', x, pdf );
  end

  return
end
