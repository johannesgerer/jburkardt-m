function poly_coef_count_test ( )

%*****************************************************************************80
%
%% POLY_COEF_COUNT_TEST tests POLY_COEF_COUNT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLY_COEF_COUNT_TEST\n' );
  fprintf ( 1, '  POLY_COEF_COUNT counts the number of coefficients\n' );
  fprintf ( 1, '  in a polynomial of degree DEGREE and dimension DIM\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ' Dimension    Degree     Count\n' );

  for dim = 1 : 3 : 10
    fprintf ( 1, '\n' );
    for degree = 0 : 5
      fprintf ( 1, '  %8d  %8d  %8d\n', ...
        dim, degree, poly_coef_count ( dim, degree ) );
    end
  end

  return
end
