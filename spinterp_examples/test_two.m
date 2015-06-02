function test_two ( )

%*****************************************************************************80
%
%% TEST_TWO performs quadrature with SPINTERP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_TWO:\n' );
  fprintf ( 1, '  An example of the use of SPINTERP\n' );
  fprintf ( 1, '  for quadrature in multiple dimensions.\n' );

  addpath ( '../spinterp' );

  m = 2;
  fprintf ( 1, '  Using spatial dimension M = %d\n', m );
  level_max = 8;
  fprintf ( 1, '  Using maximum level LEVEL_MAX = %d\n', level_max );
%
%  Turn off warnings from SPINTERP that a given integral estimate is poor.
%
  warning ( 'off', 'MATLAB:spinterp:insufficientDepth' )
%
%  Compute the integral estimate for an increasing sequence of levels.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, ' Level    Points        Estimate      Error\n' );
  fprintf ( 1, '\n' );

  for level = 0 : level_max
%
%  Indicate that we wish to use exactly the sparse grid of level LEVEL.
%
    options = spset ( ...
      'MinDepth', level, ...
      'MaxDepth', level, ...
      'GridType', 'Chebyshev', ...
      'FunctionArgType', 'vector' );
%
%  Compute the sparse grid structure.
%
    z = spvals ( @f_two, m, [], options );
%
%  Estimate the integral.
%
    n = z.nPoints;

    q = spquad ( z );

    exact = 1.0;

    e = abs ( q - exact );

    fprintf ( 1, '  %4d  %8d  %14.6g  %14.6g\n', level, n, q, e );

  end

  rmpath ( '../spinterp' )
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_TWO:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );
  return
end

