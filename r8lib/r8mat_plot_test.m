function r8mat_plot_test ( )

%*****************************************************************************80
%
%% R8MAT_PLOT_TEST tests R8MAT_PLOT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  m = 10;
  n = 100;

  a(1:m,1:n) = 0.0;

  for i = 1 : m

    a(i,i) = -2.0;

    if ( i + 1 <= n )
      ip1 = i + 1;
    else
      ip1 = 1;
    end

    a(i,ip1) = 1.0;

    if ( 1 <= i - 1 )
      im1 = i - 1;
    else
      im1 = n;
    end

    a(i,im1) = 1.0;

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_PLOT_TEST\n' );
  fprintf ( 1, '  R8MAT_PLOT prints a symbolic picture of a matrix.\n' );
  fprintf ( 1, '  Typically,\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    "-" for negative,\n' );
  fprintf ( 1, '    " " for zero, and\n' );
  fprintf ( 1, '    "+" for positive entries\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  or\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    "X" for nonzero and,\n' );
  fprintf ( 1, '    " " for zero.\n' );
  fprintf ( 1, '\n' );

  r8mat_plot ( m, n, a, '  A plot of the matrix:' );

  return
end
