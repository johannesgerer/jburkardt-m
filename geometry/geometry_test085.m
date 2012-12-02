function geometry_test085 ()

%*****************************************************************************80
%
%% TEST085 tests PLANE_EXP_PRO3.
%
%  Discussion:
%
%    Projection is ( -1, 1, 1 ).
%    Projection is ( 4, 5, -8 ).
%    Projection is ( 0.33, 0.33, 0.33).
%    Projection is ( 5.33, -1.66, -2.66 ).
%    Projection is ( -1, 1, 1 ).
% 
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;
  ntest = 5;

  p1 = [ 1.0, 0.0, 0.0 ];
  p2 = [ 0.0, 1.0, 0.0 ];
  p3 = [ 0.0, 0.0, 1.0 ];
  po = [ ...
    0.0,  2.0,  2.0;  ...
    4.0,  5.0, -8.0;  ...
    0.25, 0.25, 0.25; ...
    5.0, -2.0, -3.0;  ...
   -2.0,  0.0,  0.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST085\n' );
  fprintf ( 1, '  PLANE_EXP_PRO3 projects an object point\n' );
  fprintf ( 1, '    orthographically into a plane.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '            PO                PP\n' );
  fprintf ( 1, '\n' );

  pp = plane_exp_pro3 ( p1, p2, p3, ntest, po );
 
  for i = 1 : ntest
    fprintf ( 1, '  %10f  %10f  %10f  %10f  %10f  %10f\n', ...
      po(1:dim_num,i), pp(1:dim_num,i) );
  end
 
  return
end
