function kpn_sparse_test ( )

%*****************************************************************************80
%
%% KPN_SPARSE_TEST uses the KPN function to build a sparse grid.
%
%  Modified:
%
%    07 April 2012
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
  maxk = 4;

  d = 5;
  m = 6;
  func = 'x(:,1).^6';
  trueval = fn_integral ( d );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'KPN_SPARSE_TEST:\n' );
  fprintf ( 1, '  KPN sparse grid:\n' );
  fprintf ( 1, '  Sparse nested, Hermite weight over (-oo,+oo).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   D  Level   Nodes    SG error    MC error\n' );
  fprintf ( 1, '\n' );

  for k = 2 : maxk
%
%  Compute sparse grid estimate.
%
    [x w] = nwspgr ( 'kpn', d, k );
  	g = eval(func);
    SGappr = g'*w;
    SGerror = sqrt((SGappr - trueval).^2)/trueval;
%
%  Compute 1000 Monte Carlo estimate with same number of points, and average.
%
    numnodes = length(w);
    sim = zeros(1000,1);
    for r=1:1000
      x = randn(numnodes,d);
      g = eval ( func );
      sim(r) = mean ( g );
    end
    Simerror = sqrt(mean((sim-trueval).^2))/trueval;

    fprintf( '  %2d     %2d  %6d  %10.5g  %10.5g\n', d, k, numnodes, SGerror, Simerror )

  end

  return
end
