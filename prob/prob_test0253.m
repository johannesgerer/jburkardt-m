function prob_test0253 ( )

%*****************************************************************************80
%
%% TEST0253 tests BUFFON_PDF.
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
  fprintf ( 1, 'TEST0253\n' );
  fprintf ( 1, '  BUFFON_PDF evaluates the Buffon PDF,\n' );
  fprintf ( 1, '  the probability that, on a grid of cells of width A,\n' );
  fprintf ( 1, '  a needle of length L, dropped at random,\n' );
  fprintf ( 1, '  will cross at least one grid line.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A         L        PDF\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 5
    a = i;

    for k = 0 : 5
      l = k * a / 5.0;
      pdf = buffon_pdf ( a, l );
      fprintf ( 1, '  %8.4f  %8.4f  %14f\n', a, l, pdf );
    end

    fprintf ( 1, '\n' );

  end

  return
end
