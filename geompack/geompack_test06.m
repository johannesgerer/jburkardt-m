function geompack_test06 ( )

%*****************************************************************************80
%
%% TEST06 tests TRIANGLE_CIRCUMCENTER_2D;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  ndim = 2;
  ntest = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  For a triangle in 2D:\n' );
  fprintf ( 1, '  TRIANGLE_CIRCUMCENTER_2D computes the circumcenter.\n' );

  for i = 1 : ntest

    if ( i == 1 )
      t = [ ...
        0.0, 0.0; ...
        1.0, 0.0; ...
        0.0, 1.0 ]';
%
%  May I just complain that I have replaced
%  sqrt ( 3 ) / 2 by the approximate value
%  0.86602540 because MATLAB complained that
%  sqrt did not have the right number of arguments!?
%
    elseif ( i == 2 )
      t = [ ...
        0.0, 0.0; ...
        1.0, 0.0; ...
        0.5, 0.86602540 ]';
    elseif ( i == 3 )
      t = [ ...
        0.0,  0.0; ...
        1.0,  0.0; ...
        0.5, 10.0 ]';
    elseif ( i == 4 )
      t = [ ...
         0.0, 0.0; ...
         1.0, 0.0; ...
        10.0, 2.0 ]';
    end

    r8mat_transpose_print ( ndim, 3, t, '  The triangle vertices:' );

    center = triangle_circumcenter_2d ( t );

    r8vec_print ( ndim, center, '  The circumcenter' );

  end

  return
end
