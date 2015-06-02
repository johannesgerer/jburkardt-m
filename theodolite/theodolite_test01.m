function theodolite_test01 ( )

%*****************************************************************************80
%
%% THEODOLITE_TEST01 tests THEODOLITE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'THEODOLITE_TEST01\n' );
  fprintf ( 1, '  Estimate the XYZ coordinates of an event in the sky\n' );
  fprintf ( 1, '  observed by 10 scattered stations.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Seek a position XYZ which minimizes the sum of squares\n' );
  fprintf ( 1, '  of the distance of the event to each of the lines defined\n' );
  fprintf ( 1, '  by an observer''s data.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  MATLAB''s lsqnonlin() function is used.\n' );

  n = 10;
%
%  Our initial guess is simply the average of the observer locations.
%
  xyz_star = [ 1245.0, 759.0, 103.5 ]';

  f = theodolite_f ( xyz_star );
  f_norm = norm ( f );
  r8vec_transpose_print ( 3, xyz_star, '  Initial XYZ:' );
  r8vec_transpose_print ( n, f, '  Initial F:' );
  fprintf ( 1, '  Initial ||F|| = %g\n', f_norm );

  xyz_star = lsqnonlin ( @theodolite_f, xyz_star );
  f = theodolite_f ( xyz_star );
  f_norm = norm ( f );
  r8vec_transpose_print ( 3, xyz_star, '  Final XYZ:' );
  r8vec_transpose_print ( n, f, '  Final F:' );
  fprintf ( 1, '  Final ||F|| = %g\n', f_norm );

  return
end
