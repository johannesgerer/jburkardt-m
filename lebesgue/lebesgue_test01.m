function lebesgue_test01 ( )

%*****************************************************************************80
%
%% LEBESGUE_TEST01 looks at Chebyshev1 points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEBESGUE_TEST01:\n' );
  fprintf ( 1, '  Analyze Chebyshev1 points.\n' );

  n_max = 11;
  l = zeros ( n_max, 1 );
  xfun = linspace ( -1.0, +1.0, 501 );
  xfun = xfun';

  for n = 1 : n_max
    x = chebyshev1 ( n );
    l(n) = lebesgue_constant ( n, x, xfun );
  end

  r8vec_print ( n_max, l, '  Chebyshev1 Lebesgue constants for N = 1 to 11:' )
%
%  Examine one case more closely.
%
  n = 11;
  x = chebyshev1 ( n );
  r8vec_print ( n, x, '  Chebyshev1 points for N = 11' );

  label = 'Chebyshev1 points for N = 11';
  filename = 'chebyshev1.png';
  lebesgue_plot ( n, x, xfun, label, filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot file saved as "%s"\n', filename );

  return
end

