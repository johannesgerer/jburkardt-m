function lebesgue_test09 ( )

%*****************************************************************************80
%
%% LEBESGUE_TEST09 looks at Fejer2 points.
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
  fprintf ( 1, 'LEBESGUE_TEST09:\n' );
  fprintf ( 1, '  Analyze Fejer2 points.\n' );

  n_max = 11;
  l = zeros ( n_max, 1 );
  xfun = linspace ( -1.0, +1.0, 501 );
  xfun = xfun';

  for n = 1 : n_max
    x = fejer2 ( n );
    l(n) = lebesgue_constant ( n, x, xfun );
  end

  r8vec_print ( n_max, l, '  Fejer2 Lebesgue constants for N = 1 to 11:' )
%
%  Examine one case more closely.
%
  n = 11;
  x = fejer2 ( n );
  r8vec_print ( n, x, '  Fejer2 points for N = 11' );

  label = 'Fejer2 points for N = 11';
  filename = 'fejer2.png';
  lebesgue_plot ( n, x, xfun, label, filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot file saved as "%s"\n', filename );

  return
end

