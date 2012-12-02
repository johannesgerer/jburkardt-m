function p01_target_test ( option )

%*****************************************************************************80
%
%% P01_TARGET_TEST seeks a target solution for problem 1.
%
%  Discussion:
%
%    We want to compute a solution which has X(3) = 1.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'P01_TARGET_TEST\n' );
  fprintf ( 1, '  Compute a series of solutions for problem 1.\n' );
  fprintf ( 1, '  We are trying to find a solution for which X(3) = 1.0\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The option chosen is %d\n', option );
  fprintf ( 1, '\n' );

  tar_index = 3;
  tar_value = 1.0;
%
%  Get problem size.
%
  nvar = p00_nvar ( problem, option );
%
%  Get starting point.
%
  x2 = p00_start ( problem, option, nvar );
%
%  Get the tangent vector.
%
  tan = p00_tan ( problem, option, nvar, x2 );
%
%  Determine the appropriate continuation index.
%
  par_index = r8vec_amax_index ( nvar, tan );
%
%  Force F(X) = 0.
%
  step = -1;
  fprintf ( 1, '  %d  %f  %f  %f\n', step, x2 );

  [ x2, status ] = p00_newton ( problem, option, nvar, x2, par_index );

  if ( status < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Newton iteration failed on starting point.\n' );
    return
  end

  step = 0;
  fprintf ( 1, '  %d  %f  %f  %f\n', step, x2 );
%
%  Get stepsize.
%
  [ h, hmin, hmax ] = p00_stepsize ( problem, option );
%
%  LOOP:
%
  step_max = 40;

  for step = 1 : step_max

    x1 = x2;
%
%  Compute the tangent vector.
%
    tan = p00_tan ( problem, option, nvar, x1 );
%
%  Use X + H * TAN as a starting estimate for Newton iteration.
%
    h_reduction = 0;

    while ( 1 )

      x2 = x1 + h * tan;

      par_index = 0;
      [ x2, status ] = p00_newton ( problem, option, nvar, x2, par_index );

      if ( 0 <= status )

        if ( h_reduction == 0 )
          if ( status <= 1 )
            h = h * 4.0;
          elseif ( status <= 3 )
            h = h * 2.0;
          end
          if ( hmax < abs ( h ) )
            h = hmax * r8_sign ( h );
          end
        end

        break
      end

      if ( abs ( h ) <= hmin )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'P01_TARGET_TEST:\n' );
        fprintf ( 1, '  Cannot decrease stepsize any more!\n' );
        fprintf ( 1, '  Did not reach target point. \n' ); 
        return
      end

      if ( hmin < abs ( h ) )
        h = h / 2.0;
        if ( abs ( h ) < hmin )
          h = hmin * r8_sign ( h );
        end
        h_reduction = h_reduction + 1;
      end

    end
%
%  Check for the target point.
%
    if ( ( x1(tar_index) - tar_value ) * ( x2(tar_index) - tar_value ) <= 0.0 )
      [ xt, status ] = p00_target ( problem, option, nvar, x1, x2, tar_index, tar_value );
      fprintf ( 1, '  %d  %f  %f  %f\n', step,     xt );
      fprintf ( 1, '  %d  %f  %f  %f\n', step + 1, x2 );
      break
    else
      fprintf ( 1, '  %d  %f  %f  %f\n', step, x2 );
    end

    if ( step == step_max )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P01_TARGET_TEST:\n' );
      fprintf ( 1, '  Did not reach target point. \n' );
      break
    end

  end

  return
end
