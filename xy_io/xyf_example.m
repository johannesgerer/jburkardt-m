function [ xy, face_pointer, face_data ] = xyf_example ( point_num, ...
  face_num, face_data_num )

%*****************************************************************************80
%
%% XYF_EXAMPLE sets data suitable for a pair of XY and XYF files.
%
%  Discussion:
%
%    There are 65 points.
%    There are 48 faces.
%    There are 48*4=192 face items.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, integer FACE_DATA_NUM, the number of face items.
%
%    Output, real XY(2,POINT_NUM), the point coordinates.
%
%    Output, integer FACE_POINTER(FACE_NUM+1), pointers to the
%    first face item for each face.
%
%    Output, integer FACE_DATA(FACE_DATA_NUM), indices
%    of points that form faces.
%
  n_t = 13;
  n_r = 5;
  r_min = 1.0;
  r_max = 3.0;
  t_min = pi;
  t_max = 0.0;

  xy = zeros ( 2, point_num );

  k = 0;
  for j = 1 : n_r

    r = ( ( n_r - j     ) * r_min ...
        + (       j - 1 ) * r_max ) ...
        / ( n_r     - 1 );

    for i = 1 : n_t

      t = ( ( n_t - i     ) * t_min ...
          + (       i - 1 ) * t_max ) ...
          / ( n_t     - 1 );

      k = k + 1;
      xy(1,k) = r * cos ( t );
      xy(2,k) = r * sin ( t );

    end
  end

  face_pointer = zeros(face_num+1);
  face_data = zeros(face_data_num);

  face = 0;
  k = 0;

  for j = 1 : n_r - 1
    for i = 1 : n_t - 1

      face = face + 1;
      face_pointer(face) = k + 1;

      k = k + 1;
      face_data(k) = i     + ( j - 1 ) * n_t;
      k = k + 1;
      face_data(k) = i + 1 + ( j - 1 ) * n_t;
      k = k + 1;
      face_data(k) = i + 1 + ( j     ) * n_t;
      k = k + 1;
      face_data(k) = i     + ( j     ) * n_t;

    end
  end

  face = face + 1;
  face_pointer(face) = k + 1;

  return
end
