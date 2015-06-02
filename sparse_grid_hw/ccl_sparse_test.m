function ccl_sparse_test ( )

%*****************************************************************************80
%
%% CCL_SPARSE_TEST uses CCL to build a sparse grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Local parameters:
%
%    Local, integer D, the spatial dimension.
%
%    Local, integer MAXK, the maximum level to check.
%
  d = 10;
  maxk = 7;
  func = 'prod( exp(-(x/2).^2/2)/2/sqrt(2*pi), 2)';
  trueval = fu_integral ( d );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CCL_SPARSE_TEST:\n' );
  fprintf ( 1, '  CCL sparse grid:\n' );
  fprintf ( 1, '  Clenshaw-Curtis Linear sparse grid.\n' );
  fprintf ( 1, '  Exact integral is %g\n', trueval );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   D  Level   Nodes    SG error    MC error\n' );
  fprintf ( 1, '\n' );

  for k = 1 : maxk
%
%  Compute the sparse grid estimate.
%
    [ x, w ] = nwspgr ( 'ccl', d, k );
    fx = eval ( func );
    SGappr = w' * fx;
    SGerror = sqrt ( ( SGappr - trueval ).^2 ) / trueval;
%
%  Average 1000 Monte Carlo estimates.
%
    numnodes = length ( w );
    sim = zeros ( 1000, 1 );
    for r = 1 : 1000
      x = rand ( numnodes, d );
      fx = eval ( func );
      sim(r) = mean ( fx );
    end
    simerror = sqrt ( mean ( ( sim - trueval ).^2 ) ) / trueval;

    fprintf( '  %2d     %2d  %6d  %10.5g  %10.5g\n', ...
      d, k, numnodes, SGerror, simerror )

  end

  return
end
