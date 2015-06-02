function spquad_test01 ( d, maxk )

%*****************************************************************************80
%
%% SPQUAD_TEST01 invokes the SPQUAD function for sparse quadrature.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Local parameters:
%
%    Input, integer D, the spatial dimension.
%
%    Input, integer MAXK, the maximum level to check.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPQUAD_TEST:\n' );
  fprintf ( 1, '  Clenshaw Curtis sparse grid over [-1,1]^D.\n' );
  fprintf ( 1, '  Spatial dimension is D = %d\n', d );
  fprintf ( 1, '  Maximum level MAXK = %d\n', maxk );

  trueval = 2^d * fu_integral ( d );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   D  Level   Nodes    SG error    MC error\n' );
  fprintf ( 1, '\n' );

  for k = 0 : maxk
%
%  Compute sparse grid estimate.
%
    [ x, w ] = spquad ( d, k );
    n = length ( w );
    g = fu_value ( d, n, x' );
    SGappr = w' * g;
    SGerror = sqrt ( ( SGappr - trueval )^2 ) / trueval;
%
%  Compute Monte Carlo estimate with same number of points, and average.
%
    mc_num = 1000;
    sim = zeros ( mc_num, 1 );
    for r = 1 : mc_num
      x = 2 * rand ( d, n ) - 1;
      g = fu_value ( d, n, x );
      sim(r) = mean ( g ) * 2.0^d;
    end
    Simerror = sqrt ( mean ( ( sim - trueval ).^2 ) ) / trueval;

    fprintf( '  %2d     %2d  %6d  %10.5g  %10.5g\n', d, k, n, SGerror, Simerror )

  end

  return
end
