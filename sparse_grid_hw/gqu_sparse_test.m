function gqu_sparse_test ( )

%*****************************************************************************80
%
%% GQU_SPARSE_TEST uses the GQU function to build a sparse grid.
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
%    Original MATLAB version by Florian Heiss, Viktor Winschel.
%
%  Local parameters:
%
%    Local, integer D, the spatial dimension.
%
%    Local, integer MAXK, the maximum level to check.
%
  d = 6;
  maxk = 10;
  func = 'prod ( exp(-(x/2).^2/2)/2/sqrt(2*pi), 2 ) ';
  trueval = fu_integral ( d );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GQU_SPARSE_TEST:\n' );
  fprintf ( 1, '  GQU sparse grid:\n' );
  fprintf ( 1, '  Sparse Gaussian unweighted quadrature over [0,1].\n' );
  fprintf ( 1, '  Exact integral is %g\n', trueval );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   D  Level   Nodes    SG error    MC error\n' );
  fprintf ( 1, '\n' );

  for k = 1 : maxk
%
%  Compute sparse grid estimate.
%
    [ x, w ] = nwspgr ( 'gqu', d, k );
    fx = eval ( func );
    SGappr = w' * fx;
    SGerror = sqrt ( ( SGappr - trueval ) .^ 2 ) / trueval;
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
    simerror = sqrt ( mean ( ( sim - trueval ) .^ 2 ) ) / trueval;

    fprintf( '  %2d     %2d  %6d  %10.5g  %10.5g\n', ...
      d, k, numnodes, SGerror, simerror )

  end

  return
end
