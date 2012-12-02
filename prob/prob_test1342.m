function prob_test1342 ( )

%*****************************************************************************80
%
%% TEST1342 tests RUNS_PDF.
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
  fprintf ( 1, 'TEST1342\n' );
  fprintf ( 1, '  For the RUNS PDF:\n' );
  fprintf ( 1, '  RUNS_PDF evaluates the PDF;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  M is the number of symbols of one kind,\n' );
  fprintf ( 1, '  N is the number of symbols of the other kind,\n' );
  fprintf ( 1, '  R is the number of runs (sequences of one symbol)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         M         N         R      PDF\n' );
  fprintf ( 1, '\n' );

  m = 6;

  for n = 0 : 8

    fprintf ( 1, '\n' );
    pdf_total = 0.0;

    for r = 1 : 2 * min ( m, n ) + 2

      pdf = runs_pdf ( m, n, r );
      fprintf ( 1, '  %8d  %8d  %8d  %14f\n', m, n, r, pdf );
      pdf_total = pdf_total + pdf;

    end

    fprintf ( 1, '  %8d                      %14f\n', m, pdf_total );

  end

  return
end
