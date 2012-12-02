function yv = piecewise_linear ( nd, xd, yd, nv, xv )

%*****************************************************************************80
%
%% PIECEWISE_LINEAR evaluates a piecewise linear spline.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ND, the number of data points.
%
%    Input, real XD(ND), YD(ND), the data values.
%
%    Input, integer NV, the number of evaluation points.
%
%    Input, real XV(NV), the evaluation arguments.
%
%    Output, real YV(NV), the values.
%
  yv = zeros ( nv );

  for iv = 1 : nv

    if ( xv(iv) < xd(1) )
      yv(iv) = yd(1);
    elseif ( xd(nd) < xv(iv) )
      yv(iv) = yd(nd);
    else

      for id = 2 : nd
        if ( xv(iv) < xd(id) )
          yv(iv) = ( ( xd(id) - xv(iv)            ) * yd(id-1) ...
                   + (          xv(iv) - xd(id-1) ) * yd(id) ) ...
                   / ( xd(id)          - xd(id-1) );
          break
        end
      end

    end

  end

  return
end
