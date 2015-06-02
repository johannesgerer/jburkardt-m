function gqn_sparse_test ( )

%*****************************************************************************80
%
%% GQN_SPARSE_TEST uses the GQN function to build a sparse grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 May 2014
%
%  Author:
%
%    Original MATLAB version by Florian Heiss, Viktor Winschel.
%    This MATLAB version by John Burkardt.
%
%  Local parameters:
%
%    Local, integer D, the spatial dimension.
%
  d = 5;
  trueval = hermite_integral ( d );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GQN_SPARSE_TEST:\n' );
  fprintf ( 1, '  GQN sparse grid:\n' );
  fprintf ( 1, '  Gauss quadrature, Hermite weight over (-oo,+oo).\n' );
  fprintf ( 1, '  Exact integral is %g\n', trueval );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   D  Level   Nodes    SG estimate MC estimate\n' );
  fprintf ( 1, '                       SG error    MC error\n' );
  fprintf ( 1, '\n' );

  for k = 1 : 8
%
%  Compute sparse grid estimate.
%
    [ x, w ] = nwspgr ( 'gqn', d, k );
    [ n, ~ ] = size ( x );
    fx = hermite_integrand ( d, n, x );
    sgappr = w' * fx;
    sgerror = sqrt ( ( sgappr - trueval ) .^ 2 ) / trueval;
%
%  Average 1000 Monte Carlo estimates.
%
    sim = zeros(1000,1);
    for r = 1 : 1000
      x = randn ( n, d );
      fx = hermite_integrand ( d, n, x );
      sim(r) = mean ( fx );
    end
    simappr = mean ( sim );
    simerror = sqrt ( mean ( ( sim - trueval ) .^ 2 ) ) / trueval;

    fprintf ( '  %2d     %2d  %6d  %10.5g  %10.5g\n', ...
      d, k, n, sgappr, simappr );
    fprintf ( '                     %10.5g  %10.5g\n', ...
               sgerror, simerror );

  end

  return
end
