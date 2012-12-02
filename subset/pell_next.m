function [ xnp1, ynp1 ] = pell_next ( d, x0, y0, xn, yn )

%*****************************************************************************80
%
%% PELL_NEXT returns the next solution of Pell's equation.
%
%  Discussion:
%
%    Pell's equation has the form:
%
%      X**2 - D * Y**2 = 1
%
%    where D is a given non-square integer, and X and Y may be assumed
%    to be positive integers.
%
%    To compute X0, Y0, call PELL_BASIC.
%    To compute X1, Y1, call this routine, with XN and YN set to X0 and Y0.
%    To compute further solutions, call again with X0, Y0 and the previous
%    solution.
%
%  Example:
%
%    ------INPUT--------  --OUTPUT--
%
%    D  X0  Y0   XN   YN  XNP1  YNP1
%
%    2   3   2    3    2    17    12
%    2   3   2   17   12    99    70
%    2   3   2   99   70   577   408
%    2   3   2  577  408  3363  2378
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 June 2004
%
%  Author:
%
%   John Burkardt
%
%  Reference:
%
%    Mark Herkommer,
%    Number Theory, A Programmer's Guide,
%    McGraw Hill, 1999, pages 294-307
%
%  Parameters:
%
%    Input, integer D, the coefficient in Pell's equation.
%
%    Input, integer X0, Y0, the fundamental or 0'th solution.
%
%    Input, integer XN, YN, the N-th solution.
%
%    Output, integer XNP1, YNP1, the N+1-th solution.
%
  xnp1 = x0 * xn + d * y0 * yn;
  ynp1 = x0 * yn +     y0 * xn;

  return
end
