function prob_test0251 ( )

%*****************************************************************************80
%
%% TEST0251 tests BUFFON_LAPLACE_PDF.
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
  fprintf ( 1, 'TEST0251\n' );
  fprintf ( 1, '  BUFFON_LAPLACE_PDF evaluates the Buffon-Laplace PDF,\n' );
  fprintf ( 1, '  the probability that, on a grid of cells of width A\n' );
  fprintf ( 1, '  and height B, a needle of length L, dropped at random,\n' );
  fprintf ( 1, '  will cross at least one grid line.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A         B         L        PDF\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 5
    a = i;
    for j = 1 : 5
      b = j;

      for k = 0 : 5
        l = k * min ( a, b ) / 5.0;
        pdf = buffon_laplace_pdf ( a, b, l );
        fprintf ( 1, '  %8.4f  %8.4f  %8.4f  %14f\n', a, b, l, pdf );
      end

      fprintf ( 1, '\n' );

    end

  end

  return
end
