function value = pchst ( arg1, arg2 )

%*****************************************************************************80
%
%% PCHST: PCHIP sign-testing routine.
%
%  Discussion:
%
%    This routine essentially computes the sign of ARG1 * ARG2.
%
%    The object is to do this without multiplying ARG1 * ARG2, to avoid
%    possible over/underflow problems.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2005
%
%  Author:
%
%    Original FORTRAN77 version by Fred Fritsch.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Fred Fritsch, Ralph Carlson,
%    Monotone Piecewise Cubic Interpolation,
%    SIAM Journal on Numerical Analysis,
%    Volume 17, Number 2, April 1980, pages 238-246.
%
%  Parameters:
%
%    Input, real ARG1, ARG2, two values to check.
%
%    Output, real VALUE,
%    -1.0, if ARG1 and ARG2 are of opposite sign.
%     0.0, if either argument is zero.
%    +1.0, if ARG1 and ARG2 are of the same sign.
%
  if ( arg1 == 0.0 )
    value = 0.0;
  elseif ( arg1 < 0.0 )
    if ( arg2 < 0.0 )
      value = 1.0;
    elseif ( arg2 == 0.0 )
      value = 0.0;
    elseif ( 0.0 < arg2 )
      value = -1.0;
    end
  elseif ( 0.0 < arg1 )
    if ( arg2 < 0.0 )
      value = -1.0;
    elseif ( arg2 == 0.0 )
      value = 0.0;
    elseif ( 0.0 < arg2 )
      value = 1.0;
    end
  end

  return
end
