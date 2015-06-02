function test_three ( )

%*****************************************************************************80
%
%% TEST_THREE performs optimization with SPINTERP.
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
  fprintf ( 1, 'TEST_THREE:\n' );
  fprintf ( 1, '  An example of the use of SPINTERP\n' );
  fprintf ( 1, '  for optimization in multiple dimensions.\n' );
%
%  Plot the function.  G_THREE actually evaluates Log(F_THREE+2), which
%  makes it easier to see the contour lines.
%
  x = linspace ( -3, +3, 51 );
  y = linspace ( -2, +2, 51 );
  [ X, Y ] = meshgrid ( x, y ); 
  Z = g_three ( X, Y );
  contour ( Z, 30 )

  addpath ( '../spinterp' );

  m = 2;
  fprintf ( 1, '  Using spatial dimension M = %d\n', m );
  level_max = 10;
  fprintf ( 1, '  Using maximum level LEVEL_MAX = %d\n', level_max );
%
%  Set the range for X and Y.
%
  range = [ -3.0, +3.0; -2.0, +2.0 ];
%
%  The minimum value of F is known.
%
  f_exact = - 1.0316284535;
%
%  Initialize Z to an empty structure.
%
  z = [];
%
%  Turn off warnings from SPINTERP that a given integral estimate is poor.
%
  warning ( 'off', 'MATLAB:spinterp:insufficientDepth' )
%
%  Use an increasing sequence of levels to search for the minimizer.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, ' Level    Points   F-Evals         Error           ( X,              Y )\n' );
  fprintf ( 1, '\n' );

  for level = 0 : level_max
%
%  Indicate that we wish to use exactly the sparse grid of level LEVEL,
%  and to retain information computed on previous calls.
%
    options = spset ( ...
      'MinDepth', level, ...
      'MaxDepth', level, ...
      'PrevResults', z, ...
      'KeepFunctionValues', 'on' );
%
%  Compute the sparse grid structure.
%
    z = spvals ( @f_three, m, range, options );
    n = z.nPoints;
%
%  Seek a minimizer of the function within the range.
%
    [ xopt, fopt, exitflag, output ] = spcompsearch ( z, range );

    f_num = output.nFEvals;

    e = abs ( f_exact - fopt );

    fprintf ( 1, '  %4d  %8d  %8d  %14.6g  %14.6g  %14.6g\n', level, n, f_num, e, xopt(1:2) );

  end

  rmpath ( '../spinterp' )
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_THREE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );
  return
end

