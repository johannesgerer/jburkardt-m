function nbool = quaeinside ( iitype, xsout, ysout )

%*****************************************************************************80
%
%% QUAEINSIDE checks whether a point is inside a triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    27 June 2014
%
%  Author:
%
%    Original FORTRAN77 version by Hong Xiao, Zydrunas Gimbutas.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Hong Xiao, Zydrunas Gimbutas,
%    A numerical algorithm for the construction of efficient quadrature
%    rules in two and higher dimensions,
%    Computers and Mathematics with Applications,
%    Volume 59, 2010, pages 663-676.
%
%  Parameters:
%
%    Input, integer IITYPE, indicates the check to perform.
%    * 0 check whether the point is inside the whole triangle
%    * 1 check whether the point is inside the bottom 1/3 of the triangle
%    * 2 check whether the point is inside the lower-left 1/6 of the triangle
%
%    Input, real XSOUT, YSOUT, the coordinates of the point.
%
%    Output, integer NBOOL.
%    * 1, the point is inside.
%    * 2, the point is outside.
%
  s = sqrt ( 3.0 );
%
%  The 1/6 of triangle.
%
  if ( iitype == 2 )

    nbool = 1;

    if ( xsout < -1.0 | 0.0 < xsout )
      nbool = 0;
    end
%
%  hx
%
    if ( ysout < -1.0 / s - 1.0E-30 | xsout / s < ysout )
      nbool = 0;
    end
%
%  The 1/3 of triangle.
%
  elseif ( iitype == 1 )

    nbool = 0;

    if ( xsout <= 0.0 & -1.0 <= xsout & ...
         -1.0 / s <= ysout & ysout <= xsout / s )
      nbool = 1;
    end

    if ( iitype == 1 )

      if  ( 0.0 <= xsout & xsout <= 1.0 & ...
            -1.0 / s <= ysout & ysout <= - xsout / s )
        nbool = 1;
      end

    end
%
%  The entire triangle.
%
  elseif ( iitype == 0 )

    nbool = 1;

    if ( ysout < -1.0 / s )
      nbool = 0;
    end

    if ( s * xsout + 2.0 / s < ysout )
      nbool = 0;
    end

    if ( - s * xsout + 2.0 / s < ysout )
      nbool = 0;
    end

  end

  return
end
