function test_one ( )

%*****************************************************************************80
%
%% TEST_ONE performs interpolation with SPINTERP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_ONE:\n' );
  fprintf ( 1, '  An example of the use of SPINTERP\n' );
  fprintf ( 1, '  for sparse interpolation in multiple dimensions.\n' );

  addpath ( '../spinterp' );

  options = spset ( ...
    'GridType', 'Chebyshev', ...
    'MinDepth', 11 );

  m = 2;

  box = [ 0.0, 1.0; ...
          0.0, 1.0 ];
%
%  Set up the sparse grid structure for the function.
%
  c = spvals ( @f_one, m, box, options );
%
%  C is a structure, so this is the easiest way to
%  print it out and examine it:
%
  c
%
%  Pick some sample points in the unit square
%  and compare the interpolant Z to the function F_ONE(X,Y).
%
  sample_num = 100;

  x = rand ( 1, sample_num );
  y = rand ( 1, sample_num );
  z = spinterp ( c, x, y );

  error = max ( abs ( z - f_one ( x, y ) ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum interpolation error was %g\n', error );
%
%  Plot the function and the interpolant.
%
  subplot ( 1, 2, 1 );
  ezmesh ( @f_one, [ 0.0, 1.0 ] );
  title ( 'f(x,y) = sin(x) + cos(y)' );
  subplot ( 1, 2, 2 );
  ezmesh ( @(x,y) spinterp ( c, x, y ), [ 0.0, 1.0 ] );
  title ( 'Sparse grid interpolant' );

  rmpath ( '../spinterp' )
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_ONE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

