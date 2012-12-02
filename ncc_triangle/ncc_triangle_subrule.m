function [ suborder_xyz, suborder_w ] = triangle_ncc_subrule ( rule, suborder_num )

%*****************************************************************************80
%
%% TRIANGLE_NCC_SUBRULE returns a compressed NCC rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2007
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

    suborder_xyz_n(1:3,1:suborder_num) = [ ...
      1,  1, 1 ]';

    suborder_xyz_d = 3;

    suborder_w_n(1:suborder_num) = [ 1 ];

    suborder_w_d = 1;

  elseif ( rule == 2 )

    suborder_xyz_n(1:3,1:suborder_num) = [ ...
      1, 0, 0 ]';

    suborder_xyz_d = 1;

    suborder_w_n(1:suborder_num) = [ 1 ];

    suborder_w_d = 3;

  elseif ( rule == 3 )

    suborder_xyz_n(1:3,1:suborder_num) = [ ...
      1, 1, 0 ]';

    suborder_xyz_d = 2;

    suborder_w_n(1:suborder_num) = [ 1 ];

     suborder_w_d = 3;

  elseif ( rule == 4 )

    suborder_xyz_n(1:3,1:suborder_num) = [ ...
      3, 0, 0; ...
      2, 1, 0; ...
      1, 1, 1 ]';

    suborder_xyz_d = 3;

    suborder_w_n(1:suborder_num) = [ 4, 9, 54 ];

     suborder_w_d = 120;

  elseif ( rule == 5 )

    suborder_xyz_n(1:3,1:suborder_num) = [ ...
      3, 1, 0; ...
      2, 2, 0; ...
      2, 1, 1 ]';

    suborder_xyz_d = 4;

    suborder_w_n(1:suborder_num) = [ 4, -1, 8 ];

     suborder_w_d = 45;

  elseif ( rule == 6 )

    suborder_xyz_n(1:3,1:suborder_num) = [ ...
      5, 0, 0; ...
      4, 1, 0; ...
      3, 2, 0; ...
      3, 1, 1; ...
      2, 2, 1 ]';

    suborder_xyz_d = 5;

    suborder_w_n(1:suborder_num) = [ 11, 25, 25, 200, 25 ];

    suborder_w_d = 1008;

  elseif ( rule == 7 )

    suborder_xyz_n(1:3,1:suborder_num) = [ ...
      5, 1, 0; ...
      4, 2, 0; ...
      4, 1, 1; ...
      3, 3, 0; ...
      3, 2, 1; ...
      2, 2, 2 ]';

    suborder_xyz_d = 6;

    suborder_w_n(1:suborder_num) = [ 36, -27, 72, 64, 72, -54 ];

    suborder_w_d = 840;

  elseif ( rule == 8 )

    suborder_xyz_n(1:3,1:suborder_num) = [ ...
      7, 0, 0; ...
      6, 1, 0; ...
      5, 2, 0; ...
      5, 1, 1; ...
      4, 3, 0; ...
      4, 2, 1; ...
      3, 3, 1; ...
      3, 2, 2 ]';

    suborder_xyz_d = 7;

    suborder_w_n(1:suborder_num) = [ 1336, 2989, 3577, 32242, 2695, ...
      -6860, 44590, 3430 ];

    suborder_w_d = 259200;

  elseif ( rule == 9 )

    suborder_xyz_n(1:3,1:suborder_num) = [ ...
      7, 1, 0; ...
      6, 2, 0; ...
      6, 1, 1; ...
      5, 3, 0; ...
      5, 2, 1; ...
      4, 4, 0; ...
      4, 3, 1; ...
      4, 2, 2; ...
      3, 3, 2 ]';

    suborder_xyz_d = 8;

    suborder_w_n(1:suborder_num) = [ ...
      368, -468, 704, 1136, 832, -1083, 672, -1448, 1472 ];

    suborder_w_d = 14175;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'NCC_TRIANGLE_SUBRULE - Fatal error!\n' );
    fprintf ( 1, '  Illegal RULE = %d\n', rule );
    error ( 'NCC_TRIANGLE_SUBRULE - Fatal error!' )

  end

  suborder_xyz(1:3,1:suborder_num) = ...
    suborder_xyz_n(1:3,1:suborder_num) / suborder_xyz_d;

  suborder_w(1:suborder_num) = ...
    suborder_w_n(1:suborder_num) / suborder_w_d;

  return
end
