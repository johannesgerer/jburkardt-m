function [ suborder_xyz, suborder_w ] = tetrahedron_ncc_subrule ( rule, suborder_num )

%*****************************************************************************80
%
%% TETRAHEDRON_NCC_SUBRULE returns a compressed NCC rule.
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
%    30 January 2007
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
      1,  1, 1, 1 ]';

    suborder_xyz_d = 4;

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

    suborder_w_n(1:suborder_num) = [ -1, 4 ];

     suborder_w_d = 20;

  elseif ( rule == 4 )

    suborder_xyz_n(1:4,1:suborder_num) = [ ...
      0, 0, 0, 3; ...
      0, 0, 1, 2; ...
      1, 1, 1, 0 ]';

    suborder_xyz_d = 3;

    suborder_w_n(1:suborder_num) = [ 1, 0, 9 ];

     suborder_w_d = 40;

  elseif ( rule == 5 )

    suborder_xyz_n(1:4,1:suborder_num) = [ ...
      0, 0, 0, 4; ...
      0, 0, 3, 1; ...
      2, 2, 0, 0; ...
      1, 1, 0, 2; ...
      1, 1, 1, 1 ]';

    suborder_xyz_d = 4;

    suborder_w_n(1:suborder_num) = [ -5, 16, -12, 16, 128 ];

     suborder_w_d = 420;

  elseif ( rule == 6 )

    suborder_xyz_n(1:4,1:suborder_num) = [ ...
      0, 0, 0, 5; ...
      0, 0, 4, 1; ...
      0, 0, 3, 2; ...
      1, 1, 0, 3; ...
      2, 2, 1, 0; ...
      1, 1, 1, 2  ]';

    suborder_xyz_d = 5;

    suborder_w_n(1:suborder_num) = [ 33, -35, 35, 275, -75, 375 ];

    suborder_w_d = 4032;

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
      -7, 24, -30, 0, 40, 30, 180, -45, 0 ];

    suborder_w_d = 1400;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'NCC_TETRAHEDRON_SUBRULE - Fatal error!\n' );
    fprintf ( 1, '  Illegal RULE = %d\n', rule );
    error ( 'NCC_TETRAHEDRON_SUBRULE - Fatal error!' )

  end

  suborder_xyz(1:4,1:suborder_num) = ...
    suborder_xyz_n(1:4,1:suborder_num) / suborder_xyz_d;

  suborder_w(1:suborder_num) = ...
    suborder_w_n(1:suborder_num) / suborder_w_d;

  return
end
