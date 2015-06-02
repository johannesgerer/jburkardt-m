function svd_snowfall_test02 ( x )

%*****************************************************************************80
%
%% SVD_SNOWFALL_TEST02 looks at the singular values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 March 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(8,123), the snowfall data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SVD_SNOWFALL_TEST02\n' );
  fprintf ( 1, '  Look at the singular values.\n' );
  fprintf ( 1, '  If the singular values are close, then the data is\n' );
  fprintf ( 1, '  well spread out.  If the singular values decay rapidly,\n' );
  fprintf ( 1, '  then the data exhibits patterns, or is constrained to\n' );
  fprintf ( 1, '  a lower-dimensional subspace.\n' );
%
%  Compute the SVD.
%
  [ u, s, v ] = svd ( x );
%
%  Extract the diagonal of S.
%
  sdiag = diag ( s );
%
%  Print the singular values.
%
  r8vec_print ( 8, sdiag, '  The singular values:' )
%
%  Plot the singular values.
%
  figure ( 2 )
  plot ( 1:8, sdiag, 'b.-', 'Linewidth', 3, 'MarkerSize', 50 );
  title ( 'Singular values of the SNOWFALL matrix' )
  grid on
  print ( '-dpng', 'singular_values.png' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plotted the singular values in "singular_values.png".\n' );
%
%  Print the cumulative "energy" of the singular values.
%
  energy = cumsum ( sdiag.^2 ) / sum ( sdiag.^2 );

  r8vec_print ( 8, energy, '  The cumulative energy:' );

  return
end
