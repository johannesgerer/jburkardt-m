function tetrahedron_slice_animate ( normal, t, n )

%*****************************************************************************80
%
%% TETRAHEDRON_SLICE_ANIMATE animates "slices" of a tetrahedron.
%
%  Discussion:
%
%    Given a vector NORMAL and a tetrahedron T, the program determines
%    a sequence of N equally-spaced planes which intersect the tetrahedron,
%    and displays a sequence of corresponding images.
%
%    If an internal switch CREATE_FRAMES is set to 1, then each image
%    will be saved as a JPG file, so that a movie can be created.
%
%    The intersection of a plane and a tetrahedron is one of:
%    0) empty
%    1) a single point
%    2) a single line segment
%    3) a triangle
%    4) a quadrilateral.
%
%    In each case, the region of intersection can be described by the
%    corresponding number of points.  In particular, cases 2, 3 and 4
%    are described by the vertices that bound the line segment, triangle,
%    or quadrilateral.
%
%    The normal form of a plane is:
%
%      PP is a point on the plane,
%      N is a normal vector to the plane.
%
%    The form of a tetrahedron is
%
%      T(1:3,1:4) contains the coordinates of the vertices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 July 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real NORMAL(3), a normal vector to the plane.
%
%    Input, real T(3,4), the tetrahedron vertices.
%
%    Input, integer N, the number of slices.
%

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_SLICE_ANIMATE:\n' );
  fprintf ( 1, '  Animate the slicing of a tetrahedron.\n' );

  create_files = 1;
  if ( create_files )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  A sequence of JPG files will be created as well.\n' );
  end
%
%  Make sure normal vector has unit length.
%
  normal(1:3) = normal(1:3) / norm ( normal(1:3) );
%
%  Determine the range of points PP that, with NORMAL, will define
%  a plane that intersects the triangle.
%
  d_min = + Inf;
  d_max = - Inf;
  j_min = - 1;
  j_max = - 1;

  for j = 1 : 4
    d = normal(1:3)' * t(1:3,j);
    if ( d < d_min )
      j_min = j;
      d_min = d;
    end
    if ( d_max < d )
      j_max = j;
      d_max = d;
    end
  end
%
%  Draw the slices.
%
  for slice = 1 : n

    pp(1:3) = ( ( n - slice + 1 ) * d_min ...
              + (     slice     ) * d_max ) ...
              / ( n         + 1 ) * normal(1:3);

    tetrahedron_slice_display ( pp, normal, t );

    if ( create_files )
%
%  Create a filename that is unique for this frame.
%
      filename = sprintf ( 'frame%04d.jpg', slice );
%
%  Save the picture as a "frame".
%
      f = getframe;
%
%  Extract the image and color map.
%
      [ image, colormap ] = frame2im ( f );
%
%  Write the image data.
%
      imwrite ( image, filename, 'JPG' )

    end

    pause ( 1 )

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_SLICE_ANIMATE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
