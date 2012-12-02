function [ ierror, ncor3, nline, cor3, lines ] = plane_exp_grid_3d ( p1, p2, p3, ...
  ncor3, nline, cor3, lines, maxcor3, maxline )

%*****************************************************************************80
%
%% PLANE_EXP_GRID_3D computes points and lines making up a planar grid in 3D.
%
%  Discussion:
%
%    The explicit form of a plane in 3D is:
%
%      the plane through P1, P2 and P3.
%
%    The data format used is that of SGI Inventor.
%
%    On input, if NCOR3 is zero (or negative), then the data computed by 
%    this routine will be stored normally in COR3.  But if NCOR3 is 
%    positive, it is assumed that COR3 already contains NCOR3 items
%    of useful data.  The new data is appended to COR3.  On output, NCOR3 
%    is increased by the number of points computed by this routine.
%
%    On input, if NLINE is zero (or negative), then the data computed by 
%    this routine will be stored normally in LINES.  But if NLINE is positive, 
%    it is assumed that LINES already contains some useful data.  The
%    new data is appended to LINES.  On output, NLINE is increased by the 
%    number of lines computed by this routine.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(3), P2(3), P3(3), three points on the plane.
%
%    Input, integer NCOR3, the number of points stored in COR3.
%
%    Input, integer NLINE, the number of line data items.
%
%    Input, real COR3(3,MAXCOR3), the grid points.
%
%    Input, integer LINES(MAXLINE), the indices of points used in
%    the lines of the grid.  Successive entries of LINES are joined
%    by a line, unless an entry equals -1.  Note that indices begin
%    with 0.
%
%    Input, integer MAXCOR3, the maximum number of points that can be
%    stored.
%
%    Input, integer MAXLINE, the maximum number of line items that can
%    be stored.
%
%    Output, integer IERROR, error indicator.
%    0, no error.
%    1, more space for point coordinates is needed.
%    2, more space for line data is needed.
%
%    Output, integer NCOR3, the number of points stored in COR3.
%
%    Output, integer NLINE, the number of line data items.
%
%    Output, real COR3(3,MAXCOR3), the grid points.
%
%    Output, integer LINES(MAXLINE), the indices of points used in
%    the lines of the grid.  Successive entries of LINES are joined
%    by a line, unless an entry equals -1.  Note that indices begin
%    with 0.
%
  dim_num = 3;
  nx = 5;
  ny = 5;

  ierror = 0;

  if ( ncor3 <= 0 )
    ncor3 = 0;
  end

  if ( nline <= 0 )
    nline = 0;
  end

  nbase = ncor3;
%
%  Compute the two basis vectors for the affine plane.
%
  v1(1:dim_num) = p2(1:dim_num) - p1(1:dim_num);

  v1 = vector_unit_nd ( dim_num, v1 );

  v2(1:dim_num) = p3(1:dim_num) - p1(1:dim_num);

  dot = v1(1:dim_num) * v2(1:dim_num)';
%
%  Remove the component of V1 from V2, and give the
%  resulting vector unit norm.  V1 and V2 are now orthogonal
%  and of unit length, and represent the two direction vectors
%  of our plane.
%
  v2(1:dim_num) = v2(1:dim_num) - dot * v1(1:dim_num);

  v2 = vector_unit_nd ( dim_num, v2 );
%
%  Compute the (V1,V2) coordinate range of the input data, if any.
%
  if ( ncor3 == 0 )

    amin = 0.0;
    amax = 1.0;
    bmin = 0.0;
    bmax = 1.0;

  else

    for i = 1 : ncor3

      a = v1(1:dim_num) * cor3(1:dim_num,i);
      b = v2(1:dim_num) * cor3(1:dim_num,i);

      if ( i == 1 )
        amin = a;
        amax = a;
        bmin = b;
        bmax = b;
      else
        amin = min ( amin, a );
        amax = max ( amax, a );
        bmin = min ( bmin, b );
        bmax = max ( bmax, b );
      end

    end

  end
%
%  Generate the points we will use.
%
  if ( maxcor3 < ncor3 + nx * ny )
    ierror = 1;
    return
  end

  for j = 1 : ny

    b = ( ( ny - j     ) * bmin ...
        + (      j - 1 ) * bmax ) ...
        / ( ny     - 1 );

    for i = 1 : nx

      a = ( ( nx - i     ) * amin ...
          + (      i - 1 ) * amax ) ...
          / ( nx     - 1 );

      ncor3 = ncor3 + 1;
      cor3(1:dim_num,ncor3) = a * v1(1:dim_num) + b * v2(1:dim_num);

    end

  end
%
%  Do the "horizontals".
%
  for i = 1 : nx

    for j = 1 : ny

      if ( maxline <= nline )
        ierror = 2;
        return
      end

      nline = nline + 1;
      lines(nline) = nbase + ( j - 1 ) * nx + i;

    end

    if ( maxline <= nline )
      ierror = 2;
      return
    end

    nline = nline + 1;
    lines(nline) = 0;

  end
%
%  Do the "verticals".
%
  for j = 1 : ny

    for i = 1 : nx

      if ( maxline <= nline )
        ierror = 2;
        return
      end

      nline = nline + 1;
      lines(nline) = nbase + ( j - 1 ) * nx + i;

    end

    if ( maxline <= nline )
      ierror = 2;
      return
    end

    nline = nline + 1;
    lines(nline) = 0;

  end

  return
end
