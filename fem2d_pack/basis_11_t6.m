function [ bi, dbidx, dbidy ] = basis_11_t6 ( t, i, p )

%*****************************************************************************80
%
%% BASIS_11_T6: one basis at one point for the T6 element.
%
%  Discussion:
%
%    The routine is given the coordinates of the nodes of a triangle. 
%        
%           3
%          / \
%         6   5
%        /     \
%       1---4---2
%
%    It evaluates the quadratic basis function B(I)(X,Y) associated with
%    node I, which has the property that it is a quadratic function
%    which is 1 at node I and zero at the other five nodes.
%
%    This routine assumes that the sides of the triangle are straight,
%    so that the midside nodes fall on the line between two vertices.
%
%    This routine relies on the fact that each basis function can be
%    written as the product of two linear factors, which are easily
%    computed and normalized.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,6), the coordinates of the nodes.
%
%    Input, integer I, the index of the desired basis function.
%    I should be between 1 and 6.
%
%    Input, real P(2), the coordinates of a point at which the basis
%    function is to be evaluated.
%
%    Output, real BI, DBIDX, DBIDY, the values of the basis function
%    and its X and Y derivatives.
%
  if ( i < 1 | 6 < i )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BASIS_11_T6 - Fatal error!\n' );
    fprintf ( 1, '  Basis index I is not between 1 and 6.\n' );
    fprintf ( 1, '  I = ', i );
    error ( 'BASIS_11_T6 - Fatal error!' );
  end
%
%  Determine the pairs of nodes.
%
  if ( i <= 3 )
    j1 = i4_wrap ( i + 1, 1, 3 );
    j2 = i4_wrap ( i + 2, 1, 3 );
    k1 = i + 3;
    k2 = i4_wrap ( i + 5, 4, 6 );
  else
    j1 = i - 3;
    j2 = i4_wrap ( i - 3 + 2, 1, 3 );
    k1 = i4_wrap ( i - 3 + 1, 1, 3 );
    k2 = i4_wrap ( i - 3 + 2, 1, 3 );
  end
%
%  Evaluate the two linear factors GF and HF, 
%  and their normalizers GN and HN.
%
  gf = ( p(1)    - t(1,j1) ) * ( t(2,j2) - t(2,j1) ) ...
     - ( t(1,j2) - t(1,j1) ) * ( p(2)    - t(2,j1) );

  gn = ( t(1,i)  - t(1,j1) ) * ( t(2,j2) - t(2,j1) ) ...
     - ( t(1,j2) - t(1,j1) ) * ( t(2,i)  - t(2,j1) );  

  hf = ( p(1)    - t(1,k1) ) * ( t(2,k2) - t(2,k1) ) ...
     - ( t(1,k2) - t(1,k1) ) * ( p(2)    - t(2,k1) );

  hn = ( t(1,i)  - t(1,k1) ) * ( t(2,k2) - t(2,k1) ) ...
     - ( t(1,k2) - t(1,k1) ) * ( t(2,i)  - t(2,k1) );
%
%  Construct the basis function and its derivatives.
%
  bi =        ( gf                  / gn ) * (   hf                  / hn );

  dbidx =   ( ( t(2,j2) - t(2,j1) ) / gn ) * (   hf                  / hn ) ...
          + (   gf                  / gn ) * ( ( t(2,k2) - t(2,k1) ) / hn );

  dbidy = - ( ( t(1,j2) - t(1,j1) ) / gn ) * (   hf                  / hn ) ...
          - (   gf                  / gn ) * ( ( t(1,k2) - t(1,k1) ) / hn );

  return
end

