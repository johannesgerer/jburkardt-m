function value = diaedg ( x0, y0, x1, y1, x2, y2, x3, y3 )

%*****************************************************************************80
%
%% DIAEDG chooses a diagonal edge.
%
%  Discussion:
%
%    The routine determines whether 0--2 or 1--3 is the diagonal edge
%    that should be chosen, based on the circumcircle criterion, where
%    (X0,Y0), (X1,Y1), (X2,Y2), (X3,Y3) are the vertices of a simple
%    quadrilateral in counterclockwise order.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2005
%
%  Author:
%
%    Original FORTRAN77 version by Barry Joe,
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Barry Joe,
%    GEOMPACK - a software package for the generation of meshes
%    using geometric algorithms,
%    Advances in Engineering Software,
%    Volume 13, pages 325-331, 1991.
%
%  Parameters:
%
%    Input, real X0, Y0, X1, Y1, X2, Y2, X3, Y3, the
%    coordinates of the vertices of a quadrilateral, given in
%    counter clockwise order.
%
%    Output, integer VALUE, chooses a diagonal:
%    +1, if diagonal edge 02 is chosen;
%    -1, if diagonal edge 13 is chosen;
%     0, if the four vertices are cocircular.
%
  tol = 100.0 * r8_epsilon ( );

  dx10 = x1 - x0;
  dy10 = y1 - y0;
  dx12 = x1 - x2;
  dy12 = y1 - y2;
  dx30 = x3 - x0;
  dy30 = y3 - y0;
  dx32 = x3 - x2;
  dy32 = y3 - y2;

  tola = tol * max ( abs ( dx10 ), ...
               max ( abs ( dy10 ), ...
               max ( abs ( dx30 ), abs ( dy30 ) )));
           
  tolb = tol * max ( abs ( dx12 ), ...
               max ( abs ( dy12 ), ...
               max ( abs ( dx32 ), abs ( dy32 ) )));

  ca = dx10 * dx30 + dy10 * dy30;
  cb = dx12 * dx32 + dy12 * dy32;

  if ( tola < ca & tolb < cb )

    value = -1;

  elseif ( ca < -tola & cb < -tolb )

    value = 1;

  else

    tola = max ( tola, tolb );
    s = ( dx10 * dy30 - dx30 * dy10 ) * cb ...
      + ( dx32 * dy12 - dx12 * dy32 ) * ca;

    if ( tola < s )
      value = -1;
    elseif ( s < -tola )
      value = 1;
    else
      value = 0;
    end

  end

  return
end
