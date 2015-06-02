function kronrod_test01 ( )

%*****************************************************************************80
%
%% KRONROD_TEST01 tests the code for the odd case N = 3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 August 2010
%
%  Author:
%
%    John Burkardt
%
  n = 3;

  wg(1:n) = [ ...
    0.555555555555555555556, ...
    0.888888888888888888889, ...
    0.555555555555555555556 ]';
  wk(1:2*n+1) = [ ...
    0.104656226026467265194, ...
    0.268488089868333440729, ...
    0.401397414775962222905, ...
    0.450916538658474142345, ...
    0.401397414775962222905, ...
    0.268488089868333440729, ...
    0.104656226026467265194 ]';
  xg(1:n) = [ ...
   -0.77459666924148337704, ...
    0.0, ...
    0.77459666924148337704 ]';
  xk(1:2*n+1) = [ ...
   -0.96049126870802028342, ...
   -0.77459666924148337704, ...
   -0.43424374934680255800, ...
    0.0, ...
    0.43424374934680255800, ...
    0.77459666924148337704, ...
    0.96049126870802028342 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'KRONROD_TEST01\n' );
  fprintf ( 1, '  Request KRONROD to compute the Gauss rule\n' );
  fprintf ( 1, '  of order 3, and the Kronrod extension of\n' );
  fprintf ( 1, '  order 3+4=7.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compare to exact data.\n' );

  tol = 0.000001;

  [ x, w1, w2 ] = kronrod ( n, tol );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  KRONROD returns 3 vectors of length %d\n', n + 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I      X               WK              WG\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n + 1
    fprintf ( 1, '  %4d  %14f  %14f  %14f\n', i, x(i), w1(i), w2(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '               Gauss Abscissas\n' );
  fprintf ( 1, '            Exact           Computed\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    if ( 2 * i <= n + 1 )
      i2 = 2 * i;
      s = -1.0;
    else
      i2 = 2 * ( n + 1 ) - 2 * i;
      s = +1.0;
    end
    fprintf ( 1, '  %4d  %14f  %14f\n', i, xg(i), s * x(i2) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '               Gauss Weights\n' );
  fprintf ( 1, '            Exact           Computed\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    if ( 2 * i <= n + 1 )
      i2 = 2 * i;
    else
      i2 = 2 * ( n + 1 ) - 2 * i;
    end
    fprintf ( 1, '  %4d  %14f  %14f\n', i, wg(i), w2(i2) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '             Gauss Kronrod Abscissas\n' );
  fprintf ( 1, '            Exact           Computed\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 2 * n + 1
    if ( i <= n + 1 )
      i2 = i;
      s = -1.0;
    else
      i2 = 2 * ( n + 1 ) - i;
      s = +1.0;
    end
    fprintf ( 1, '  %4d  %14f  %14f\n', i, xk(i), s * x(i2) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '             Gauss Kronrod Weights\n' );
  fprintf ( 1, '            Exact           Computed\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 2 * n + 1
    if ( i <= n + 1 )
      i2 = i;
    else
      i2 = 2 * ( n + 1 ) - i;
    end
    fprintf ( 1, '  %4d  %14f  %14f\n', i, wk(i), w1(i2) );
  end

  return
end
