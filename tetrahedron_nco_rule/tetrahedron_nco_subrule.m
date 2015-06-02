function [ suborder_xyz, suborder_w ] = tetrahedron_nco_subrule ( rule, suborder_num )

%*****************************************************************************80
%
%% TETRAHEDRON_NCO_SUBRULE returns a compressed NCO rule.
%
%  Discussion:
%
%    In order for these compressed rules to be "unwrapped" correctly,
%    it's necessary that the values in SUBORDER_XYZ_N be listed
%    in a particular order for each kind of symmetry.  Basically,
%    the repeated equal values must come first.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Peter Silvester,
%    Symmetric Quadrature Formulae for Simplexes,
%    Mathematics of Computation,
%    Volume 24, Number 109, January 1970, pages 95-100.
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%
%    Input, integer SUBORDER_NUM, the number of suborders of the rule.
%
%    Output, real SUBORDER_XYZ(3,SUBORDER_NUM),
%    the barycentric coordinates of the abscissas.
%
%    Output, real SUBORDER_W(SUBORDER_NUM), the suborder weights.
%
  if ( rule == 1 )

    suborder_xyz_n(1:4,1:suborder_num) = [ ...
      0, 0, 0, 0 ]';

    suborder_xyz_d = 0;

    suborder_w_n(1:suborder_num) = [ 1 ];

    suborder_w_d = 1;

  elseif ( rule == 2 )

    suborder_xyz_n(1:4,1:suborder_num) = [ ...
      0, 0, 0, 1 ]';

    suborder_xyz_d = 1;

    suborder_w_n(1:suborder_num) = [ 1 ];

    suborder_w_d = 4;

  elseif ( rule == 3 )

    suborder_xyz_n(1:4,1:suborder_num) = [ ...
      0, 0, 0, 2; ...
      1, 1, 0, 0 ]';

    suborder_xyz_d = 2;

    suborder_w_n(1:suborder_num) = [ 11, -4 ];

     suborder_w_d = 20;

  elseif ( rule == 4 )

    suborder_xyz_n(1:4,1:suborder_num) = [ ...
      0, 0, 0, 3; ...
      0, 0, 1, 2; ...
      1, 1, 1, 0 ]';

    suborder_xyz_d = 3;

    suborder_w_n(1:suborder_num) = [ 20, 13, -29 ];

     suborder_w_d = 120;

  elseif ( rule == 5 )

    suborder_xyz_n(1:4,1:suborder_num) = [ ...
      0, 0, 0, 4; ...
      0, 0, 3, 1; ...
      2, 2, 0, 0; ...
      1, 1, 0, 2; ...
      1, 1, 1, 1 ]';

    suborder_xyz_d = 4;

    suborder_w_n(1:suborder_num) = [ 79, -68, 142, -12, 2 ];

     suborder_w_d = 210;

  elseif ( rule == 6 )

    suborder_xyz_n(1:4,1:suborder_num) = [ ...
      0, 0, 0, 5; ...
      0, 0, 4, 1; ...
      0, 0, 3, 2; ...
      1, 1, 0, 3; ...
      2, 2, 1, 0; ...
      1, 1, 1, 2  ]';

    suborder_xyz_d = 5;

    suborder_w_n(1:suborder_num) = [ 277, 97, 223, -713, 505, -53 ];

    suborder_w_d = 2240;

  elseif ( rule == 7 )

    suborder_xyz_n(1:4,1:suborder_num) = [ ...
      0, 0, 0, 6; ...
      0, 0, 5, 1; ...
      0, 0, 4, 2; ...
      1, 1, 0, 4; ...
      3, 3, 0, 0; ...
      3, 2, 1, 0; ...
      1, 1, 1, 3; ...
      2, 2, 2, 0; ...
      2, 2, 1, 1 ]';

    suborder_xyz_d = 6;

    suborder_w_n(1:suborder_num) = [ ...
      430, -587, 1327, 187, -1298, -398, 22, 1537, -38 ];

    suborder_w_d = 1512;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TETRAHEDRON_NCO_SUBRULE - Fatal error!\n' );
    fprintf ( 1, '  Illegal RULE = %d\n', rule );
    error ( 'TETRAHEDRON_NCO_SUBRULE - Fatal error!' )

  end

  suborder_xyz(1:4,1:suborder_num) = ...
    ( 1 + suborder_xyz_n(1:4,1:suborder_num) ) / ( 4 + suborder_xyz_d );

  suborder_w(1:suborder_num) = ...
    suborder_w_n(1:suborder_num) / suborder_w_d;

  return
end

