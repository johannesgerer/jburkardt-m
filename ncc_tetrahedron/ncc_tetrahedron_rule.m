function [ xyz, w ] = ncc_tetrahedron_rule ( rule, order_num )

%*****************************************************************************80
%
%% NCC_TETRAHEDRON_RULE returns the points and weights of an NCC rule.
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
%    Input, integer ORDER_NUM, the order (number of points) of the rule.
%
%    Output, real XYZ(3,ORDER_NUM), the points of the rule.
%
%    Output, real W(ORDER_NUM), the weights of the rule.
%

%
%  Get the suborder information.
%
  suborder_num = ncc_tetrahedron_suborder_num ( rule );

  suborder = ncc_tetrahedron_suborder ( rule, suborder_num );

  [ suborder_xyz, suborder_w ] = ncc_tetrahedron_subrule ( rule, suborder_num );
%
%  Expand the suborder information to a full order rule.
%
  o = 0;

  for s = 1 : suborder_num

    if ( suborder(s) == 1 )

      xyz(1:3,o+1) = suborder_xyz(1:3,s);
      w(o+1) = suborder_w(s);

      o = o + 1;
%
%  Fourfold symmetry on (A,A,A,B)
%
%    123 AAA
%    124 AAB
%    142 ABA
%    412 BAA
%
    elseif ( suborder(s) == 4 )

      xyz(1:3,o+1) = suborder_xyz( [ 1, 2, 3 ], s );
      xyz(1:3,o+2) = suborder_xyz( [ 1, 2, 4 ], s );
      xyz(1:3,o+3) = suborder_xyz( [ 1, 4, 2 ], s );
      xyz(1:3,o+4) = suborder_xyz( [ 4, 1, 2 ], s );
      w(o+1:o+4) = suborder_w(s);

      o = o + 4;
%
%  Sixfold symmetry on (A,A,B,B):
%
%    123 (A,A,B)
%    132 (A,B,A),
%    134 (A,B,B)
%    312 (B,A,A)
%    314 (B,A,B)
%    341 (B,B,A)
%
    elseif ( suborder(s) == 6 )

      xyz(1:3,o+1) = suborder_xyz( [ 1, 2, 3 ], s );
      xyz(1:3,o+2) = suborder_xyz( [ 1, 3, 2 ], s );
      xyz(1:3,o+3) = suborder_xyz( [ 1, 3, 4 ], s );
      xyz(1:3,o+4) = suborder_xyz( [ 3, 1, 2 ], s );
      xyz(1:3,o+5) = suborder_xyz( [ 3, 1, 4 ], s );
      xyz(1:3,o+6) = suborder_xyz( [ 3, 4, 1 ], s );
      w(o+1:o+6) = suborder_w(s);

      o = o + 6;
%
%  Twelvefold symmetry on (A,A,B,C):
%
%    123 (A,A,B)
%    124 (A,A,C)
%    132 (A,B,A)
%    134 (A,B,C)
%    142 (A,C,A)
%    143 (A,C,B)
%    312 (B,A,A)
%    314 (B,A,C)
%    341 (B,C,A)
%    412 (C,A,A)
%    413 (C,A,B)
%    431 (C,B,A)
%
    elseif ( suborder(s) == 12 )

      xyz(1:3,o+1)  = suborder_xyz( [ 1, 2, 3 ], s );
      xyz(1:3,o+2)  = suborder_xyz( [ 1, 2, 4 ], s );
      xyz(1:3,o+3)  = suborder_xyz( [ 1, 3, 2 ], s );
      xyz(1:3,o+4)  = suborder_xyz( [ 1, 3, 4 ], s );
      xyz(1:3,o+5)  = suborder_xyz( [ 1, 4, 2 ], s );
      xyz(1:3,o+6)  = suborder_xyz( [ 1, 4, 3 ], s );
      xyz(1:3,o+7)  = suborder_xyz( [ 3, 1, 2 ], s );
      xyz(1:3,o+8)  = suborder_xyz( [ 3, 1, 4 ], s );
      xyz(1:3,o+9)  = suborder_xyz( [ 3, 4, 1 ], s );
      xyz(1:3,o+10) = suborder_xyz( [ 4, 1, 2 ], s );
      xyz(1:3,o+11) = suborder_xyz( [ 4, 1, 3 ], s );
      xyz(1:3,o+12) = suborder_xyz( [ 4, 3, 1 ], s );
      w(o+1:o+12) = suborder_w(s);

      o = o + 12;
%
%  24 fold symmetry on (A,B,C,D):
%
%    123 (A,B,C)
%    124 (A,B,D)
%    132 (A,C,B)
%    134 (A,C,D)
%    142 (A,D,B)
%    143 (A,D,C)
%    213 (B,A,C)
%    214 (B,A,D)
%    231 (B,C,A)
%    234 (B,C,D)
%    241 (B,D,A)
%    243 (B,D,C)
%    312 (C,A,B)
%    314 (C,A,D)
%    321 (C,B,A)
%    324 (C,B,D)
%    341 (C,D,A)
%    342 (C,D,B)
%    412 (D,A,B)
%    413 (D,A,C)
%    421 (D,B,A)
%    423 (D,B,C)
%    431 (D,C,A)
%    432 (D,C,B)
%
    elseif ( suborder(s) == 24 )

      xyz(1:3,o+1)  = suborder_xyz( [ 1, 2, 3 ], s );
      xyz(1:3,o+2)  = suborder_xyz( [ 1, 2, 4 ], s );
      xyz(1:3,o+3)  = suborder_xyz( [ 1, 3, 2 ], s );
      xyz(1:3,o+4)  = suborder_xyz( [ 1, 3, 4 ], s );
      xyz(1:3,o+5)  = suborder_xyz( [ 1, 4, 2 ], s );
      xyz(1:3,o+6)  = suborder_xyz( [ 1, 4, 3 ], s );

      xyz(1:3,o+7)  = suborder_xyz( [ 2, 1, 3 ], s );
      xyz(1:3,o+8)  = suborder_xyz( [ 2, 1, 4 ], s );
      xyz(1:3,o+9)  = suborder_xyz( [ 2, 3, 1 ], s );
      xyz(1:3,o+10) = suborder_xyz( [ 2, 3, 4 ], s );
      xyz(1:3,o+11) = suborder_xyz( [ 2, 4, 1 ], s );
      xyz(1:3,o+12) = suborder_xyz( [ 2, 4, 3 ], s );

      xyz(1:3,o+13) = suborder_xyz( [ 3, 1, 2 ], s );
      xyz(1:3,o+14) = suborder_xyz( [ 3, 1, 4 ], s );
      xyz(1:3,o+15) = suborder_xyz( [ 3, 2, 1 ], s );
      xyz(1:3,o+16) = suborder_xyz( [ 3, 2, 4 ], s );
      xyz(1:3,o+17) = suborder_xyz( [ 3, 4, 1 ], s );
      xyz(1:3,o+18) = suborder_xyz( [ 3, 4, 2 ], s );

      xyz(1:3,o+19) = suborder_xyz( [ 4, 1, 2 ], s );
      xyz(1:3,o+20) = suborder_xyz( [ 4, 1, 3 ], s );
      xyz(1:3,o+21) = suborder_xyz( [ 4, 2, 1 ], s );
      xyz(1:3,o+22) = suborder_xyz( [ 4, 2, 3 ], s );
      xyz(1:3,o+23) = suborder_xyz( [ 4, 3, 1 ], s );
      xyz(1:3,o+24) = suborder_xyz( [ 4, 3, 2 ], s );
      w(o+1:o+24) = suborder_w(s);

      o = o + 24;

    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'NCC_TETRAHEDRON_RULE - Fatal error!\n' );
      fprintf ( 1, '  Illegal SUBORDER(%d) = %d\n', s, suborder(s) );
      error ( 'NCC_TETRAHEDRON_RULE - Fatal error!' );

    end

  end

  return
end
