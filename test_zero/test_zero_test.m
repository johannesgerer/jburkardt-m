function test_zero_test ( )

%*****************************************************************************80
%
%% TEST_ZERO_TEST tests the TEST_ZERO library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 May 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_ZERO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_ZERO library.\n' );

  fatol = 1.0E-06;
  max_step = 25;
  xatol = 1.0E-06;
  xrtol = 1.0E-06;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Function value tolerance = %g\n', fatol );
  fprintf ( 1, '  Root absolute tolerance =  %g\n', xatol );
  fprintf ( 1, '  Root relative tolerance =  %g\n', xrtol );
  fprintf ( 1, '  Maximum number of steps =  %d\n', max_step );
%
%  Find out how many problems there are
%
  prob_num = p00_prob_num ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of problems available is %d\n', prob_num );

  for prob = 1 : prob_num
%
%  Print the problem title.
%
    title = p00_title ( prob );
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem number %d\n', prob );
    fprintf ( 1, '  "%s"\n', title );
%
%  Get the problem interval.
%
    range = p00_range ( prob );
    xmin = range(1);
    xmax = range(2);
    fprintf ( 1, '  We seek roots between %g and %g\n', xmin, xmax );
%
%  Get the number of roots.
%
    root_num = p00_root_num ( prob );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Number of known roots = %d\n', root_num );
%
%  Get the roots.
%
    if ( 0 < root_num )
      fprintf ( 1, '\n' );
      fprintf ( 1, '     I          X          F(X)\n' );
      fprintf ( 1, '\n' );
      for i = 1 : root_num
        x = p00_root ( prob, i );
        fx = p00_fx ( prob, x );
        fprintf ( 1, '  %4d  %14g  %14g\n', i, x, fx );
      end
    end
%
%  Get the number of starting points.
%
    start_num = p00_start_num ( prob );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Number of starting points = %d\n', start_num );
%
%  Get the starting points.
%
    fprintf ( 1, '\n' );
    fprintf ( 1, '     I          X          F(X)\n' );
    fprintf ( 1, '\n' );
    for i = 1 : start_num
      x = p00_start ( prob, i );
      fx = p00_fx ( prob, x );
      fprintf ( 1, '  %4d  %14g  %14g\n', i, x, fx );
    end
%
%  Bisection.
%
    xa = p00_start ( prob, 1 );
    fxa = p00_fx ( prob, xa );

    for i = 2 : start_num
      xb = p00_start ( prob, i );
      fxb = p00_fx ( prob, xb );

      if ( r8_sign ( fxa ) ~= r8_sign ( fxb ) )
         [ xa, xb, fxa, fxb ] = bisection ( fatol, max_step, prob, xatol, ...
           xa, xb, fxa, fxb );
         break;
      end
    end
%
%  Brent's method.
%
    xa = p00_start ( prob, 1 );
    fxa = p00_fx ( prob, xa );

    for i = 2 : start_num
      xb = p00_start ( prob, i );
      fxb = p00_fx ( prob, xb );

      if ( r8_sign ( fxa ) ~= r8_sign ( fxb ) )
         [ xa, xb, fxa, fxb ] = brent ( fatol, max_step, prob, xatol, ...
           xrtol, xa, xb, fxa, fxb );
         break;
      end
    end
%
%  Muller's method.
%
    if ( 3 <= start_num )

      xa = p00_start ( prob, 1 );
      fxa = p00_fx ( prob, xa );
      xb = p00_start ( prob, 2 );
      fxb = p00_fx ( prob, xb );
      xc = p00_start ( prob, 3 );
      fxc = p00_fx ( prob, xc );

      [ xa, xb, xc, fxa, fxb, fxc ] = muller ( fatol, max_step, prob, xatol, ...
        xrtol, xa, xb, xc, fxa, fxb, fxc );

    end
%
%  Newton's method.
%
    for i = 1 : start_num

      xa = p00_start ( prob, i );
      fxa = p00_fx ( prob, xa );

      [ xa, fxa ] = newton ( fatol, max_step, prob, xatol, xmin, xmax, ...
        xa, fxa );

    end
%
%  Regula Falsi.
%
    xa = p00_start ( prob, 1 );
    fxa = p00_fx ( prob, xa );

    for i = 2 : start_num
      xb = p00_start ( prob, i );
      fxb = p00_fx ( prob, xb );

      if ( r8_sign ( fxa ) ~= r8_sign ( fxb ) )
         [ xa, xb, fxa, fxb ] = regula_falsi ( fatol, max_step, prob, xatol, ...
           xa, xb, fxa, fxb );
         break;
      end
    end
%
%  Secant.
%
    for i = 1 : start_num - 1

      xa = p00_start ( prob, i );
      fxa = p00_fx ( prob, xa );

      xb = p00_start ( prob, i + 1 );
      fxb = p00_fx ( prob, xb );

      [ xa, xb, fxa, fxb ] = secant ( fatol, max_step, prob, xatol, ...
         xmin, xmax, xa, xb, fxa, fxb );

    end

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_ZERO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
