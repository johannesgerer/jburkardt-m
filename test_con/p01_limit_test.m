function p01_limit_test ( option )

%*****************************************************************************80
%
%% P01_LIMIT_TEST seeks limit points for problem 1.
%
%  Discussion:
%
%    We want to find points X such that TAN(LIM) = 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Ferdinand Freudenstein, Bernhard Roth,
%    Numerical Solutions of Nonlinear Equations,
%    Journal of the Association for Computing Machinery,
%    Volume 10, 1963, Pages 550-556.
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%    1, target point search, starting point is (15,-2,0);
%    2, limit points in X(1), starting point is (15,-2,0);
%    3, limit points in X(3), starting point is (15,-2,0);
%    4, target point search, starting point is (4,3,0);
%    5, limit points in X(1), starting point is (4,3,0);
%    6, limit points in X(3), starting point is (4,3,0).
%
  problem = 1;

  if ( option == 2 )
    lim = 1;
  elseif ( option == 3 )
    lim = 3;
  elseif ( option == 5 )
    lim = 1;
  elseif ( option == 6 )
    lim = 3;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P01_LIMIT_TEST\n' );
    fprintf ( 1, '  Unexpected value of OPTION = %d\n', option );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'P01_LIMIT_TEST\n' );
  fprintf ( 1, '  Compute a series of solutions for problem 1.\n' );
  fprintf ( 1, '  We are trying to find limit points X such that\n' );
  fprintf ( 1, '  TAN(%d) = 0.\n', lim );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The option chosen is %d\n', option );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         #    Tan(LIM)           X(1)           X(2)            X(3)\n' );
  fprintf ( 1, '\n' );
%
%  Get problem size.
%
  nvar = p00_nvar ( problem, option );

  lim_num = 0;
%
%  Get starting point.
%
  x2 = p00_start ( problem, option, nvar );
%
%  Get the tangent vector.
%
  tan2 = p00_tan ( problem, option, nvar, x2 );
%
%  Determine the appropriate continuation index.
%
  par_index = r8vec_amax_index ( nvar, tan2 );
%
%  Force F(X) = 0.
%
  step = -1;
  fprintf ( 1, '  %8d  %14e  %14f  %14f  %14f\n', step, tan2(lim), x2(1:nvar) );

  [ x2, status ] = p00_newton ( problem, option, nvar, x2, par_index );

  if ( status < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Newton iteration failed on starting point.\n' );
    return
  end

  tan2 = p00_tan ( problem, option, nvar, x2 );

  step = 0;
  fprintf ( 1, '  %8d  %14e  %14f  %14f  %14f\n', step, tan2(lim), x2(1:nvar) );
%
%  Get stepsize.
%
  [ h, hmin, hmax ] = p00_stepsize ( problem, option );
%
%  LOOP:
%
  step_max = 40;

  for step = 1 : step_max
%
%  Save old data as X1, TAN1.
%
    x1 = x2;
    tan1 = tan2;

    h_reduction = 0;
%
%  Use X1 + H * TAN1 as a starting estimate for Newton iteration.
%
    while ( 1 )

      if ( hmax < abs ( h ) )
        h = hmax * r8_sign ( h );
      end

      if ( abs ( h ) < hmin )
        h = hmin * r8_sign ( h );
      end

      x2 = x1 + h * tan1;

      par_index = 0;
      [ x2, status ] = p00_newton ( problem, option, nvar, x2, par_index );
%
%  If we didn't get it, can we try again?
%
      if ( status < 0 )

        if ( abs ( h ) <= hmin )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'P01_LIMIT_TEST:\n' );
          fprintf ( 1, '  Cannot decrease stepsize any more.\n' );
          fprintf ( 1, '  Search must terminate.\n' );
          return
        else
          h = h / 4.0;
          h_reduction = h_reduction + 1;
        end
%
%  We computed the point.
%  Should we change the stepsize?
%
      else

        if ( h_reduction == 0 )

          if ( status <= 1 )
            h = h * 4.0;
          elseif ( status <= 3 )
            h = h * 2.0;
          elseif ( 12 <= status )
            h = h / 4.0;
          elseif ( 8 <= status )
            h = h / 2.0;
          end

        end

        break

      end

    end
%
%  Compute the tangent vector.
%
    tan2 = p00_tan ( problem, option, nvar, x2 );
%
%  Check for a limit point.
%
    if ( tan1(lim) * tan2(lim) <= 0.0 )
      [ x, tan, status ] = p00_limit ( problem, option, nvar, x1, tan1, x2, tan2, lim );
      fprintf ( 1, '  (limit)   %14e  %14f  %14f  %14f\n', tan(lim), x(1:nvar) );
      lim_num = lim_num + 1;
    end

    fprintf ( 1, '  %8d  %14e  %14f  %14f  %14f\n', step, tan2(lim), x2(1:nvar) );

    if ( step == step_max )
      break
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of limit points found was %d\n', lim_num );

  return
end
