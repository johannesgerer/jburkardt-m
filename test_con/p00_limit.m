function [ x, tan, status ] = p00_limit ( problem, option, nvar, x1, tan1, ...
  x2, tan2, lim )

%*****************************************************************************80
%
%% P00_LIMIT seeks a limit point.
%
%  Discussion:
%
%    For a given index 1 <= LIM <= NVAR, a limit point X is a point which
%    satisfies F(X) = 0 and TAN(X)(LIM) = 0, that is, X is a point on the
%    solution curve, and the LIM-th component of the tangent vector at X
%    is zero.
%
%    This function may be called if a limit point has been bracketed,
%    that is, if X1 and X2 are points on the curve with the property that
%    there is a change in sign in the LIM-th component of the tangent
%    vector between X1 and X2.
%
%    The function carries out an iteration seeking a point X between
%    X1 and X2 for which the LIM-th tangent component is zero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real X1(NVAR), TAN1(NVAR), a point on the curve,
%    and its tangent vector.
%
%    Input, real X2(NVAR), TAN2(NVAR), a second point on the curve,
%    and its tangent vector.
%
%    Input, integer LIM, the index of the entry of TAN which
%    we are seeking to zero.
%
%    Output, real X(NVAR), TAN(NVAR), the computed limit point
%    and its tangent vector.
%
%    Output, integer STATUS.
%    nonnegative, the limit point was computed in STATUS steps.
%    negative, the limit point could not be computed.
%
  VERBOSE = 0;
%
%  Use a fixed parameter index, but do NOT use LIM.
%
  x = x2 - x1;
  x(lim) = 0.0;
  par_index = r8vec_amax_index ( nvar, x );
%
%  Start the zero finding process.
%
  a = 0.0;
  b = 1.0;
  tol = sqrt ( eps );
  arg = 0.0;
  status_zero = 0;
  value = 0.0;

  status = 0;

  while ( 1 )

    [ arg, status_zero ] = zero_rc ( a, b, tol, value, status_zero );

    if ( status_zero < 0 )
      status = -1;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'P00_LIMIT - Fatal error!\n' );
      fprintf ( 1, '  ZERO_RC returned an error flag.\n' );
      break
    end

    if ( arg == 0.0 )

      x = x1;
      tan = tan1;

    elseif ( arg == 1.0 )

      x = x2;
      tan = tan2;

    else

      x = ( 1.0 - arg ) * x1 ...
          +       arg   * x2;

      [ x, status_newton ] = p00_newton ( problem, option, nvar, x, par_index );

      if ( status_newton < 0 )
        status = -2;
        fprintf ( 1, '\n' );
        fprintf ( 1, 'P00_LIMIT - Fatal error!\n' );
        fprintf ( 1, '  ZERO_RC returned an error flag.\n' );
        break
      end

      tan = p00_tan ( problem, option, nvar, x );

    end

    value = tan(lim);

    if ( VERBOSE )
      fprintf ( 1, '  %8d  %14e  %14e\n', status_zero, arg, value );
    end

    status = status + 1;

    if ( status_zero == 0 )
      break
    end

  end

  return
end
