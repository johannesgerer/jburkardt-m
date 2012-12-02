function [ yv, yvp ] = hermite_interpolant_value ( nd, xd, yd, xdp, ydp, nv, ...
  xv )

%*****************************************************************************80
%
%% HERMITE_INTERPOLANT_VALUE evaluates the Hermite interpolant polynomial.
%
%  Discussion:
%
%    In fact, this function will evaluate an arbitrary polynomial that is
%    represented by a difference table.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Carl deBoor,
%    A Practical Guide to Splines,
%    Springer, 2001,
%    ISBN: 0387953663,
%    LC: QA1.A647.v27.
%
%  Parameters:
%
%    Input, integer ND, the order of the difference table.
%
%    Input, real XD(ND), YD(ND), the difference table for the
%    interpolant value.
%
%    Input, real XDP(ND-1), YDP(ND-1), the difference table for
%    the interpolant derivative.
%
%    Input, integer NV, the number of evaluation points.
%
%    Input, real XV(NV), the evaluation points.
%
%    Output, real YV(NV), YVP(NV), the value of the interpolant and
%    its derivative at the evaluation points.
%
  ndp = nd - 1;
%
%  Clearly MATLAB is going to be all prissy about combining
%  vectors and scalars and wants me to use repmat or something
%  nonintuitive if I want to vectorize this loop and I say 
%  it's spinach and to hell with it.
%
  for j = 1 : nv

    yv(j) = yd(nd);
    for i = nd - 1 : -1 : 1
      yv(j) = yd(i) + ( xv(j) - xd(i) ) * yv(j);
    end

    yvp(j) = ydp(ndp);
    for i = ndp - 1 : -1 : 1
      yvp(j) = ydp(i) + ( xv(j) - xdp(i) ) * yvp(j);
    end

  end

  return
end
